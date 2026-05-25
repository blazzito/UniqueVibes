var TranslationsData = {
	data: []
};

const Translations = new Proxy(TranslationsData, {
	get(target, prop) {
		if (prop in target.data) {
			return target.data[prop];
		}
		return `Missing Key ${String(prop)}`;
	}
});
var flash = document.getElementById('flash');
var Gobold = new FontFace('Gobold', 'url(fonts/gobold.ttf)');
let firstTime = true;
let firstTimeDispatch = true;
let dispatch_interval;
let permissions = {};
let jobData = {};
let jobCategories = {};
let radioLoaded = false;
let alertTiming = false;
let currentReport = null;
let currentReportLocked = false;

let actualEvidence;
let intervalAlert;
let frecuenciaActual = null;
let broadcastButtons;
let currentHueDeg = 0;
let lastBodyCamData = {};

let onDuty = true;
let policeTabSelected;
let defaultImage = './img/default.jpg';
let homeTabSetuped = false;
let dataTableLanguage = null;
let tags = null;
let condecorates = null;
let divisions = null;
let currentK9Data = {};
let availableInsurances = [];
let availableLicensesTypes = [];

let lastFriendsTab = null;

let policeHtmlLoaded = false;
let isInitializing = false;

function loadPoliceTemplate() {
	$.get('./apps/police.html?t=' + Date.now(), function (data) {
		if (data) {
			$('.apps').html(data);
			policeHtmlLoaded = true;
		}
	}).fail(function () {
		console.error('Failed to fetch police.html');
	});
}

loadPoliceTemplate();

function HasPermissionMenu(permName) {
	if (permissions[jobData.name] == undefined) {
		$('.police .duty-alert .animate__animated').html(
			`${jobData.name} ${Translations.NoPermissionsConfigured}`
		);
		$('.police .tab-content').addClass('blur');
		$('.police .duty-alert').fadeIn(300, function () {
			setTimeout(() => {
				$('.police .duty-alert').fadeOut(300, function () {
					$('.police .duty-alert .animate__animated').html(
						Translations.NotInDuty
					);
				});
				$('.police .tab-content').removeClass('blur');
			}, 3000);
		});
		return;
	}
	return jobData.level < permissions[jobData.name][permName];
}

function SetColor(RotateDeg) {



}

function SetupJobTemplate() {
	if (!policeFunctions || !policeFunctions.getCategory) return;
	let category = policeFunctions.getCategory();
	if (!category) return;
	let hueDeg = policeFunctions.getHueDeg(category);
	SetColor(hueDeg || 0);
}

function HasPermission(permName) {
	if (permissions[jobData.name] == undefined) {

		return;
	}
	return jobData.level < permissions[jobData.name][permName];
}

function closeMenu() {
	if (typeof stopRobberyPoll === 'function') stopRobberyPoll();
	if (currentReport && currentReportLocked) {
		TriggerCallback('origen_police:police:UnlockReport', { reportid: currentReport }).done((cb) => { });
		currentReportLocked = false;
		$('.police .informes .title-2 .btn-finish-report').removeClass('btn-finish-report').addClass('btn-edit-report').html(`<i class="fas fa-edit"></i> <span>Editar Informe</span>`);
		currentReport = null;
	}
	$.post('https://origen_police/close', JSON.stringify({}));
	$('.screen').removeClass('show');
	$('.home').off('keydown');
	setTimeout(() => {
		$('.lista-comercios').css('opacity', 0);
	}, 100);
	isInitializing = false;
}

function isTypingElement(element) {
	if (!element) return false;
	const tag = (element.tagName || '').toLowerCase();
	return (
		tag === 'input' ||
		tag === 'textarea' ||
		tag === 'select' ||
		element.isContentEditable === true
	);
}

function closeSelectorModal(containerSelector) {
	const $container = $(containerSelector);
	if ($container.length > 0 && $container.is(':visible')) {
		const $box = $container.find('.personas-box:visible').first();
		if ($box.length > 0) {
			$box.removeClass('scale-in').addClass('scale-out');
		}
		$container.fadeOut(300);
		return true;
	}
	return false;
}

function closeAnyModalByBackspace() {
	if ($('.c-modal').length > 0) {
		CloseModal();
		return true;
	}

	if (closeSelectorModal('.police .evidencias-container')) return true;
	if (closeSelectorModal('.police .vehiculos-container')) return true;
	if (closeSelectorModal('.police .personas-container')) return true;

	if ($('.police .multas-container:visible').length > 0) {
		$('.police .multas-container').fadeOut(300);
		return true;
	}

	return false;
}

function eventKeydown() {
	$(document).off('keydown.tabletClose').on('keydown.tabletClose', function (event) {
		var keycode = event.keyCode ? event.keyCode : event.which;

		if ((keycode === 8 || event.key === 'Backspace') && !isTypingElement(event.target)) {
			if (closeAnyModalByBackspace()) {
				event.preventDefault();
				return;
			}
		}

		if (keycode == '118' || keycode == '27') {
			closeMenu();
		}
	});
}

