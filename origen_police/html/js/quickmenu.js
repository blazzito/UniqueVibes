function loadQuickActions() {
	$('.com-list .row').html('');
	let category = policeFunctions.getCategory();
	let selectedCodes = (category == 'ambulance') ? emsCodes : codes;

	selectedCodes.map((code) => {
		let color = '';
		if (code == 'QRR') {
			color = 'bg-qrr';
		} else if (code == 'QRR-B') {
			color = 'bg-ten-13b';
		} else if (code == 'QRR-C') {
			color = 'bg-qrr-c';
		} else if (code == 'Emergency') {
			color = 'bg-qrr';
		} else if (code == 'Cambio Jurisdiccion') {
			color = 'bg-jurisdiccion';
		}
		$('.com-list .row').append(`
        <div class="col-4 p-1">
            <div class="com-item ${color}">
                <div class="com-title">${code}</div>
            </div>
        </div>
        `);
	});
}


$('.tab-content.active').fadeIn(300);
$(document).on('click', '.friends .police-tab-list .police-tab', function () {
	const yo = $(this);
	let perm = true;
	if (yo.attr('tab') == "com-rad" && HasPermission("RadialCommunicationTab")) {
		perm = false;
	} else if (yo.attr('tab') == "radio" && HasPermission("RadioTab")) {
		perm = false;
	} else if (yo.attr('tab') == "interaccion" && HasPermission("InteractTab")) {
		perm = false;
	} else if (yo.attr('tab') == "guns" && HasPermission("HolsterTab")) {
		perm = false;
	} else if (yo.attr('tab') == "items" && HasPermission("ObjectPlacementTab")) {
		perm = false;
	}
	if (!perm) {
		return fetch('notification', Translations.NoTabPermission);
	}
	if (!$(this).hasClass('selected')) {
		$('.friends .police-tab').removeClass('selected');
		$(this).addClass('selected');
		lastFriendsTab = yo.attr('tab');
		if (yo.attr('tab') == 'radio') {
			radioFunctions.setFrecuencias();
		}
		$('.friends .tab-content.active')
			.removeClass('active')
			.fadeOut(150, function () {
				$(".friends .tab-content[tab='" + yo.attr('tab') + "']")
					.addClass('active')
					.fadeIn(150);
			});
	}
});
$(document).on('click', '.dispatch .police-tab-list .police-tab', function () {
	if (!$(this).hasClass('selected')) {
		$('.dispatch .police-tab').removeClass('selected');
		$(this).addClass('selected');
		const yo = $(this);
		$('.dispatch .tab-content.active')
			.removeClass('active')
			.fadeOut(150, function () {
				$(".dispatch .tab-content[tab='" + yo.attr('tab') + "']")
					.addClass('active')
					.fadeIn(150);
			});
	}
});

$(document).on('change', '.check-dispo', function () {
	if ($('.check-dispo').prop('checked')) {
		$('.alertas .disponibilidad-alert .no-dispo').fadeOut(300, function () {
			$('.alertas .disponibilidad-alert .dispo').fadeIn(300);
		});

		$('.dispatch .radio-alert-status').removeClass('text-danger').addClass('text-success');
	} else {
		$('.alertas .disponibilidad-alert .dispo').fadeOut(300, function () {
			$('.alertas .disponibilidad-alert .no-dispo').fadeIn(300);
		});

		$('.dispatch .radio-alert-status').removeClass('text-success').addClass('text-danger');
	}

	fetch('quickaction', {
		action: 'ToggleReady',
		state: $('.check-dispo').prop('checked')
	});
});


$(document).on('click', '.radio .radio-category .toggle-category, .friends .radio-category .toggle-category', function () {
	$(this).parent().toggleClass('toggle');
});

$(document).on('click', '.radio .radio-category .category-title, .friends .radio-category .category-title', function () {
	let id = $(this).parent().attr('frec') || $(this).closest('.radio-category').attr('frec');
	fetch('LoadPolicePage', { page: 'radio' }).done((cb) => {
		if (cb) {
			exportEvent('origen_police', 'SetMultiFrec', [null, id]);
		} else {
			sendNotification('error', Translations.NoRadio || 'No tienes radio.');
		}
	});
});

$(document).on('click', '.radio .disconnect-button', function () {
	DisconnectAllFreqs()
});


