function DisconnectAllFreqs() {
	$(this).parent().find('.freq-name').removeClass('text-success').text(Translations.Disconnected);
	$(this)
		.animate(
			{
				height: '0vh',
				opacity: 0
			},
			500,
			'easeOutBounce'
		)
		.hide(0);

	$('.alertas .radio-alert-status')
		.removeClass('text-success')
		.html(`<i class="fas fa-walkie-talkie"></i> ${Translations.Disconnected}`);

	frecuenciaActual = null;
	$('.radio-button').removeClass('active');
	$('.radio-state-text').text(Translations.Disconnected || 'DESCONECTADA');
	$(".reference-location-check").attr("disabled", true);
	$(".setting-list[setting='reference']").css("opacity", "0.5");
	exportEvent('origen_police', 'SetMultiFrec', [null, 'none']);
}

radioFunctions = {

	freqList: {
		sur: [],
		norte: [],
		especiales: [],
		ems: []
	},
	radioNetEventsMenu: (event) => {
		switch (event.radioMenu) {
			case 'AddPlayerMultiFrec':
				radioFunctions.addPlayerToFrecMenu(event.frec, event.id, event.data);
				if (event.i) {
					radioFunctions.setFrecCabeceraMenu(event.frec);
				}
				break;
			case 'Talking':
				radioFunctions.talkingMenu(event.target, event.value);
				break;
			case 'RemovePlayerMultiFrec':
				radioFunctions.removePlayerFromFrecMenu(event.frec, event.id);
				break;

			case 'SetMuted':
				radioFunctions.setMutedMenu(event.id, event.value);
				break;

			case 'SetReady':
				radioFunctions.setReadyMenu(event.id, event.value);
				break;

			case 'Disconnected':
				$('.police .radio .zona-conectar').fadeOut(300);
				$('.radio-button').removeClass('active');
				$('.radio-state-text').text(Translations.Disconnected || 'DESCONECTADA');
				break;
		}
		if (event.radioMenu !== 'Talking') {
			setTimeout(() => {
				if (typeof radioFunctions.updatePatrolHUD === 'function') {
					radioFunctions.updatePatrolHUD();
				}
			}, 100);
		}
	},
	loadRadioEventsMenu: () => {
		$(document).on('click', '.radio-button', function () {
			if (HasPermission("Radio")) {
				$('.police .duty-alert .animate__animated').html(
					Translations.NoPermission
				);
				$('.police .tab-content-menu').addClass('blur');
				$('.police .duty-alert').fadeIn(300, function () {
					setTimeout(() => {
						$('.police .duty-alert').fadeOut(300, function () {
							$('.police .duty-alert .animate__animated').html(
								Translations.NotInDuty
							);
						});
						$('.police .tab-content-menu').removeClass('blur');
					}, 3000);
				});
				return;
			}

			let valid;
			$('.tab-name').each(function (yo) {
				if ($(this).text() == 'Radio') {
					valid = $(this);
				}
			});

			if (!valid) {
				fetch('LoadPolicePage', { page: 'radio' }).done((cb) => {
					if (cb) {
						$('.radio-button').addClass('active');
						$('.radio-state-text').text(typeof frecuenciaActual !== 'undefined' ? frecuenciaActual : 'CONECTADA');
						policeFunctions
							.policeNavigation('Radio', $('.police-radio').html())
							.then(() => {
								radioFunctions.setFrecuenciasMenu().then(() => {
									setTimeout(() => {
										if (cb != 'none')
											radioFunctions.setFrecCabeceraMenu(cb);
										radioFunctions.loadAllPlayersMenu();

										radioFunctions.sortableChannelsMenu();
									}, 300);
								});
							});
					} else {
						$('.radio-button').removeClass('active');
						$('.radio-state-text').text(Translations.Disconnected || 'DESCONECTADA');
						$('.police .duty-alert .animate__animated').html(
							Translations.NoRadio
						);
						$('.police .tab-content-menu').addClass('blur');
						$('.police .duty-alert').fadeIn(300, function () {
							setTimeout(() => {
								$('.police .duty-alert').fadeOut(300, function () {
									$('.police .duty-alert .animate__animated').html(
										Translations.NotInDuty
									);
								});
								$('.police .tab-content-menu').removeClass('blur');
							}, 3000);
						});
					}
				});
			} else {
				policeFunctions.openTab($(valid), false);
			}
		});
		$(document).on('click', '.police .radio-category-menu .toggle-category', function () {
			if (HasPermission("EnterRadioFreq")) return sendNotification('error', Translations.NoPermissionPage);

			$(this).parent().toggleClass('toggle');
		});
		$(document).on('click', '.police .radio-category-menu .category-title', function (e) {
			if (HasPermission("EnterRadioFreq")) return sendNotification('error', Translations.NoPermissionPage);

			if ($(e.target).closest('.category-buttons').length > 0) return;
			let id = $(this).parent().attr('frec');
			exportEvent('origen_police', 'SetMultiFrec', [null, id]);
		});
		$(document).on('click', '.police .btn-teclas', function () {
			if (HasPermission("EnterRadioFreq")) return sendNotification('error', Translations.NoPermissionPage);
			exportEvent('origen_police', 'GetBinds', []).done((cb) => {
				Object.entries(cb).map(([key, value]) => {
					cb[value] = key;
				});

				let buttons = '';
				fetch('LoadRadioBinds', {}).done((radioBinds) => {
					radioBinds = radioBinds.binds

					radioBinds.forEach((bind) => {
						const key = bind.label;
						buttons += `
							<div class="col-8 mb-2 d-flex flex-column justify-content-center">
								<h4>${key.replaceAll("-", " ")}</h4>
								<div class="text-description" style="font-size: 1.1vh; opacity: 0.7; font-weight: 300; font-family: 'Quicksand'; color: #fff;">${bind.description || ''}</div>
							</div>
							<div class="col-4 mb-2">
								<button class="btn-modal w-100 key-${cb[key] || '-'
							}" id="${key}" onclick="radioFunctions.setAsignacionMenu(this)">${cb[key] || ' - '
							}</button>
							</div>`;
					});

					OpenModal(
						`${Translations.ShortCuts}`,
						`<div class="row" style="width:45vh;">
							<div class="col-8 mb-2 d-flex flex-column justify-content-center">
								<h4>${Translations.AlternateMute}</h4>
								<div class="text-description" style="font-size: 1.1vh; opacity: 0.7; font-weight: 300; font-family: 'Quicksand'; color: #fff;">Silencia o activa el sonido de la radio</div>
							</div>
							<div class="col-4 mb-2">
								<button class="btn-modal w-100 key-${cb['mute'] || '-'
						}" id="mute" onclick="radioFunctions.setAsignacionMenu(this)">${cb['mute'] || ' - '
						}</button>
							</div>
							
						${buttons}
						</div>`,
						`<div></div>`,
						Translations.Close
					);
				});
			});
		});

		$(document).on('click', '.police .radio .zona-conectar .connected, .police .radio .zona-conectar .desconectar', function (e) {
			e.preventDefault();
			e.stopPropagation();

			$('.police .radio .zona-conectar').fadeOut(300);
			frecuenciaActual = null;
			$('.police .radio .zona-conectar .frecuencia-actual').text(Translations.Disconnected || 'DESCONECTADA');
			$('.radio-button').removeClass('active');
			$('.radio-state-text').text(Translations.Disconnected || 'DESCONECTADA');
			$(".reference-location-check").attr("disabled", true);
			$(".setting-list[setting='reference']").css("opacity", "0.5");
			exportEvent('origen_police', 'SetMultiFrec', [null, 'none']);
		});

		$(document).on('click', '.category-toggle-btn', function () {
			const category = $(this).data('category');
			$(this).toggleClass('active');
			const isVisible = $(this).hasClass('active');
			$(`.radio-column.${category}`).toggle(isVisible);


			let savedStates = JSON.parse(localStorage.getItem('radio_category_visibility') || '{}');
			savedStates[category] = isVisible;
			localStorage.setItem('radio_category_visibility', JSON.stringify(savedStates));
		});

		$(document).on('click', '.category-header', function () {
			const target = $(this).data('target');
			$(target).slideToggle(300);
			$(this).toggleClass('collapsed');
		});


		$(document).on('mousedown', '.police .tab .radio .central-btn', function (e) {
			e.stopPropagation();
			const categoryName = $(this).attr('category');
			if (categoryName && window.categoryCentralFreqs && window.categoryCentralFreqs[categoryName]) {

				const centralFreq = window.categoryCentralFreqs[categoryName];
				const freqList = [centralFreq];
				exportEvent('origen_police', 'StartTalkRadio', freqList);
			}
		});

		$(document).on('mouseup', '.police .tab .radio .central-btn', function (e) {
			e.stopPropagation();
			exportEvent('origen_police', 'StopTalkRadio', {});
		});


		$(document).on('mousedown', '.police .tab .radio .broadcast-category-btn', function (e) {
			e.stopPropagation();
			const categoryName = $(this).attr('category');
			if (categoryName && window.categoryFrequencies && window.categoryFrequencies[categoryName]) {

				const freqList = window.categoryFrequencies[categoryName];
				exportEvent('origen_police', 'StartTalkRadio', freqList);
			}
		});

		$(document).on('mouseup', '.police .tab .radio .broadcast-category-btn', function (e) {
			e.stopPropagation();
			exportEvent('origen_police', 'StopTalkRadio', {});
		});
	},

	setFrecuenciasMenu: () => {
		return new Promise(function (resolve, reject) {
			fetch('LoadFrecListCustom', {}).done((freclist) => {
				freclist = (freclist && freclist.freq) ? freclist.freq : [];
				if (!Array.isArray(freclist)) freclist = Object.values(freclist);
				$('.police .radio .frecuencias').html('');
				$("#radioCategoryToggles").html("");
				$("#radioContainerFreqs").html("");

				const savedStates = JSON.parse(localStorage.getItem('radio_category_visibility') || '{}');


				window.categoryFrequencies = {};

				window.categoryCentralFreqs = {};

				freclist.forEach((frecData) => {
					const key = frecData.category;
					const data = frecData.freqs || [];

					window.categoryFrequencies[key] = data.map(freq => stringToUrl(freq));

					const centralFreq = data.find(freq => freq.startsWith('Central'));
					if (centralFreq) {
						window.categoryCentralFreqs[key] = stringToUrl(centralFreq);
					}
				});

				freclist.forEach((frecData) => {
					const key = frecData.category;
					const data = frecData.freqs || [];
					const categoryUrl = stringToUrl(key);


					const isVisible = savedStates[categoryUrl] !== undefined ? savedStates[categoryUrl] : true;

					$("#radioCategoryToggles").append(`
						<div class="category-toggle-btn ${isVisible ? 'active' : ''}" data-category="${categoryUrl}">
							${key}
						</div>
					`);

					$("#radioContainerFreqs").append(`
					<div class="radio-column ${categoryUrl}" style="display: ${isVisible ? 'block' : 'none'}">
						<div class="bg-box h-max p-0 pt-2 pb-2">
							<div class="category-header-with-buttons">
								<h4 class="title-1-menu m-titles">${key}</h4>
								<div class="category-action-buttons">
									${key !== 'UNIDADES SAPD' ? `
										<div class="central-btn" title="Hablar a Central" category="${key}">
											<i class="fas fa-microphone"></i> Central
										</div>
									` : ''}
									<div class="broadcast-category-btn" title="Broadcast a todas las frecuencias" category="${key}">
										<i class="fas fa-broadcast-tower"></i> Broadcast
									</div>
								</div>
							</div>
							<div class="frecuencias ${categoryUrl}"></div>
						</div>
					</div>
					`);
					data.forEach((name) => {
						$(`.radio-column.${categoryUrl} .frecuencias`).append(`
						<div class="radio-category-menu toggle vacio" frec="${stringToUrl(
							name
						)}">
							<div class="category-title">
								${name}
							</div>
							<div class="connected-users text-danger">
								<i class="lni lni-users"></i> <span class="number">0</span>
							</div>
							<div class="toggle-category">
								<i class="lni lni-chevron-down"></i>
							</div>
							<div class="user-list" frecuencia="f-1">
	
							</div>
							<div class="no-users scale-in">
								${Translations.NoUsers}
							</div>
						</div>
						`);
					});
				});
				resolve();
			});
		});
	},

	updateChannelUsersMenu: (channel) => {
		if (!channel || !channel.length) return;
		const nUsers = channel.find('.radio-user').length;
		channel.find('.connected-users .number').text(nUsers);
		if (nUsers > 0) {
			channel
				.find('.connected-users')
				.removeClass('text-danger')
				.addClass('text-success');

			channel.removeClass('vacio toggle');
			channel.find('.no-users').css('display', 'none');
		} else {
			channel
				.find('.connected-users')
				.removeClass('text-success')
				.addClass('text-danger');
			channel.addClass('vacio').addClass('toggle');
			channel.find('.no-users').css('display', '');
		}
	},

	setSpeakingMenu: (user, speaking) => {
		if (speaking) {
			user.find('.radio-user .speaking').css('opacity', 1);
		} else {
			user.find('.radio-user .speaking').css('opacity', 0);
		}
	},

	setSilencedMenu: (user, silenced) => {
		if (silenced) {
			user.find('.radio-user .volume-muted').css('opacity', 1);
		} else {
			user.find('.radio-user .volume-muted').css('opacity', 0);
		}
	},

	loadAllPlayersMenu: () => {
		TriggerCallback('origen_police:GetMultiFrecs', {}).done((cb) => {
			if (cb) {
				Object.entries(cb).map(([key, value]) => {
					let aum;
					Object.entries(value).map(([id, data]) => {
						if (id == 0) aum = true;
						if (aum) id++;
						radioFunctions.addPlayerToFrecMenu(key, id, data);
					});
				});
			}

			$('.police .tab .central .radio-category-menu, .police .tab .radio .radio-category-menu').each(function () {
				radioFunctions.updateChannelUsersMenu($(this));
			});
			setTimeout(() => {
				if (typeof radioFunctions.updatePatrolHUD === 'function') {
					radioFunctions.updatePatrolHUD();
				}
			}, 200);
		});
	},

	addPlayerToFrecMenu: (frec, id, data) => {
		if (frec === frecuenciaActual) {
			PlayTalkOn();
		}

		const policeTabSelector = `.police .tab .radio .radio-category-menu[frec="${frec}"]`;
		const centralTabSelector = `.police .tab .central .radio-category-menu[frec="${frec}"]`;

		let divisionsHtml = '';
		if (data && data.divisions) {
			for (let i = 0; i < data.divisions.length; i++) {
				const division = data.divisions[i];
				if (division) {
					divisionsHtml += `<span class="user-division ms-1">
						<img src="./img/divisions/icons/${division}" class="division-icon">
					</span>`;
				}
			}
		}

		const userHtml = `
			<div class="radio-user source-${id}" source="${id}">
				<div class="d-flex align-items-center w-100 overflow-hidden">
					<span class="circle ${data.ready ? 'green' : 'red'}"></span>
					<span class="user-name">${data.name}</span>
					<span class="user-rango badge ms-2 bg-morado">${data.grade}</span>
					${divisionsHtml}
				</div>
				<div class="volume-muted" style="opacity: ${data.muted ? 1 : 0}">
					<img src="./img/volume-mute.png" class="radio-icon">
				</div>
				<div>
					<img src="./img/hablando.svg" class="speaking">
				</div>
			</div>
		`;

		const addUserIfNotExists = (selector) => {
			const userSelector = `${selector} .user-list .source-${id}`;
			if ($(userSelector).length === 0) {
				$(`${selector} .user-list`).append(userHtml);
			}
			$(selector).removeClass('toggle');
			radioFunctions.updateChannelUsersMenu($(selector));
		};

		addUserIfNotExists(policeTabSelector);
		addUserIfNotExists(centralTabSelector);
	},

	removePlayerFromFrecMenu: (frec, id) => {
		if (
			$(
				'.police .tab .radio .radio-category-menu[frec="' +
				frec +
				'"] .user-list .source-' +
				id +
				', .police .tab .central .radio-category-menu[frec="' +
				frec +
				'"] .user-list .source-' +
				id
			).length > 0
		) {
			$(
				'.police .tab .radio .radio-category-menu[frec="' +
				frec +
				'"] .user-list .source-' +
				id +
				', .police .tab .central .radio-category-menu[frec="' +
				frec +
				'"] .user-list .source-' +
				id
			).remove();
			radioFunctions.updateChannelUsersMenu(
				$('.police .tab .radio .radio-category-menu[frec="' + frec + '"]')
			);
			radioFunctions.updateChannelUsersMenu(
				$('.police .tab .central .radio-category-menu[frec="' + frec + '"]')
			);
		}
	},

	setMutedMenu: (target, value) => {
		$('.police .tab .radio-category-menu .source-' + target + ' .volume-muted').css(
			'opacity',
			value ? 1 : 0
		);
	},

	setReadyMenu: (target, value) => {
		$('.police .tab .radio-category-menu .source-' + target + ' .circle')
			.removeClass('red')
			.removeClass('green')
			.addClass(value ? 'green' : 'red');
	},

	talkingMenu: (target, value) => {
		if (!value) {
			PlayTalkOff()
		}
		$('.police .tab .radio-category-menu .source-' + target + ' .speaking').css(
			'opacity',
			value ? 1 : 0
		);
		if (value) {
			$(`.radio-patrol-user[data-source="${target}"]`).addClass('is-speaking');
		} else {
			$(`.radio-patrol-user[data-source="${target}"]`).removeClass('is-speaking');
		}
	},

	setAsignacionMenu: (btn) => {
		const prevTecla = $(btn).html().trim();
		$(btn).addClass('seleccionando').text(' - ');
		$(btn).on('keydown', function (event) {
			let tecla = false;
			let regex = /^[a-zA-Z0-9]+$/;
			let action = $(this).attr('id');
			if (teclas[event.keyCode]) {
				tecla = teclas[event.keyCode];
			} else {
				tecla = String.fromCharCode(event.keyCode).toUpperCase();
			}
			if (tecla && regex.test(tecla)) {
				if (tecla == 'ESCAPE' || tecla == 'ESC' || tecla == 'BACK') {
					$(btn).removeClass('seleccionando').off('keydown');
					exportEvent('origen_police', 'RadioRemoveKeyBind', [
						prevTecla
					]);
					$(btn)
						.removeClass('key-' + prevTecla)
						.addClass('key--')
						.html(' - ');
					return;
				}

				exportEvent('origen_police', 'RadioAddKeyBind', [
					'keyboard',
					tecla,
					action
				]);
				$(btn).removeClass('seleccionando').off('keydown');
				$('.key-' + tecla)
					.removeClass('key-' + tecla)
					.addClass('key--')
					.html(' - ');
				$(btn)
					.removeClass('key-' + prevTecla)
					.addClass('key-' + tecla)
					.html(tecla);
			}
		});
	},

	setFrecCabeceraMenu: (frec) => {
		frecuenciaActual = frec;
		$(".reference-location-check").attr("disabled", false);
		$('.radio-button').addClass('active');
		$('.radio-state-text').text(frec);
		const headerFreqHtml = `<img src="./img/webp/speaking.webp" style="width:3vh; margin-right:1vh;"> ${frec}`;


		$('.police .tab .radio .zona-conectar .connected .frecuencia-actual').html(headerFreqHtml);
		$('.police .tab .radio .zona-conectar').fadeIn(300);


		$('.police .tab .radio .app-title .connected .frecuencia-actual').html(headerFreqHtml);
		$('.police .tab .radio .app-title .zona-conectar').fadeIn(300);
	},

	setFrecuenciasCentralMenu: () => {
		return new Promise(function (resolve, reject) {
			fetch('LoadFrecListCustom', {}).done((radiodata) => {
				const buttons = radiodata.buttons;
				radiodata = radiodata.freq;
				if (radiodata) {
					if (!Array.isArray(radiodata)) radiodata = Object.values(radiodata);
					$('.police .central .central-freq').html('');
					$('.police .central .actions-title-buttons').html('');
					broadcastButtons = buttons || [];
					if (!Array.isArray(broadcastButtons)) broadcastButtons = Object.values(broadcastButtons);
					(broadcastButtons).forEach((btnData) => {
						const key = btnData.label;
						$('.police .central .actions-title-buttons').append(`
							<div
								action="${key}"
								class="broadcast d-flex align-items-center me-2">
								<i class="fa-solid fa-walkie-talkie me-1"></i>
								<div>${key}</div>
							</div>
						`);
					});


					window.categoryFrequencies = {};

					window.categoryCentralFreqs = {};

					radiodata.forEach((frecData) => {
						const key = frecData.category;
						const data = frecData.freqs || [];

						window.categoryFrequencies[key] = data.map(freq => stringToUrl(freq));

						const centralFreq = data.find(freq => freq.startsWith('Central'));
						if (centralFreq) {
							window.categoryCentralFreqs[key] = stringToUrl(centralFreq);
						}
					});

					radiodata.forEach((frecData) => {
						const key = frecData.category;
						const data = frecData.freqs || [];
						const categoryUrl = stringToUrl(key);

						$('.police .central .central-freq').append(`
							<div class="title-1-menu category-header-central" data-target=".central-freq-list.${categoryUrl}">
								<span>${key}</span>
								<div class="category-action-buttons-central">
									${key !== 'UNIDADES SAPD' ? `
										<div class="central-btn-central" title="Hablar a Central" category="${key}">
											<i class="fas fa-microphone"></i> Central
										</div>
									` : ''}
									<div class="broadcast-category-btn-central" title="Broadcast a todas las frecuencias" category="${key}">
										<i class="fas fa-broadcast-tower"></i> Broadcast
									</div>
								</div>
								<i class="fas fa-chevron-down toggle-icon"></i>
							</div>
							<div class="central-freq-list ${categoryUrl}"></div>
						`);

						data.forEach((name) => {
							$(`.police .central .central-freq .${categoryUrl}`).append(`
							<div class="radio-category-menu toggle vacio" frec="${stringToUrl(
								name
							)}">
								<div class="category-title">
									${name}
								</div>
								<div class="connected-users text-danger">
									<i class="lni lni-users"></i> <span class="number">0</span>
								</div>
								<div class="toggle-category">
									<i class="lni lni-chevron-down"></i>
								</div>
								<div class="user-list" frecuencia="f-1">
	
								</div>
								<div class="no-users scale-in">
									${Translations.NoUsersChannel}
								</div>
							</div>
							`);
						});
					});
				} else {
					$('.police .central .central-freq').html(
						`<div class="text-danger w-100 text-center text-uppercase">${Translations.NoRadio}</div>`
					);
				}

				resolve();
			});
		});
	},
	sortableChannelsMenu: () => {
		let updateCounter = 0;

		$('.user-list').sortable({
			connectWith: '.user-list',
			appendTo: 'body',
			helper: function (event, item) {
				const helper = item.clone();
				helper.addClass('radio-drag-helper');
				helper.css({
					width: item.outerWidth(),
					minWidth: item.outerWidth()
				});
				return helper;
			},
			zIndex: 2147483647,
			items: '.radio-user',
			placeholder: 'radio-hover',
			start: function (event, ui) {
				ui.helper.css('z-index', 2147483647);
				ui.placeholder.height(ui.item.outerHeight());
			},
			update: function (event, ui) {
				if (HasPermission("MovePlayerInRadio")) {
					sendNotification('error', Translations.NoPermissionPage);
					return;
				}
				updateCounter++;
				if (updateCounter == 2) {
					radioFunctions.updateChannelUsersMenu(ui.sender.parent());
					radioFunctions.updateChannelUsersMenu(ui.item.parent().parent());
					exportEvent('origen_police', 'MovePlayerMultiFrec', [
						$(ui.item).attr('source'),
						'police',
						$(ui.item).parent().parent().attr('frec')
					]);
				}
			},
			stop: function (event, ui) {
				updateCounter = 0;
			}
		});
	},

	speakToMenu: (frec) => {
		exportEvent('origen_police', 'StartTalkRadio', [frec, 'central']);
	},

	stopSpeakToMenu: () => {
		exportEvent('origen_police', 'StopTalkRadio', {});
	},


	radioLoad: () => {
		radioFunctions.loadAllPlayers();

		let updateCounter = 0;
		$('.user-list').sortable({
			connectWith: '.user-list',
			appendTo: 'body',
			helper: function (event, item) {
				const helper = item.clone();
				helper.addClass('radio-drag-helper');
				helper.css({
					width: item.outerWidth(),
					minWidth: item.outerWidth()
				});
				return helper;
			},
			zIndex: 2147483647,

			items: '.radio-user',
			placeholder: 'radio-hover',
			start: function (event, ui) {
				ui.helper.css('z-index', 2147483647);
				ui.placeholder.height(ui.item.outerHeight());
			},
			update: function (event, ui) {
				if (HasPermission("MovePlayerInRadio")) {
					fetch('notification', Translations.NoPermissionMoveUsers);
					return;
				}
				updateCounter++;
				if (updateCounter == 2) {
					radioFunctions.updateChannelUsers(ui.sender.parent());
					radioFunctions.updateChannelUsers(ui.item.parent().parent());
					exportEvent('origen_police', 'MovePlayerMultiFrec', [
						$(ui.item).attr('source'),
						'police',
						$(ui.item).parent().parent().attr('frec')
					]);
				}
			},
			stop: function (event, ui) {
				updateCounter = 0;
			}
		});
	},
	setFrecuencias: () => {
		return new Promise(function (resolve, reject) {
			fetch('LoadRadioCustom', {}).done((radiodata) => {
				if (radiodata) {
					if (radioLoaded) return;
					radioLoaded = true;
					$('.radio-list').html('');
					if (radiodata.myfrec) {
						radioFunctions.setFrecCabecera(radiodata.myfrec.toUpperCase());
					}
					let frList = radiodata.freclist || [];
					if (!Array.isArray(frList)) frList = Object.values(frList);
					frList.forEach((frecData) => {
						const key = frecData.category;
						const data = frecData.freqs || [];
						const categoryUrl = stringToUrl(key);

						$('.radio-list').append(`<div class="title-1 category-header" data-target=".radio-freq-list.${categoryUrl}">${key} <i class="fas fa-chevron-down toggle-icon"></i></div><div class="radio-freq-list ${categoryUrl}"></div>`);

						data.forEach((name) => {
							$(`.radio-list .${categoryUrl}`).append(
								`<div class="radio-category toggle vacio" frec="${stringToUrl(
									name
								)}">
									<div class="category-title">
										${name}
									</div>
									<div class="connected-users text-danger">
										<i class="lni lni-users"></i> <span class="number">0</span>
									</div>
									<div class="toggle-category">
										<i class="lni lni-chevron-down"></i>
									</div>
									<div class="user-list" frecuencia="f-1">
		
									</div>
									<div class="no-users scale-in">
										${Translations.NoUsers}
									</div>
								</div>`
							);
						});
					});
					radioFunctions.radioLoad();
				} else {
					radioLoaded = false;
					$('.radio-list').html(
						`<div class="text-danger w-100 text-center text-uppercase">${Translations.NoRadio}</div>`
					);
				}

				resolve();
			});
		});
	},
	radioNetEvents: (event) => {
		switch (event.radio) {
			case 'AddPlayerMultiFrec':
				radioFunctions.addPlayerToFrec(event.frec, event.id, event.data);
				if (event.i) {
					radioFunctions.setFrecCabecera(event.frec);
				}
				break;

			case 'Talking':
				radioFunctions.talking(event.target, event.value);
				break;

			case 'RemovePlayerMultiFrec':
				radioFunctions.removePlayerFromFrec(event.frec, event.id);
				break;

			case 'SetMuted':
				radioFunctions.setMuted(event.id, event.value);
				break;
			case 'SetReady':
				radioFunctions.setReady(event.id, event.value);
				break;
			case 'Disconnected':
				radioFunctions.setFrecCabecera('NONE');
				break;
		}
		if (event.radio !== 'Talking') {
			setTimeout(() => {
				if (typeof radioFunctions.updatePatrolHUD === 'function') {
					radioFunctions.updatePatrolHUD();
				}
			}, 100);
		}
	},
	updateChannelUsers: (channel) => {
		const nUsers = channel.find('.radio-user').length;
		channel.find('.connected-users .number').text(nUsers);
		if (nUsers > 0) {
			channel
				.find('.connected-users')
				.removeClass('text-danger')
				.addClass('text-success');

			channel.removeClass('vacio');
		} else {
			channel
				.find('.connected-users')
				.removeClass('text-success')
				.addClass('text-danger');
			channel.addClass('vacio').addClass('toggle');
		}
	},
	setSpeaking: (user, speaking) => {
		if (speaking) {
			user.find('.radio-user .speaking').css('opacity', 1);
		} else {
			user.find('.radio-user .speaking').css('opacity', 0);
		}
	},

	setSilenced: (user, silenced) => {
		if (silenced) {
			user.find('.radio-user .volume-muted').css('opacity', 1);
		} else {
			user.find('.radio-user .volume-muted').css('opacity', 0);
		}
	},

	loadAllPlayers: () => {
		TriggerCallback('origen_police:GetMultiFrecs', {}).done((cb) => {
			if (cb) {
				Object.entries(cb).map(([key, value]) => {
					let aum;
					Object.entries(value).map(([id, data]) => {
						if (id == 0) aum = true;
						if (aum) id++;
						radioFunctions.addPlayerToFrec(key, id, data);
					});
				});
			}
		});
	},
	addPlayerToFrec: (frec, id, data) => {
		if (
			$('.radio .radio-category[frec="' + frec + '"] .user-list .source-' + id)
				.length == 0
		) {
			let divisionsHtml = '';
			if (data && data.divisions) {
				const divisionsToShow = data.divisions.slice(0, 4);

				for (let i = 0; i < divisionsToShow.length; i++) {
					const division = divisionsToShow[i];
					if (division) {
						divisionsHtml += `<span class="user-division ms-1">
							<img src="./img/divisions/icons/${division}" class="division-icon">
						</span>`;
					}
				}
			}
			$('.radio .radio-category[frec="' + frec + '"] .user-list').append(`
            <div class="radio-user source-${id}" source="${id}">
                <div class="d-flex align-items-center w-100 overflow-hidden">
                    <span class="circle ${data.ready ? 'green' : 'red'}"></span>
					<span class="user-name">${data.name}</span>
					<span class="user-rango badge ms-2 bg-morado">${data.grade}</span>
					${divisionsHtml}
                </div>
                <div class="volume-muted" style="${!data.muted ? 'opacity: 0' : 'opacity: 1'
				}">
                    <img src="./img/volume-mute.png" class="radio-icon">
                </div>
                <div>
                    <img src="./img/hablando.svg" class="speaking">
                </div>
            </div>
            `);
			$('.radio .radio-category[frec="' + frec + '"]').removeClass('toggle');
			radioFunctions.updateChannelUsers(
				$('.radio .radio-category[frec="' + frec + '"]')
			);
		}
	},
	removePlayerFromFrec: (frec, id) => {
		if (
			$('.radio .radio-category[frec="' + frec + '"] .user-list .source-' + id)
				.length > 0
		) {
			$(
				'.radio .radio-category[frec="' + frec + '"] .user-list .source-' + id
			).remove();
			radioFunctions.updateChannelUsers(
				$('.radio .radio-category[frec="' + frec + '"]')
			);
		}
	},

	setMuted: (target, value) => {
		$('.radio .radio-category .source-' + target + ' .volume-muted').css(
			'opacity',
			value ? 1 : 0
		);
	},

	setReady: (target, value) => {
		$('.radio .radio-category .source-' + target + ' .circle')
			.removeClass('red')
			.removeClass('green')
			.addClass(value ? 'green' : 'red');
	},

	talking: (target, value) => {
		$('.radio .radio-category .source-' + target + ' .speaking').css(
			'opacity',
			value ? 1 : 0
		);
		if (value) {
			$(`.radio-patrol-user[data-source="${target}"]`).addClass('is-speaking');
		} else {
			$(`.radio-patrol-user[data-source="${target}"]`).removeClass('is-speaking');
		}
	},
	setAsignacion: (btn) => {
		$(btn).addClass('seleccionando').text(' - ');
		$(btn).on('keydown', function (event) {

			let tecla = false;
			let regex = /^[a-zA-Z0-9]+$/;
			let action = $(this).attr('id');
			if (teclas[event.keyCode]) {
				tecla = teclas[event.keyCode];
			} else {
				tecla = String.fromCharCode(event.keyCode).toUpperCase();
			}
			if (tecla && regex.test(tecla)) {
				exportEvent('origen_police', 'RadioAddKeyBind', [
					'keyboard',
					tecla,
					action
				]);
				$(btn).removeClass('seleccionando').off('keydown');
				$('.key-' + tecla)
					.removeClass('key-' + tecla)
					.addClass('key--')
					.html(' - ');
				$(btn)
					.removeClass('key-' + $(btn).html().trim())
					.addClass('key-' + tecla)
					.html(tecla);
			}
		});
	},

	setFrecCabecera: (frec) => {
		if (frec != 'NONE') {
			frecuenciaActual = frec;
			$('.radio-button').addClass('active');
			$('.radio-state-text').text(frec);
			$('.radio .freq-name').text(frec).addClass('text-success');
			$('.alertas .radio-alert-status')
				.html('<i class="fas fa-walkie-talkie"></i> ' + frec)
				.addClass('text-success');
			$('.radio .connected-zone .disconnect-button').show(0).animate(
				{
					height: '2vh',
					opacity: 1
				},
				500,
				'easeInOutCubic'
			);
			if ($('.check-dispo').attr('disabled')) {
				$('.check-dispo').prop('checked', true);
				$('.alertas .disponibilidad-alert .no-dispo').fadeOut(300, function () {
					$('.alertas .disponibilidad-alert .dispo').fadeIn(300);
				});
			}
			$('.check-dispo').attr('disabled', false);
		} else {
			frecuenciaActual = null;
			$('.radio-button').removeClass('active');
			$('.radio-state-text').text(Translations.Disconnected || 'DESCONECTADA');
			$('.alertas .disponibilidad-alert .dispo').fadeOut(300, function () {
				$('.alertas .disponibilidad-alert .no-dispo').fadeIn(300);
			});
			$('.check-dispo').attr('disabled', true).prop('checked', false);
			$('.friends .connected-zone')
				.find('.freq-name')
				.removeClass('text-success')
				.text(Translations.Disconnected);
			$('.friends .connected-zone .disconnect-button')
				.animate(
					{
						height: '0vh',
						opacity: 0
					},
					500,
					'easeOutBounce'
				)
				.hide(0);
			$('.alertas .radio-alert-status')
				.removeClass('text-success')
				.html('<i class="fas fa-walkie-talkie"></i> ' + Translations.Disconnected);
		}
	},

	updatePatrolHUD: () => {
		const hud = $('.radio-patrol-hud');
		if (!frecuenciaActual || frecuenciaActual === 'NONE') {
			hud.fadeOut(300);
			return;
		}

		// Show HUD
		if (hud.css('display') === 'none') {
			hud.fadeIn(300);
		}

		hud.find('.radio-patrol-channel').text(frecuenciaActual);
		
		const usersContainer = hud.find('.radio-patrol-users');
		usersContainer.empty();

		const frecUrl = stringToUrl(frecuenciaActual);
		// Get users from the F7 menu or Tablet radio
		let users = [];
		const seen = new Set();

		$(`.radio-category-menu[frec="${frecUrl}"] .user-list .radio-user`).each(function() {
			const source = $(this).attr('source');
			if (!seen.has(source)) {
				users.push({
					source: source,
					name: $(this).find('.user-name').text(),
					speaking: $(this).find('.speaking').css('opacity') == 1,
					ready: $(this).find('.circle').hasClass('green')
				});
				seen.add(source);
			}
		});

		// Fallback to tablet DOM if F7 DOM didn't yield
		if (users.length === 0) {
			$(`.radio-category[frec="${frecUrl}"] .user-list .radio-user`).each(function() {
				const source = $(this).attr('source');
				if (!seen.has(source)) {
					users.push({
						source: source,
						name: $(this).find('.user-name').text(),
						speaking: $(this).find('.speaking').css('opacity') == 1,
						ready: $(this).find('.circle').hasClass('green')
					});
					seen.add(source);
				}
			});
		}

		users.forEach(user => {
			usersContainer.append(`
				<div class="radio-patrol-user ${user.speaking ? 'is-speaking' : ''}" data-source="${user.source}">
					<div class="name">${user.name}</div>
					<i class="fas fa-microphone mic-icon"></i>
				</div>
			`);
		});
	}
};

$(document).ready(function() {
	$('.radio-patrol-hud').draggable({
		containment: 'window'
	});
});