function sendNotification(type, title, message) {

	if (message === undefined) {
		message = title || '';
		if (type === 'success') title = 'Correcto';
		else if (type === 'error') title = 'Error';
		else title = 'Aviso';
	}

	let id = Math.floor(Math.random() * 10000);
	let icon = 'fas fa-bell';
	if (type == 'success') {
		icon = 'fas fa-circle-check';
	} else if (type == 'error') {
		icon = 'fas fa-circle-xmark';
	} else if (type == 'info') {
		icon = 'fas fa-circle-info';
	}
	$('.notifications').append(`
        <div class="notification animate__fast animate__animated animate__bounceInDown ${type}" id="${id}">
                    <div class="icon">
                        <i class="${icon}"></i>
                    </div>
                    <div class="info">
                        <div class="name">${title}</div>
                        <div class="message">${message || ''}</div>
                    </div>
                </div>
    `);
	setTimeout(function () {
		$(`#${id}`)
			.removeClass('animate__bounceInDown')
			.addClass('animate__bounceOutUp')
			.fadeOut(500, function () {
				$(this).remove();
			});
	}, 3000);
}

window.addEventListener('message', function (event) {
	if (event.data.action == 'UpdateAdminStatus' && event.data.isAdmin) {
		// Ensure the new admin panel button is shown
		$(".open-admin-panel-btn").css("display", "flex");
	}

	if (event.data.action == 'HelicamUpdate') {
		const $radar = $('.helicam-radar');
		if (event.data.toggle) {
			if ($radar.css('display') === 'none') {
				$radar.show();
			}
			if (event.data.model) $('#heli-model').text(event.data.model);
			if (event.data.plate) $('#heli-plate').text(event.data.plate);
			if (event.data.speed !== undefined) $('#heli-speed').text(Math.round(event.data.speed));

			const $status = $('#heli-status');
			if (event.data.locked) {
				$status.text("SISTEMA BLOQUEADO").addClass('status-locked').removeClass('status-tracking');
			} else {
				$status.text("ESCANER ACTIVO").addClass('status-tracking').removeClass('status-locked');
			}
		} else {
			$radar.hide();
		}
		return;
	}
	if (event.data.action == 'alpr') {
		if (event.data.finfo) {
			$('#matricula-1').text(event.data.finfo.plate);
			$('#speed-1').text(event.data.finfo.kmh);
			$('#modelo-1').text(event.data.finfo.name);
			if (event.data.finfo.wanted) {
				$('#matricula-1, #modelo-1').addClass('is-wanted');
			} else {
				$('#matricula-1, #modelo-1').removeClass('is-wanted');
			}
		}
		if (event.data.rinfo) {
			$('#matricula-2').text(event.data.rinfo.plate);
			$('#speed-2').text(event.data.rinfo.kmh);
			$('#modelo-2').text(event.data.rinfo.name);
			if (event.data.rinfo.wanted) {
				$('#matricula-2, #modelo-2').addClass('is-wanted');
			} else {
				$('#matricula-2, #modelo-2').removeClass('is-wanted');
			}
		}
	}
	else if ((event.data.action == "translations" && TranslationsData.data.length == 0) || event.data.action == "UpdateTranslations") {
		TranslationsData.data = Object.assign(TranslationsData.data, event.data.translations);
		const transalateElements = $('[translate]');
		transalateElements.each(function () {
			const key = $(this).attr('translate');
			if ($(this).attr('translateOnce') == undefined && TranslationsData.data[key]) {
				$(this).html(TranslationsData.data[key])
			}
		});
		fetch('translationsRecived', {});
	} else if (event.data.action == 'balpr') {
		if (event.data.block) {
			$('.block').show();
			if (event.data.wanted) {
				$('.cod9').show();
			} else {
				$('.cod9').hide();
			}
		} else {
			$('.block').hide();
			$('.cod9').hide();
		}
	} else if (event.data.action == 'showalpr') {
		$('.menu').show();
		$('.block').hide();
		$('.cod9').hide();
		$(".speed-metric").text(FormattedMetric[event.data.metric]);
	} else if (event.data.action == 'hidealpr') {
		$('.menu').hide();
		$('.block').hide();
		$('.cod9').hide();
	} else if (event.data.action == 'showphoto') {
		$('.foto-informe').attr('src', event.data.url);
		$('.informe').hide();
		$('.foto-informe').show();
		$('.block-informe').fadeIn(300);
	} else if (event.data.action == 'updateStats') {
		const $item = $(`.tab-content[tab="k9"] .action-police[id-attr="${event.data.id}"]`);
		if ($item.length > 0) {
			if (event.data.type === 'skin') {
				$item.find('.k9-cur-val').text(`${event.data.texture + 1}/${event.data.maxTexture}`);
			} else {
				$item.find('.k9-cur-val').text(`${event.data.drawable + 1}/${event.data.maxDrawable} (${event.data.texture + 1}/${event.data.maxTexture})`);
			}
		} else if (event.data.id === 0 && event.data.type === 'skin') {

			$(`.tab-content[tab="k9"] .action-police[event="police_k9:client:CommandTexture"] .k9-cur-val`).text(`${event.data.texture + 1}/${event.data.maxTexture}`);
		}
	} else if (event.data.action == 'AnalizeEvidences') {
		AnalizeEvidences(event.data.list, event.data.date);
	} else if (event.data.action == 'Location') {
		if (!event.data.street || !event.data.cardinal) return $('.location').fadeOut(300);;
		$('.location').fadeIn(300);
		$('.location span').text(event.data.street + ' | ' + event.data.cardinal);
	} else if (event.data.action == 'HideLocation') {
		$('.location').fadeOut(300);
	} else if (event.data.action == 'RadarFlash') {
		flash.play();
		setTimeout(() => {
			$('.radar-flash').show();
			$('.radar-flash').fadeOut(1500);
		}, 50);
	} else if (event.data.action == 'ViewBadge') {
		if (event.data.type == 'LSPD') DrawLSPDBadge(event.data.grade, event.data.n);
		else if (event.data.type == 'BCSD') DrawBCSDBadge(event.data.grade, event.data.n);
		else if (event.data.type == 'FIB') DrawFIBBadge(event.data.url, event.data.name);
		else if (event.data.type == 'EMS') DrawEMSBadge(event.data.grade, event.data.n);
		else HideBadges();
	} else if (event.data.action == 'Federal') {
		if (event.data.mins)
			$('.federal')
				.html(Translations.RemainSentance + ' ' + event.data.mins + ' ' + (event.data.mins == 1 ? Translations.Month.slice(0, -1) : Translations.Month))
				.fadeIn(300);
		else $('.federal').fadeOut(300);
	} else if (event.data.action == 'nosignal') {
		if (event.data.toggle) $('.nosignal').show();
		else $('.nosignal').hide();
	} else if (event.data.action == 'OpenQuickAccess') {
		if (event.data.translations && TranslationsData.data.length == 0) {
			TranslationsData.data = Object.assign(TranslationsData.data, event.data.translations);
			const transalateElements = $('[translate]');
			transalateElements.each(function () {
				const key = $(this).attr('translate');
				$(this).html(Translations[key]);
			});
			fetch('translationsRecived', {});
		}
		permissions = event.data.permissions;
		jobData = event.data.jobData;
		jobCategories = event.data.jobCategories || jobCategories;
		loadQuickActions();
		currentK9Data = event.data.k9Data || {};

		if (event.data.tabs) {
			if (lastFriendsTab == null) {
				const defaultTab = event.data.tabs.find(t => t.defaultSelected);
				lastFriendsTab = defaultTab ? defaultTab.index : event.data.tabs[0].index;
			}
			$('.friends .police-tab-list .police-tab').remove();
			(event.data.tabs || []).forEach((value) => {
				if (!value.hidden) {
					$(".friends .police-tab-list > .d-flex").before(`
						<div class="police-tab ${value.index == lastFriendsTab ? 'selected' : ''}" tab="${value.index}">
							<i class="${value.icon}"></i>
						</div>`);

					if (value.index == lastFriendsTab) {
						$(".friends .tab-content").removeClass("active").hide();
						$(".friends .tab-content[tab='" + value.index + "']")
							.addClass("active")
							.show();
					}
				}
			});

			$('.friends .interaccion-list .col-4').remove();
			(event.data.objects || []).forEach(value => {
				if (!value.hidden) {
					let actionAttr = "";
					if (value.event) {
						actionAttr = `event="${value.event}"`;
					} else if (value.serverEvent) {
						actionAttr = `serverevent="${value.serverEvent}"`;
					} else {
						actionAttr = `command="${value.customEvent ? value.customEvent : `plceobj ${value.name}`}"`;
					}
					$(".interaccion-list .row").append(`
						<div class="col-4 p-1">
							<div class="com-item flex-column action-police ${value.customClass || ''}" ${actionAttr} ${value.dontClose ? 'dontClose' : ''}>
								<img src="./img/icons/${value.icon}" class="com-img">
								<div class="com-title">${Translations[value.translation]}</div>
							</div>
						</div>`);
				}
			});

			const populateActionList = (tabName, items) => {
				const $container = $(`.tab-content[tab="${tabName}"] .interaccion-list`);
				$container.html('');

				(items || []).forEach(item => {
					if (!item.hidden) {
						if (item.header) {
							$container.append(`
								<div class="title-1" translate="${item.translation}">${Translations[item.translation] || item.translation}</div>
							`);
						} else {
							let $lastContainer = $container.find('.citizen-interaction').last();

							if ($lastContainer.length === 0 || $container.children().last().hasClass('title-1')) {
								$container.append('<div class="citizen-interaction"></div>');
								$lastContainer = $container.find('.citizen-interaction').last();
							}

							let actionAttr;
							if (item.event != null) {
								actionAttr = `event="${item.event}"`;
							} else if (item.serverEvent != null) {
								actionAttr = `serverevent="${item.serverEvent}"`;
							} else {
								actionAttr = `command="${item.command}"`;
							}

							let extraAttrs = "";
							if (item.id) extraAttrs += ` id-attr="${item.id}"`;
							if (item.contextEvent) extraAttrs += ` context-event="${item.contextEvent}"`;
							if (item.skill) extraAttrs += ` skill="${item.skill}"`;

							$lastContainer.append(`
								<div class="action-police ${item.customClass || ''}" ${actionAttr} ${item.dontClose ? 'dontClose' : ''} ${extraAttrs}>
									<i class="${item.icon}"></i> 
									<div translate="${item.translation}">${Translations[item.translation] || item.translation}</div>
									${item.dontClose && tabName === 'k9' ? '<span class="k9-cur-val"></span>' : ''}
								</div>
							`);
						}
					}
				});
			};

			populateActionList('interaccion', event.data.interactions);
			populateActionList('guns', event.data.holster);
			populateActionList('k9', event.data.k9);
			updateK9SkillsUI();
		}

		PlayTransition()
		$('.friends').addClass('show').fadeIn(500);
		$('.friends .friends-bg').off('click').on('click', function () {
			$('.friends').removeClass('show');
			$.post('https://origen_police/focus', JSON.stringify({}));
		});
		radioFunctions.setFrecuencias();
		$(".color").removeClass("occupied");
		if (event.data.usedColors) {
			Object.keys(event.data.usedColors).forEach(color => {
				$(`.color[number="${color}"]`).addClass("occupied");
			});
		}
	} else if (event.data.action == 'UpdateUsedColors') {
		$(".color").removeClass("occupied");
		if (event.data.colors) {
			Object.keys(event.data.colors).forEach(color => {
				$(`.color[number="${color}"]`).addClass("occupied");
			});
		}
	} else if (event.data.radio) {
		radioFunctions.radioNetEvents(event.data);
	} else if (event.data.action == 'UpdateRadioAnimUI') {
		const anim = event.data.anim;
		$('.radio_anim').find('.com-item').removeClass('com-selected');
		$(`.radio_anim[anim="${anim}"]`).find('.com-item').addClass('com-selected');
	} else if (event.data.action == 'ShowCarMegaphone') {
		$('.carmic').fadeIn(300);
	} else if (event.data.action == 'HideCarMegaphone') {
		$('.carmic').fadeOut(300);
	} else if (event.data.action == 'SyncQuick') {
		if (event.data.sprite) {
			$('.ref').removeClass('active');
			$('.ref[blip="' + event.data.sprite + '"]').addClass('active');
		} else if (event.data.color) {
			$('.color').removeClass('active');
			$('.color[number="' + event.data.color + '"]').addClass('active');
		} else if (event.data.ready) {

			$('.check-dispo').prop('checked', true);
		} else {
			$('.check-dispo').prop('checked', false);
		}
	} else if (event.data.action == 'ToggleReadyKeybind') {
		const currentState = $('.check-dispo').prop('checked');
		$('.check-dispo').prop('checked', !currentState).trigger('change');
	} else if (event.data.action == 'ShowAlerts') {
		if (firstTimeDispatch) {
			exportEvent('origen_police', 'GetKeyBinds').done((cb) => {
				if (cb) {
					Object.entries(cb).map(([key, value]) => {
						$(
							".dispatch .config-list .key-selector[action='" + value + "']"
						).text(key);
					});
				}
			});
			firstTimeDispatch = false;
		}
		if (event.data.value != null) {
			event.data.value === true ? $('.dispatch').addClass('show') : $('.dispatch').removeClass('show');
			return;
		}
		$('.dispatch').toggleClass('show');
	} else if (event.data.action == 'SetAlert') {
		if (dispatch_interval) {
			clearInterval(dispatch_interval);
		}
		dispatchFunctions.addNewAlert(
			event.data.message,
			event.data.distance,
			event.data.street,
			event.data.code,
			event.data.count,
			event.data.total,
			event.data.ago,
			event.data.title,
			event.data.new,
			event.data.left,
			event.data.metadata,
			event.data.annotation,
			event.data.central,
			event.data.playerID
		);

		if (typeof alertsFunctions !== 'undefined' && alertsFunctions.upsertAlert) {
			let hotCoords = event.data.coords || null;
			if (!hotCoords && typeof centralFunctions !== 'undefined' && Array.isArray(centralFunctions.alerts)) {
				const incomingCode = Number(event.data.code);
				const sameCode = centralFunctions.alerts.find((a) => {
					const aCode = Number(a.code);
					if (Number.isFinite(incomingCode) && Number.isFinite(aCode)) {
						return aCode === incomingCode;
					}
					return String(a.code).trim() === String(event.data.code).trim();
				});
				if (sameCode && sameCode.coords) hotCoords = sameCode.coords;
			}
			const hotAlert = {
				...event.data,
				coords: hotCoords || event.data.coords || null,
				time: event.data.ago != null ? event.data.ago : event.data.time
			};
			alertsFunctions.upsertDispatchAlert(hotAlert);
		}
	} else if (event.data.action == 'UpdateAlertCount') {
		if (typeof dispatchFunctions !== 'undefined' && dispatchFunctions.updateAlertCount) {
			dispatchFunctions.updateAlertCount(event.data.total);
		}
	} else if (event.data.action == 'NoAlert') {
		$('.dispatch .alerts-container .alert-list').html(
			`<div class="text-muted p-2 w-100 text-center" style="font-size:1.3vh;">${Translations.NoAlertRecived}</div>`
		);
		$('.actual-alert').html('0');
		$('.total-alert').html('0');
	} else if (event.data.action == 'copy') {
		copyToClipboard(event.data.value);
	} else if (event.data.action == 'WantedLevel') {
		if (event.data.value > 0) {
			$('.stars img.show').removeClass('show');

			$('.stars img').each((i) => {
				if (i <= event.data.value - 1) {
					$('.stars img').eq(i).addClass('show');
				}
			});
		} else {
			$('.stars img.show').removeClass('show');
		}
	} else if (event.data.action == "DisconnectAllFreqs") {
		DisconnectAllFreqs();
	} else if (event.data.action == 'addRobbery') {

		if (typeof robberiesFunctions !== 'undefined') {
			robberiesFunctions.addRobbery({
				id: event.data.id,
				type: event.data.type,
				location: event.data.location,
				playerId: event.data.playerId,
				timestamp: Date.now()
			});
		}
	} else if (event.data.action == 'removeRobbery') {

		if (typeof robberiesFunctions !== 'undefined') {
			robberiesFunctions.removeRobbery(event.data.id);
		}
	} else if (event.data.action == 'addAlert') {

		if (typeof alertsFunctions !== 'undefined') {
			alertsFunctions.addAlert({
				id: event.data.id,
				type: event.data.type,
				location: event.data.location,
				playerId: event.data.playerId,
				coords: event.data.coords,
				timestamp: Date.now()
			});
		}
	} else if (event.data.action == 'removeAlert') {

		if (typeof alertsFunctions !== 'undefined') {
			alertsFunctions.removeAlert(event.data.id);
		}
	} else if (event.data.open) {
		permissions = event.data.permissions;
		jobData = event.data.jobData;
		jobCategories = event.data.jobCategories;

		if (isInitializing) return;
		isInitializing = true;

		let attempts = 0;
		const initOpening = () => {
			try {
				if (!policeHtmlLoaded || typeof policeFunctions === 'undefined' || !policeFunctions.openTab) {
					attempts++;
					if (attempts % 10 === 0) {
						let missing = [];
						if (!policeHtmlLoaded) missing.push("HTML Template");
						if (typeof policeFunctions === 'undefined') missing.push("policeFunctions");
						else if (!policeFunctions.openTab) missing.push("policeFunctions.openTab");

					}
					if (attempts > 100) {
						console.error("Tablet failed to initialize: Timeout waiting for dependencies.");

						isInitializing = false;
						return;
					}
					if (!policeHtmlLoaded && attempts % 20 === 0) loadPoliceTemplate();
					setTimeout(initOpening, 50);
					return;
				}
				if (!event.data.translations) {
					console.error("No translations received in open event!");
					isInitializing = false;
					return;
				}
				TranslationsData.data = event.data.translations;
				availableInsurances = event.data.insurances || [];
				availableLicensesTypes = event.data.licensesTypes || [];

				$('.screen').addClass('show');
				PlayTransition();
				eventKeydown();
				const transalateElements = $('[translate]');
				transalateElements.each(function () {
					const key = $(this).attr('translate');
					if (BlacklistedTranslations.includes(key)) return;
					if (key == "placeholder" && $(this).attr('placeholder').includes("{{")) {
						let placeholder = $(this).attr('placeholder').replace("{{", "").replace("}}", "");
						$(this).attr("placeholder", event.data.translations[placeholder]);
						$(this).attr("translate", null);
					} else {
						if (event.data.translations[key]) {
							$(this).html(event.data.translations[key]);
						}
					}
				});

				SetupJobTemplate();
				if (!homeTabSetuped) {
					policeFunctions.openTab(1, true, '.police-home');
					homeTabSetuped = true;

					setTimeout(() => {
						if (typeof initHomeMap === 'function') {
							initHomeMap();
						}
					}, 800);
				}
				OnTranslationsReady();
				if (event.data.options && event.data.options.GuideBtn)
					$(".guide-button").css("display", "flex");

				isInitializing = false;

			} catch (err) {
				console.error("Error during tablet initialization:", err);
				isInitializing = false;
			}
		};

		initOpening();
	} else if (event.data.action) {

		switch (event.data.action) {
			case 'CloseRadioTab':
				$('.tab-name').each(function (yo) {
					if ($(this).text() == 'Radio') {
						policeFunctions.closeTab($(this));
					}
				});
				break;
			case 'HideCamHud':
				$('.cam-overlay').fadeOut(300);
				$('.helicam-veh-info').hide();
				break;
			case 'HelicamUpdate':
				break;

			case 'RpolMessage':
				centralFunctions.addRpolMessage(event.data.message);
				break;

			case 'UpdateCentralPositions':
				!event.data.Cops instanceof Array
					? (event.data.Cops = Object.values(event.data.Cops))
					: null;

				centralFunctions.updateAgentesTable(event.data.Cops);
				centralFunctions.updatePoliceCarsMap(event.data.VehicleTrackeds);
				break;
			case 'recieveLowCall':
				if (typeof alertsFunctions !== 'undefined' && alertsFunctions.upsertDispatchAlert && event.data.alert) {

					const alertForHome = {
						...event.data.alert,
						coords: event.data.alert.coords ? {
							x: event.data.alert.coords.x,
							y: event.data.alert.coords.y,
							z: event.data.alert.coords.z
						} : null
					};
					alertsFunctions.upsertDispatchAlert(alertForHome);
				}
				break;
			case 'ReceiveAlert':
				centralFunctions.addAlert(event);

				break;

			case 'LoadStoredAlert':
				centralFunctions.addStoredAlert(event);
				break;

			case 'AddCentralMark':
				switch (event.data.data.icon) {
					case 'radar':
						CreateBlip(
							mapCentral,
							event.data.id,
							{
								x: event.data.data.objectCoords.x,
								y: event.data.data.objectCoords.y
							},
							MarkerBlips['radar'],
							`<div>${Translations.RadarOf} ${event.data.data.type == 1 ? Translations.Velocity : Translations.LicensePlate
							}</div>`
						);
						break;

					case 'traffic':
						mapFunctions.CreateCircle(
							mapCentral,
							event.data.id,
							{ x: event.data.data.coords.x, y: event.data.data.coords.y },
							event.data.data.radius,
							event.data.data.type == 'stop' ? 'red' : 'orange',
							event.data.data.type == 'stop' ? 'red' : 'orange',
							`<div>${event.data.data.type == 'stop'
								? Translations.TrafficStop
								: Translations.SpeedReduction
							}</div>`
						);
				}

				break;

			case 'EditAlert':
				centralFunctions.alerts.map((alert, i) => {
					if (alert.code == event.data.data.code) {
						Object.entries(event.data.data).map(([key, value]) => {
							alert[key] = value;
						});
						if (
							$(
								".police .tab .central .tabla-dispatch tbody tr[index='" +
								i +
								"']"
							).hasClass('selected')
						) {
							centralFunctions.setAlertShowing(alert, i);
						}
						if (event.data.data.unit) {
							let $units = $(
								'.police .tab .central .tabla-dispatch tbody #alert-' +
								alert.code
							).find('.units');
							if ($units.html() == '') {
								$units.html(event.data.data.unit);
							} else {
								$units.html(
									$units.html() + ' <br> ' + event.data.data.unit
								);
							}
						}
						if (typeof alertsFunctions !== 'undefined' && alertsFunctions.upsertDispatchAlert) {
							alertsFunctions.upsertDispatchAlert(alert);
						}
					}
				});
				break;

			case 'RemoveCentralMark':
				mapFunctions.destroyBlip(event.data.id);
				mapFunctions.destroyCircle(event.data.id);
				break;
			case 'ForceNotification':
				sendNotification('success', event.data.notify);
				break;
			case 'UpdateShapes':
				centralFunctions.updateShapes();
				break;
			case 'playsound':
				const s_temp = new Audio('sounds/' + event.data.soundid);
				s_temp.volume = 0.2;
				s_temp.play();
				break;
			case 'SetBodyCamEnabled':
				$('.cam-overlay .name').text(lastBodyCamData.name);
				$('.cam-overlay .other').text(lastBodyCamData.grade);
				setTimeout(() => {
					$.post('https://origen_police/close', JSON.stringify({}));
					$('.screen').removeClass('show');
					$('.cam-overlay').fadeIn(300);
				}, 800);
				break;
			case 'UpdateReport':
				if (currentReport == event.data.reportid && !currentReportLocked) {
					informesFunctions.loadInforme(event.data.reportid);
				}
				break;
			case 'DeleteReport':
				$('.police .report-list .report#report-' + event.data.reportid).fadeOut(300, function () {
					$(this).remove();
				});
				if (currentReport == event.data.reportid) {
					currentReport = null;
					currentReportLocked = false;
					$('.police .informes .informe-report').fadeOut(300, function () {
						$(this).html(`
							<div class="d-flex w-100 align-items-center flex-column" style="height: 73vh;">
								<h1>${Translations.SelectReport}</h1>
								<img src="./img/webp/document.webp">
							</div>
						`).fadeIn(300);
					});
				}
				break;
			case 'PlayCustomSound':
				PlayCustomSound(event.data.url, event.data.volume);
				break;
			case 'UpdateInsurances':
				availableInsurances = event.data.insurances || [];
				break;
			case 'UpdateLicensesTypes':
				availableLicensesTypes = event.data.licenses || [];
				break;
			case 'updateK9XP':
				currentK9Data.xp = event.data.xp;
				updateK9SkillsUI();
				break;
			case 'updateK9Skills':
				currentK9Data.skills = event.data.skills;
				updateK9SkillsUI();
				break;
			case 'updateMetadata':
				if (jobData) {
					if (event.data.metadata) {
						jobData.divisions = event.data.metadata.divisions || {};
						jobData.police_badge = event.data.metadata.police_badge || "0000";
					} else if (event.data.key == "divisions") {
						jobData.divisions = event.data.value || {};
					} else if (event.data.key == "police_badge") {
						jobData.police_badge = event.data.value || "0000";
					}
				}
				break;
			case 'updateJob':
				if (jobData) {
					jobData.name = event.data.jobData.name;
					jobData.level = event.data.jobData.grade.level;
					jobData.duty = event.data.jobData.onduty;
				}
				break;
			default:
				break;
		}
	} else if (event.data.setDuty) {
		policeFunctions.alternarServicio(event.data.duty)
	} else if (event.data.radioMenu) {
		radioFunctions.radioNetEventsMenu(event.data);
	}
});