$(document).on('click', '.friends .title-1, .radio .title-1', function () {
	const $categoryTitle = $(this);
	const $nextElements = $categoryTitle.nextUntil('.title-1');


	$nextElements.filter('.radio-category').slideToggle(300);
});

$(document).on('click', '.ref', function () {
	let blip = $(this).attr('blip');
	$('.ref').removeClass('active');
	$(this).addClass('active');
	fetch('quickaction', { action: 'ReferenceIcon', id: blip });
});

$(document).on('click', '.color', function () {
	let number = $(this).attr('number');
	$('.color').removeClass('active');
	$(this).addClass('active');
	fetch('quickaction', { action: 'ReferenceColor', id: number });
});


$(document).on('click', '.com-list .com-item', function () {
	let code = $(this).find('.com-title').text();
	fetch('quickaction', { action: 'RadioCalls', id: code });
});

$(document).on('click', '.friends .action-police', function () {
	let command = $(this).attr('command');
	let event = $(this).attr('event');
	let serverEvent = $(this).attr('serverevent');
	let idAttr = $(this).attr('id-attr');

	if ($(this).hasClass('k9-specialty-item')) {
		const skill = $(this).attr('skill');
		toggleK9Specialty(skill);
		return;
	}

	if (command != undefined) {
		fetch('quickaction', { command: command, id: idAttr, dir: 1, button: 0 });

		if ($(this).attr("dontClose") != undefined) {
			return;
		}
	} else if (event != undefined) {
		let action = $(this).attr('event');
		fetch('quickaction', { event: action, id: idAttr, dir: 1, button: 0 });

		if ($(this).attr("dontClose") != undefined) {
			return;
		}
	} else if (serverEvent != undefined) {
		let action = $(this).attr('serverevent');
		fetch('quickaction', { serverevent: action, id: idAttr, dir: 1, button: 0 });

		if ($(this).attr("dontClose") != undefined) {
			return;
		}
	}

	$('.friends').removeClass('show');
	$.post('https://origen_police/focus', JSON.stringify({}));
});

$(document).on('contextmenu', '.friends .action-police[dontClose]', function (e) {
	e.preventDefault();
	let command = $(this).attr('command');
	let event = $(this).attr('event');
	let serverEvent = $(this).attr('serverevent');
	let idAttr = $(this).attr('id-attr');
	let contextEvent = $(this).attr('context-event');

	if (contextEvent) {
		fetch('quickaction', { event: contextEvent, id: idAttr, dir: 1, button: 2 });
	} else if (command != undefined) {
		fetch('quickaction', { command: command, id: idAttr, dir: -1, button: 2 });
	} else if (event != undefined) {
		fetch('quickaction', { event: event, id: idAttr, dir: -1, button: 2 });
	} else if (serverEvent != undefined) {
		fetch('quickaction', { serverevent: serverEvent, id: idAttr, dir: -1, button: 2 });
	}
});

$(".reference-location-check").on("change", function () {
	if (frecuenciaActual == null) return;
	fetch('SetLocation', { value: $(this).is(":checked") })
});

$(".body-cam-check").on("change", function () {
	fetch('SetBodyCamEnabled', { value: $(this).is(":checked") })
});

$(document).on("click", ".radio_anim", function () {
	PlayClick();

	let anim = parseInt($(this).attr("anim"));

	$(`.radio_anim`).find(".com-item").removeClass("com-selected");
	$(this).find(".com-item").addClass("com-selected");

	fetch("SetRadioAnim", { anim: anim });
});

function setVolumeIcon(volume) {
	let iconClass = '';
	if (volume <= 1) {
		iconClass = 'fa-volume-xmark';
	} else if (volume < 33) {
		iconClass = 'fa-volume-off';
	} else if (volume < 66) {
		iconClass = 'fa-volume-low';
	} else {
		iconClass = 'fa-volume-high';
	}
	$('.volume-icon i')
		.removeClass()
		.addClass('fas ' + iconClass);
}

function volumeSelector(crr) {
	const val = $(crr).val();
	setVolumeIcon(val);
	const progressElement = document.getElementById('progress-volumen');
	progressElement.value = val;
}

let lastVolumeUpdate = 0;
$(document).on("input", "#inp-musicvolume", function () {
	if (lastVolumeUpdate != 0 && Date.now() - lastVolumeUpdate < 300) return;
	lastVolumeUpdate = Date.now();
	const volume = $(this).val();
	fetch("SetVolume", parseInt(volume));
})