$(document).ready(() => {
	$('.menu').draggable({
		containment: 'window'
	});

	$(document).on('keydown', function (event) {
		var keycode = event.keyCode ? event.keyCode : event.which;
		if (keycode == '27') {
			$('.block-informe').fadeOut(300);
			$.post('https://origen_police/focus', JSON.stringify({}));
			$('.friends').removeClass('show');
		}
	});

	Object.entries(ReferenceSprite).map(([key, value]) => {
		$('.ref-list').append(`
            <div class="ref" blip="${key}">
                <img src="${value}">
				${ReferenceLabels && ReferenceLabels[key] ? `<span class="ref-label">${ReferenceLabels[key]}</span>` : ''}
            </div>
        `);
	});

	Object.entries(ReferenceColor).map(([key, value], index) => {
		$('.color-list').append(`
            <div class="color d-flex justify-content-center align-items-center" number="${key}" style="background-color:${value}; text-shadow: 0 0 1vh black">${index + 1}</div>
        `);
	});
});

function dataURItoBlob(dataURI) {
	const byteString = atob(dataURI.split(',')[1]);
	const mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

	const ab = new ArrayBuffer(byteString.length);
	const ia = new Uint8Array(ab);

	for (let i = 0; i < byteString.length; i++) {
		ia[i] = byteString.charCodeAt(i);
	}

	const blob = new Blob([ab], { type: mimeString });
	return blob;
}

const nativeFetch = window.fetch;
window.fetch = function(event, data) {
	if (typeof event === 'string' && event.startsWith('http')) {
		return nativeFetch.apply(this, arguments);
	}
	return $.post('https://origen_police/' + event, JSON.stringify(data)).promise();
}

function exportEvent(script, event, data) {
	if (event == "SetMultiFrec" && data[1] != "none") {
		$(".reference-location-check").attr("disabled", false);
		$(".setting-list[setting='reference']").css("opacity", "1.0");
	}
	return $.post('https://' + script + '/' + event, JSON.stringify(data)).promise();
}

function TriggerCallback(event, data) {
	data.name = event;
	return $.post(
		'https://origen_police/TriggerCallback',
		JSON.stringify(data)
	).promise();
}

function timeStampToDate(timeStamp) {


	if (timeStamp < 10000000000) {
		timeStamp *= 1000;
	}

	let date = new Date(timeStamp);
	let day = date.getDate();
	let month = date.getMonth() + 1;
	let year = date.getFullYear();
	let hour = date.getHours();
	let minutes = date.getMinutes();

	if (day < 10) day = '0' + day;
	if (month < 10) month = '0' + month;
	if (hour < 10) hour = '0' + hour;
	if (minutes < 10) minutes = '0' + minutes;

	return { date: `${day}/${month}/${year}`, time: `${hour}:${minutes}` };
}

function isJsonString(str) {
	try {
		JSON.parse(str);
	} catch (e) {
		return false;
	}
	return true;
}

function OpenModal(title, content, footerButtons, closeText, width) {
	$('.screen').append(`
    <div class="c-modal fadeIn">
       <div class="modal-block">
            <div class="modal-content scale-in-2" style="width: ${width ? width + 'vh' : 'max-content'
		}">
                <div class="modal-header">

                    <h2 class="title">${title}</h2>
                </div>
                <div class="modal-body">
                    ${content}
                </div>
                <div class="modal-footer">
                    ${footerButtons}
                    <button class="btn-cancel" onclick='CloseModal()'>${closeText}</button>
                </div>
            </div>
        </div>
    </div>
    `);
}

function CloseModal() {
	$('.c-modal .modal-block .modal-content')
		.removeClass('scale-in-2')
		.addClass('scale-out-2');
	$('.c-modal')
		.removeClass('fadeIn')
		.fadeOut(500, function () {
			$(this).remove();
		});
}

function stringToUrl(string) {
	if (!string) return '';
	return String(string)
		.normalize('NFD')
		.replace(/[\u0300-\u036f]/g, '')
		.toLowerCase()
		.replace(/ /g, '-')
		.replace(/á/g, 'a')
		.replace(/é/g, 'e')
		.replace(/í/g, 'i')
		.replace(/ó/g, 'o')
		.replace(/ú/g, 'u')
		.replace(/ñ/g, 'n')
		.replace(/ü/g, 'u');
}

function secondsOrMinutes(seconds) {
	seconds = seconds / 1000;
	if (seconds < 60) {
		return seconds + ' ' + Translations.seconds;
	} else {
		return Math.floor(seconds / 60) + ' ' + Translations.minutes;
	}
}

function checkNumber(number) {
	if (number < 10) {
		return '000' + number;
	} else if (number < 100) {
		return '00' + number;
	} else if (number < 1000) {
		return '0' + number;
	} else {
		return number;
	}
}

function nameToId(name) {
	if (!name) return '';
	return String(name)
		.normalize('NFD')
		.replace(/[\u0300-\u036f]/g, '')
		.toLowerCase()
		.replace(/ /g, '-')
		.replace(/á/g, 'a')
		.replace(/é/g, 'e')
		.replace(/í/g, 'i')
		.replace(/ó/g, 'o')
		.replace(/ú/g, 'u')
		.replace(/ñ/g, 'n')
		.replace(/ü/g, 'u')
		.replace(/[^a-z0-9-]/g, '');
}




function stringToUrl(string) {
	if (!string) return '';
	return String(string)
		.normalize('NFD')
		.replace(/[\u0300-\u036f]/g, '')
		.toLowerCase()
		.replace(/ /g, '-')
		.replace(/á/g, 'a')
		.replace(/é/g, 'e')
		.replace(/í/g, 'i')
		.replace(/ó/g, 'o')
		.replace(/ú/g, 'u')
		.replace(/ñ/g, 'n')
		.replace(/ü/g, 'u');
}










function secondsOrMinutes(seconds) {
	if (seconds < 60) {
		return seconds + ` ${Translations.seconds}`
	} else {
		return Math.floor(seconds / 60) + ` ${Translations.minutes}`;
	}
}

function checkNumber(number) {
	if (number < 10) {
		return '000' + number;
	} else if (number < 100) {
		return '00' + number;
	} else if (number < 1000) {
		return '0' + number;
	} else {
		return number;
	}
}

function copyToClipboard(texto) {
	var elementoTemporal = document.createElement('textarea');
	elementoTemporal.value = texto;
	document.body.appendChild(elementoTemporal);
	elementoTemporal.select();
	elementoTemporal.setSelectionRange(0, 99999);
	document.execCommand('copy');
	document.body.removeChild(elementoTemporal);
}

function escapeHtml(str) {
	if (!str) return '';
	return String(str)
		.replace(/&/g, "&amp;")
		.replace(/</g, "&lt;")
		.replace(/>/g, "&gt;")
		.replace(/"/g, "&quot;")
		.replace(/'/g, "&#039;");
}

function updateK9SkillsUI() {
	if (!currentK9Data || currentK9Data.xp === undefined) {
		$('.k9-training-container').hide();
		return;
	}
	$('.k9-training-container').show();

	const xp = Number(currentK9Data.xp || 0);
	const skills = currentK9Data.skills || [];

	let unlockedSlots = 1;
	let nextThreshold = null;

	if (currentK9Data.progression && currentK9Data.progression.SpecialtySlots) {
		currentK9Data.progression.SpecialtySlots.forEach(tier => {
			if (xp >= tier.xp) {
				unlockedSlots = tier.slots;
			} else if (nextThreshold === null) {
				nextThreshold = tier;
			}
		});
	} else {
		// Fallback
		if (xp >= 500) unlockedSlots = 2;
		nextThreshold = xp < 500 ? { xp: 500 } : null;
	}

	const xpTarget = nextThreshold ? nextThreshold.xp : (currentK9Data.progression?.SpecialtySlots[currentK9Data.progression.SpecialtySlots.length - 1].xp || 500);
	const progress = Math.min((xp / xpTarget) * 100, 100);

	$('#k9-xp-text').text(`${xp.toFixed(1)} / ${xpTarget} XP`);
	$('#k9-xp-bar').css('width', `${progress}%`);

	$('#k9-slots-text').text(`Slots: ${skills.length}/${unlockedSlots}`);

	// Update specialty items status
	$('.k9-specialty-item').each(function () {
		const skill = $(this).attr('skill');
		const isSelected = skills.includes(skill);

		$(this).removeClass('active locked');

		if (isSelected) {
			$(this).addClass('active');
		} else if (skills.length >= unlockedSlots) {
			$(this).addClass('locked');
		}
	});

	// Handle appearance items stats
	if (currentK9Data.skin) {
		// Skin Texture
		const skinTex = currentK9Data.skin.texture || 0;
		$(`.tab-content[tab="k9"] .action-police[event="origen_police:client:k9:CommandTexture"] .k9-cur-val`).text(`${skinTex + 1}`);

		// Components
		if (currentK9Data.skin.comps) {
			Object.entries(currentK9Data.skin.comps).forEach(([id, data]) => {
				const $item = $(`.tab-content[tab="k9"] .action-police[id-attr="${id}"]`);
				$item.find('.k9-cur-val').text(`${data.drawable + 1} (${data.texture + 1})`);
			});
		}
	}
}

function toggleK9Specialty(skill) {
	if (!currentK9Data.skills) currentK9Data.skills = [];
	const idx = currentK9Data.skills.indexOf(skill);
	const xp = Number(currentK9Data.xp || 0);
	let unlockedSlots = 1;
	if (currentK9Data.progression && currentK9Data.progression.SpecialtySlots) {
		currentK9Data.progression.SpecialtySlots.forEach(tier => {
			if (xp >= tier.xp) unlockedSlots = tier.slots;
		});
	} else {
		if (xp >= 500) unlockedSlots = 2;
	}

	if (idx > -1) {
		return;
	} else {
		if (currentK9Data.skills.length >= unlockedSlots) return;
		currentK9Data.skills.push(skill);
	}

	updateK9SkillsUI();
	fetch('quickaction', { action: 'save_skills', skills: currentK9Data.skills, serverevent: 'origen_police:server:k9:SaveDogSkills' });
}