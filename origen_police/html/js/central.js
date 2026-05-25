centralFunctions = {
	alerts: [],
	heatAlerts: [],
	activeAlertsFilter: 'all',
	currentOperation: null,
	cachedOperations: {},
	cachedShapes: {},
	loadCentralEvents: () => {
		$(document).on('click', '.police .btn-police-central', function () {
			if (HasPermissionMenu("Dispatch")) {
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
				if ($(this).text() == Translations.Dispatch) {
					valid = $(this);
				}
			});
			if (!valid) {
				fetch('LoadPolicePage', { page: 'central' }).done((cb) => {
					if (cb) {
						centralFunctions.heatAlerts = cb;
						policeFunctions
							.policeNavigation(Translations.Dispatch, $('.police-central').html())
							.then(() => {
								TriggerCallback(
									'origen_police:server:OpenCentral',
									{}
								).done((cb) => {
									!cb.Cops instanceof Array
										? (cb.Cops = Object.values(cb.Cops))
										: null;

									if (cb.TrafficZones.length != 0) {
										cb.TrafficZones.map((zone, i) => {
											mapFunctions.CreateCircle(
												mapCentral,
												i + 1,
												{
													x: zone.coords.x,
													y: zone.coords.y
												},
												zone.radius,
												zone.type == 'stop' ? 'red' : 'orange',
												zone.type == 'stop' ? 'red' : 'orange',
												`<div>${zone.type == 'stop'
													? Translations.TrafficStop
													: Translations.SpeedReduction
												}</div>`
											);
										});
									}

									if (cb.Radars.length != 0) {
										cb.Radars.map((radar, i) => {
											CreateBlip(
												mapCentral,
												i + 1,
												{
													x: radar.objectCoords.x,
													y: radar.objectCoords.y
												},
												MarkerBlips['radar'],
												`<div>${Translations.RadarOf} ${radar.type == 1 ? Translations.Velocity : Translations.LicensePlate
												}</div>`
											);
										});
									}

									centralFunctions.updatePoliceCarsMap(
										cb.VehicleTrackeds
									);
									centralFunctions.updateAgentesTable(cb.Cops);
									centralFunctions.intervalAlerts();
								});

								cargarMapaCentral(centralFunctions.heatAlerts);
								radioFunctions.setFrecuenciasCentralMenu().then(() => {
									setTimeout(() => {
										radioFunctions.loadAllPlayersMenu();
										centralFunctions.setupRadioDeptFilters();
										radioFunctions.sortableChannelsMenu();
									}, 300);
								});
							});
					} else {
						$('.police .duty-alert .animate__animated').html(
							Translations.NoRadio
						);
						$('.police .tab-content-menu').addClass('blur');
						$('.police .duty-alert').fadeIn(300, function () {
							setTimeout(() => {
								$('.police .duty-alert').fadeOut(300);
								$('.police .tab-content-menu').removeClass('blur');
								$('.police .duty-alert .animate__animated').html(
									Translations.NotInDuty
								);
							}, 3000);
						});
					}
				});
			} else {
				policeFunctions.openTab($(valid), false);
			}
		});

		$(document).on('click', '.police .new-note-agente', function () {
			if (HasPermissionMenu("CreateNotes")) return sendNotification('error', Translations.NoPermissionPage);
			policeFunctions.newNote(1);
		});

		$(document).on('mousedown', '.police .tab .central .speak-to', function () {
			const frec = $(this).parent().attr('frec');
			radioFunctions.speakToMenu(frec);
		});
		$(document).on('mouseup', '.police .tab .central .speak-to', function () {
			radioFunctions.stopSpeakToMenu();
		});

		$(document).on('keypress', '.police .tab .central .input-rpol', function (e) {
			if (e.which == 13) {
				if (HasPermissionMenu("SendRadioMessage")) return sendNotification('error', Translations.NoPermissionPage);
				const message = $(this).val();
				$(this).val('');
				fetch('SendRpolMessage', { message });
			}
		});

		$(document).on('click', '.police .tab .central .selector-container', function () {
			if (
				$('.police .tab .central .alerts-container .id-alert').text().trim() !=
				'-'
			) {
				$(this).toggleClass('toggle');
				if ($(this).hasClass('toggle')) {
					let unidadesDispo = '';
					$('.police .tab .central .radio-category-menu').each(function () {
						if ($(this).find('.number').text() > 0) {
							unidadesDispo += `
                            <div class="unidad" frec="${$(this).attr('frec')}">
                            <i class="fa-solid fa-car-on"></i> ${$(this).attr(
								'frec'
							)} <span style="color:grey;margin-left:1vh;">(${$(this)
								.find('.number')
								.text()})</span>
                            </div>

                            `;
						}
					});
					$('.police .tab .central .unidades-dispo').html(unidadesDispo);
				}
			} else {
				sendNotification('info', 'Selecciona una emergencia antes de asignar unidad');
			}
		});
		$(document).on(
			'click',
			'.police .tab .central .selector-container .unidad',
			function () {
				if (HasPermissionMenu("AssignAlertToUnit")) return sendNotification('error', Translations.NoPermissionPage);
				const unit = $(this).attr('frec').toUpperCase();
				const index = $(this).parent().attr('index');
				const alert = {
					coords: centralFunctions.alerts[index].coords,
					code: centralFunctions.alerts[index].code,
					title: centralFunctions.alerts[index].title,
					message: centralFunctions.alerts[index].message,
					annotation: centralFunctions.alerts[index].annotation,
					metadata: centralFunctions.alerts[index].metadata
				};
				TriggerCallback('origen_police:server:ForceSelectAlert', { alert, unit });
			}
		);

		$(document).on(
			'click',
			'.police .tab .central .tabla-dispatch tbody tr',
			function () {
				$(this).removeClass('new-alert');
				const alert = centralFunctions.alerts[$(this).attr('index')];
				if (!alert) return;
				mapFunctions.setAlertFocus(alert.code);
				centralFunctions.setAlertShowing(alert, $(this).attr('index'));
			}
		);



		$(document).on('click', '.police .tab .central .dispatch-alert-editor-back', function () {
			centralFunctions.closeAlertEditor();
		});

		$(document).on('click', '.police .tab .central .dispatch-alert-filter', function () {
			const filter = String($(this).attr('data-filter') || 'all').toLowerCase();
			$('.police .tab .central .dispatch-alert-filter').removeClass('active');
			$(this).addClass('active');
			centralFunctions.activeAlertsFilter = filter;
			centralFunctions.applyAlertsFilter();
		});

		$(document).on('click', '.police .tab .central .action-button', function () {
			const attr = $(this).attr('action');
			switch (attr) {
				case 'cameras':
					if (HasPermissionMenu("SecurityCamera")) return sendNotification('error', Translations.NoPermissionPage);
					policeFunctions.createTab(Translations.Cameras, '.police-cameras');
					setTimeout(() => {
						camerasFunctions.loadCameras();
					}, 50);
					break;

				case 'informes':
					if (HasPermissionMenu("SearchReports")) return sendNotification('error', Translations.NoPermissionPage);
					policeFunctions.createTab(Translations.Reports, '.police-reports');
					setTimeout(() => {
						informesFunctions.loadReports();
					}, 500);
					break;

				case 'wanted':
					if (HasPermissionMenu("SearchCitizen")) return sendNotification('error', Translations.NoPermissionPage);
					policeFunctions.createTab(Translations.Citizens, '.police-citizen');
					break;
			}
		});

		$(document).on('mousedown', '.police .tab .central .broadcast', function () {
			const attr = $(this).attr('action');
			const freqList = broadcastButtons[attr];
			for (let i = 0; i < freqList.length; i++) {
				freqList[i] = stringToUrl(freqList[i]);
			}
			exportEvent('origen_police', 'StartTalkRadio', freqList);
		});

		$(document).on('mouseup', '.police .tab .central .broadcast', function () {
			exportEvent('origen_police', 'StopTalkRadio', {});
		});


		$(document).on('mousedown', '.police .tab .central .central-btn-central', function (e) {
			e.stopPropagation();
			const categoryName = $(this).attr('category');
			if (categoryName && window.categoryCentralFreqs && window.categoryCentralFreqs[categoryName]) {

				const centralFreq = window.categoryCentralFreqs[categoryName];
				const freqList = [centralFreq];
				exportEvent('origen_police', 'StartTalkRadio', freqList);
			}
		});

		$(document).on('mouseup', '.police .tab .central .central-btn-central', function (e) {
			e.stopPropagation();
			exportEvent('origen_police', 'StopTalkRadio', {});
		});

		$(document).on('change', '.shape-division-filter', function () {
			centralFunctions.applyShapesFilter();
		});

		$(document).on('click', '.btn-new-operation', function () {
			let divisionsHtml = `<div class="mt-3" style="max-height: 25vh; overflow-y: auto; overflow-x: hidden;"><label style="color:white; font-size: 1.2vh; margin-bottom: 1vh;">${Translations.Divisions || "Divisiones"} (Opcional)</label><div class="divisions-list d-flex flex-wrap" style="gap: 1vh;">`;
			if (Translations.DivisionsData) {
				Object.entries(Translations.DivisionsData).forEach(([id, div]) => {
					divisionsHtml += `
						<div class="form-check form-switch w-100 d-flex align-items-center" style="gap:1vh">
						  <input class="form-check-input operation-division-checkbox m-0" type="checkbox" id="op-div-${id}" value="${id}">
						  <label class="form-check-label text-white m-0" style="font-size: 1.2vh" for="op-div-${id}">${div.name}</label>
						</div>
					`;
				});
			}
			divisionsHtml += `</div></div>`;

			OpenModal(
				Translations.CreateNewOperation || "Crear Nueva Operación",
				`
				<div class="row">
					<div class="col-12">
						<input class="form-control w-200 map-new-op-title" placeholder="${Translations.Title}">
						${divisionsHtml}
					</div>
				</div>
				`,
				`<button class="btn-modal" onclick="centralFunctions.createOperation($('.map-new-op-title').val())">${Translations.Save}</button>`,
				Translations.Cancel
			);
		});

		$(document).on('click', '.btn-back-operations', function () {
			centralFunctions.currentOperation = null;
			$('#operations-detail-view').fadeOut(300, function () {
				$('#operations-list-view').fadeIn(300);
				centralFunctions.applyShapesFilter();
			});
		});

		$(document).on('click', '.btn-delete-operation', function () {
			if (centralFunctions.currentOperation) {
				centralFunctions.deleteOperation(centralFunctions.currentOperation);
			}
		});

		$(document).on('click', '.btn-edit-operation', function () {
			if (centralFunctions.currentOperation) {
				centralFunctions.editOperationDivisions(centralFunctions.currentOperation);
			}
		});

		$(document).on('click', '.operation-item-click', function () {
			let id = $(this).attr('data-id');
			let title = $(this).attr('data-title');
			centralFunctions.currentOperation = parseInt(id);
			$('.operation-detail-title').text(title);

			$('#operations-list-view').fadeOut(300, function () {
				$('#operations-detail-view').fadeIn(300);
				centralFunctions.applyShapesFilter();
			});
		});

		$(document).on('mousedown', '.police .tab .central .broadcast-category-btn-central', function (e) {
			e.stopPropagation();
			const categoryName = $(this).attr('category');
			if (categoryName && window.categoryFrequencies && window.categoryFrequencies[categoryName]) {

				const freqList = window.categoryFrequencies[categoryName];
				exportEvent('origen_police', 'StartTalkRadio', freqList);
			}
		});

		$(document).on('mouseup', '.police .tab .central .broadcast-category-btn-central', function (e) {
			e.stopPropagation();
			exportEvent('origen_police', 'StopTalkRadio', {});
		});

		$(document).on(
			'click',
			'.police .tab .central .actions-title .delete-alert',
			function () {
				const code = parseInt(
					$('.police .tab .central .alerts-container .id-alert').text()
				);
				centralFunctions.deleteAlert(code);
			}
		);

		$(document).on(
			'click',
			'.police .tab .central .btn-save-note-alert',
			function () {
				if (HasPermissionMenu("AddNotesToAlert")) return sendNotification('error', Translations.NoPermissionPage);
				const code = parseInt(
					$('.police .tab .central .alerts-container .id-alert').text()
				);
				const annotation = $(
					'.police .tab .central .alerts-container .input-note-alert'
				).val();
				centralFunctions.saveAlertNoteAlert(code, annotation);
			}
		);
	},

	addRpolMessage: (message) => {
		message = message.substring(2);

		message = message.split('^0');

		message[0] = message[0].substring(0, message[0].length - 2)
		message[1] = ` <span style="color:white;">${message[1]}</span>`;
		message = message.join(':');

		$('.police .tab .central .chat-messages').append(`
        <div class="chat-message animate__animated animate__fadeInLeft animate__fast">
            <div class="message">${message}</div>
        </div>
        `);
		$('.police .tab .central .chat-messages').scrollTop(
			$('.police .tab .central .chat-messages')[0].scrollHeight
		);
	},

	updateAgentesTable: (data) => {
		if (data) {
			centralFunctions.updateDeptCounters(data);

			const category = policeFunctions.getCategory();
			if (category === 'ambulance') {
				$('.police .tab .central .agentes-servicio thead th[translate="Agent"]').text(Translations.EMS || 'EMS');
				$('.police .tab .central .dispatch-agents-box h4[translate="AgentsOnDuty"]').text(Translations.EMSServices || 'EMS de servicio');
			}

			$('.police .tab .central .agentes-servicio tbody').html('');
			let newSources = [];
			if (typeof data === 'object') {
				data = Object.values(data);
			}
			data.map((agente) => {
				if (agente) {
					if (agente.unit != '') {
						const label = (category === 'ambulance' ? (Translations.EMS || 'EMS') : (Translations.Agent || 'Agent'));
						CreateReferenceBlip(
							mapCentral,
							agente.source,
							{ x: agente.ref.coords.x, y: agente.ref.coords.y },
							ReferenceSprite[agente.ref.sprite] ||
							'https://docs.fivem.net/blips/radar_level.png',
							`<div><div style="${agente.deptColor}" class="d-flex align-content-center mb-1"><span class="badge mt-0 mb-0 me-1 quicksand" style="filter:hue-rotate(-${currentHueDeg}deg)">${agente.dept
							}</span><div class="badge text-uppercase bg-dark quicksand">${agente.grade
							}</div></div><h4 class="d-flex bankgothic align-content-center">${label} ${agente.name
							} <small class="text-white-50 ms-1">#${agente.badge
							}</small></h4><small class="agent-radio-label"><i class="fa-solid fa-walkie-talkie"></i> ${agente.unit
							}</small></div>`,
							ReferenceColor[agente.ref.color] || '#FFF'
						);
					}
					newSources.push(agente.source);
					$('.police .tab .central .agentes-servicio tbody').append(`
                <tr>
                    <td>
                        <span class="badge w-100 text-center" style="background-color: ${agente.deptColor};filter:hue-rotate(-${currentHueDeg}deg)">${agente.dept
						}</span>
                    </td>
                    <td>
                        ${agente.grade}
                    </td>
                    <td>
                        ${agente.name} (${agente.badge})
                    </td>
                    ${!agente.hideGPS ?
							(agente.ready
								? `<td class="text-success">${Translations.Available}</td>`
								: `<td class="text-danger">${Translations.NotAvailable}</td>`) :
							`<td class="text-danger">${Translations.NoSignal}</td>`
						}
                    <td class="text-center">
                        <button class="btn btn-action btn-small" ${agente.unit == '' ? `style="opacity:0.5;" disabled="true"` : ""} onclick="mapFunctions.setBlipFocus(${agente.source
						})"><i class="fa-solid fa-location-crosshairs"></i></button>
                    </td>
                </tr>
                `);
					if (agente.hideGPS) {
						mapFunctions.destroyBlip(agente.source);
					}
				}
			});
			mapFunctions.checkPoliceSources(newSources);
		}
	},
	updateDeptCounters: (data) => {
		const normalizeDept = (value) =>
			String(value || '')
				.normalize('NFD')
				.replace(/[\u0300-\u036f]/g, '')
				.toUpperCase();

		const deptMatchers = {
			LSPD: ['LSPD', 'SAPD', 'POLICE'],
			BCSD: ['BCSD', 'BCSO', 'SHERIFF'],
			LSFD: ['LSFD', 'FIRE'],
			EMS: ['EMS', 'AMBULANCE', 'MEDICAL'],
			SAMS: ['SAMS']
		};

		const counts = { LSPD: 0, BCSD: 0, LSFD: 0, EMS: 0, SAMS: 0 };
		const list = typeof data === 'object' ? Object.values(data) : [];

		list.forEach((agente) => {
			if (!agente) return;
			const isAvailable = Boolean(agente.ready) && !Boolean(agente.hideGPS);
			if (!isAvailable) return;

			const dept = normalizeDept(agente.dept);
			Object.entries(deptMatchers).forEach(([key, patterns]) => {
				if (patterns.some((pattern) => dept.includes(pattern))) {
					counts[key] += 1;
				}
			});
		});

		Object.entries(counts).forEach(([dept, value]) => {
			$(`.police .tab .central .dept-count[data-dept="${dept}"]`).text(value);
		});
	},
	setupRadioDeptFilters: () => {
		const filtersContainer = $('.police .tab .central .radio-dept-filters');
		if (!filtersContainer.length) return;

		const categoryHeaders = $('.police .tab .central .category-header-central');
		if (!categoryHeaders.length) {
			filtersContainer.html('');
			return;
		}

		const normalizeText = (value) =>
			String(value || '')
				.normalize('NFD')
				.replace(/[\u0300-\u036f]/g, '')
				.toUpperCase();

		const detectDepartment = (categoryName) => {
			const normalized = normalizeText(categoryName);
			if (normalized.includes('BCSD') || normalized.includes('BCSO') || normalized.includes('SHERIFF')) return 'BCSD';
			if (normalized.includes('LSFD') || normalized.includes('FIRE')) return 'LSFD';
			if (normalized.includes('EMS') || normalized.includes('AMBULANCE') || normalized.includes('MEDICAL')) return 'EMS';
			if (normalized.includes('SAMS')) return 'SAMS';
			if (normalized.includes('LSPD') || normalized.includes('SAPD')) return 'LSPD';
			if (normalized.includes('POLICE')) return 'LSPD';
			return 'OTHER';
		};

		const availableDepartments = new Set();
		categoryHeaders.each(function () {
			const categoryName = $(this).find('span').first().text().trim();
			availableDepartments.add(detectDepartment(categoryName));
		});

		const orderedFilters = ['ALL', 'LSPD', 'BCSD', 'LSFD', 'EMS', 'SAMS'];
		let html = '';
		orderedFilters.forEach((filter) => {
			if (filter !== 'ALL' && !availableDepartments.has(filter)) return;
			html += `<button class="radio-filter-btn ${filter === 'ALL' ? 'active' : ''}" data-filter="${filter}">${filter === 'ALL' ? 'TODOS' : filter}</button>`;
		});
		filtersContainer.html(html);

		$(document).off('click', '.police .tab .central .radio-filter-btn');
		$(document).on('click', '.police .tab .central .radio-filter-btn', function () {
			const filter = $(this).data('filter');
			$('.police .tab .central .radio-filter-btn').removeClass('active');
			$(this).addClass('active');

			if (filter === 'ALL') {
				$('.police .tab .central .category-header-central').show();
				$('.police .tab .central .central-freq-list').show();
			} else {
				$('.police .tab .central .category-header-central').hide();
				$('.police .tab .central .central-freq-list').hide();

				$('.police .tab .central .category-header-central').each(function () {
					const header = $(this);
					const categoryName = header.find('span').first().text().trim();
					const dept = detectDepartment(categoryName);

					if (dept === filter) {
						const list = header.next('.central-freq-list');
						header.show();
						list.show();
					}
				});
			}
		});
	},
	updatePoliceCarsMap: (data) => {
		if (data) {
			Object.entries(data).map(([key, vehicle]) => {
				CreateBlip(
					mapCentral,
					'car-' + key,
					{ x: vehicle.coords.x, y: vehicle.coords.y },
					'./img/icons/cnYSq0w.png',
					`<div>${vehicle.model}</div><div>${vehicle.plate}</div>`
				);
			});
		}
	},

	addAlert(event) {

		const alertToStore = {
			...event.data.alert,
			coords: event.data.alert.coords ? {
				x: event.data.alert.coords.x,
				y: event.data.alert.coords.y,
				z: event.data.alert.coords.z
			} : null
		};

		centralFunctions.alerts.push(alertToStore);
		const index = centralFunctions.alerts.length - 1;

		if (typeof alertsFunctions !== 'undefined' && alertsFunctions.upsertDispatchAlert) {

			alertsFunctions.upsertDispatchAlert(alertToStore);
		}

		addBlipAtCoords(
			checkNumber(event.data.alert.code),
			event.data.alert.coords.y,
			event.data.alert.coords.x,
			event.data.alert.title,
			event.data.alert.street,
			secondsOrMinutes(event.data.alert.time),
			index
		);

		if ($('.police .tab .central .tabla-dispatch tbody .no-alerts').length > 0) {
			$('.police .tab .central .tabla-dispatch tbody').html('');
		}
		let alertTableClass = (event.data.alert.title.toUpperCase().includes('EMERGENCIA') || event.data.alert.title.toUpperCase().includes('QRR')) ? 'emergency-alert' : '';
		if (event.data.alert.title.toUpperCase().includes('AVISO CANCELADO')) alertTableClass = 'cancel-alert';
		$('.police .tab .central .tabla-dispatch tbody').append(`
            <tr index="${index}" class="new-alert ${alertTableClass}" id="alert-${event.data.alert.code}">
                <td>#${checkNumber(event.data.alert.code)}</td>
                <td>${event.data.alert.title}</td>
                <td>${event.data.alert.street}</td>
                <td class="timing">${secondsOrMinutes(event.data.alert.time)}</td>
                <td class="units-cell"><span class="units"></span></td>
            </tr>
        `);
		centralFunctions.applyAlertsFilter();

		let isEmergency = event.data.alert.title.toUpperCase().includes('QRR');
		let hasSelectedAlert = $('.police .tab .central .tabla-dispatch tbody tr.selected').length > 0;
		if (!hasSelectedAlert || isEmergency) {
			setTimeout(() => {
				$(`.police .tab .central .tabla-dispatch tbody tr[index='${index}']`).click();
			}, 100);
		}
	},



	addStoredAlert(event) {

		const alertToStore = {
			...event.data.alert,
			coords: event.data.alert.coords ? {
				x: event.data.alert.coords.x,
				y: event.data.alert.coords.y,
				z: event.data.alert.coords.z
			} : null
		};
		centralFunctions.alerts.push(alertToStore);
		const index = centralFunctions.alerts.length - 1;
		if (typeof alertsFunctions !== 'undefined' && alertsFunctions.upsertDispatchAlert) {

			alertsFunctions.upsertDispatchAlert(alertToStore);
		}


		addBlipAtCoords(
			checkNumber(event.data.alert.code),
			event.data.alert.coords.y,
			event.data.alert.coords.x,
			event.data.alert.title,
			event.data.alert.street,
			secondsOrMinutes(event.data.alert.time),
			index
		);


		if ($('.police .tab .central .tabla-dispatch tbody .no-alerts').length > 0) {
			$('.police .tab .central .tabla-dispatch tbody').html('');
		}
		let alertTableClass = (event.data.alert.title.toUpperCase().includes('EMERGENCIA') || event.data.alert.title.toUpperCase().includes('QRR')) ? 'emergency-alert' : '';
		if (event.data.alert.title.toUpperCase().includes('AVISO CANCELADO')) alertTableClass = 'cancel-alert';
		$('.police .tab .central .tabla-dispatch tbody').append(`
            <tr index="${index}" class="${alertTableClass}" id="alert-${event.data.alert.code}">
                <td>#${checkNumber(event.data.alert.code)}</td>
                <td>${event.data.alert.title}</td>
                <td>${event.data.alert.street}</td>
                <td class="timing">${secondsOrMinutes(event.data.alert.time)}</td>
                <td class="units-cell"><span class="units"></span></td>
            </tr>
        `);
		centralFunctions.applyAlertsFilter();
	},


	intervalAlerts: () => {
		if (alertTiming) return;
		alertTiming = true;
		intervalAlert = setInterval(() => {
			centralFunctions.alerts.map((alert, i) => {
				alert.time += 1;
				$(
					".police .tab .central .tabla-dispatch tbody tr[index='" +
					i +
					"'] .timing"
				).text(secondsOrMinutes(alert.time));
			});
		}, 1000);
	},
	setAlertShowing: (alert, index) => {
		$('.police .tab .central .actions-title').fadeIn(300);
		$('.police .tab .central .alerts-container .id-alert').text(
			checkNumber(alert.code)
		);
		$('.police .tab .central .unidades-dispo').attr('index', index);
		$('.police .tab .central .alerts-container .title-alert').text(alert.title);
		$('.police .tab .central .alerts-container .street-alert').text(alert.street);
		$('.police .tab .central .alerts-container .time-alert').text(
			'Hace ' + secondsOrMinutes(alert.time)
		);
		$('.police .tab .central .tabla-dispatch tbody tr.selected').removeClass(
			'selected'
		);
		$(
			".police .tab .central .tabla-dispatch tbody tr[index='" + index + "']"
		).addClass('selected');
		$('.police .tab .central .alerts-container .input-note-alert')
			.val(alert.annotation || '')
			.attr('disabled', false);

		let metadataHtml = '';
		const metadata = alert.metadata;
		if (metadata) {
			Object.keys(metadata).map((key) => {
				let icon = '';
				let text = '';
				switch (key) {
					case 'name':
						icon = 'user';
						text = `<b style='margin-right:.5vh;'>${Translations.AgentAlert}: </b> ` + metadata[key];
						break;
					case 'model':
						icon = 'car';
						text = `<b style='margin-right:.5vh;'>${Translations.VehicleAlert}: </b> ` + metadata[key];
						break;
					case 'plate':
						icon = 'keyboard';
						text = `<b style='margin-right:.5vh;'>${Translations.PlateAlert}: </b> ` + metadata[key];
						break;
					case 'speed':
						icon = 'tachometer-alt';
						text = `<b style='margin-right:.5vh;'>${Translations.SpeedAlert}: </b> ` + metadata[key];
						break;
					case 'weapon':
						icon = 'gun';
						text = `<b style='margin-right:.5vh;'>${Translations.WeaponAlert}: </b> ` + metadata[key];
						break;
					case 'ammotype':
						icon = 'record-vinyl';
						text = metadata[key];
						break;
					case 'color':
						icon = 'tint';
						text =
							"<b style='text-transform: uppercase'>" + Translations.Color + ":</b> <div class='color-car' style='background-color:rgb(" +
							metadata[key] +
							'); box-shadow: 0 0 10px rgb(' +
							metadata[key] +
							")'></div>";
						break;
				}
				metadataHtml += `<div class="alert-metadata-item"><i class="fas fa-${icon}"></i> ${text}</div>`;
			});
		}
		$('.police .tab .central .alerts-container .message-alert').html(`
            ${alert.message ? alert.message : ''}
            <div class="alert-data">
                ${metadataHtml}
            </div>
        `);
	},

	deleteAlert: (code) => {
		centralFunctions.alerts = centralFunctions.alerts.filter(
			(alert) => alert.code != code
		);
		if (typeof alertsFunctions !== 'undefined' && alertsFunctions.removeByCode) {
			alertsFunctions.removeByCode(code);
		}
		$('.police .tab .central .tabla-dispatch tbody tr.selected').remove();
		mapFunctions.destroyAlertBlip(code);
		$('.police .tab .central .alerts-container .id-alert').text('-');
		$('.police .tab .central .alerts-container .title-alert').text('-');
		$('.police .tab .central .alerts-container .street-alert').text('-');
		$('.police .tab .central .alerts-container .time-alert').text('-');
		$('.police .tab .central .alerts-container .message-alert').text('-');
		$('.police .tab .central .actions-title').fadeOut(300);
		$('.police .tab .central .alerts-container .input-note-alert')
			.val('')
			.attr('disabled', true);
		centralFunctions.closeAlertEditor();

		$('.police .tab .central .tabla-dispatch tbody tr').each((i, tr) => {
			$(tr).attr('index', i);
		});
		centralFunctions.applyAlertsFilter();
	},
	applyAlertsFilter: () => {
		const filter = centralFunctions.activeAlertsFilter || 'all';
		const rows = $('.police .tab .central .tabla-dispatch tbody tr').not('.no-alerts');

		rows.each((_, row) => {
			const $row = $(row);
			const isEmergency = $row.hasClass('emergency-alert');
			const isCancel = $row.hasClass('cancel-alert');
			let visible = true;

			if (filter === 'emergency') visible = isEmergency;
			if (filter === 'cancel') visible = isCancel;
			if (filter === 'normal') visible = !isEmergency && !isCancel;

			$row.toggle(visible);
		});

		const visibleRows = rows.filter(':visible').length;
		const noAlertsRow = $('.police .tab .central .tabla-dispatch tbody .no-alerts').closest('tr');
		if (visibleRows === 0) {
			noAlertsRow.show();
		} else {
			noAlertsRow.hide();
		}
	},
	openAlertEditor: () => {
		$('.police .tab .central .dispatch-alerts-unified').addClass('is-editing');
		$('.police .tab .central .dispatch-alerts-editor').removeClass('is-hidden');
	},
	closeAlertEditor: () => {
		$('.police .tab .central .dispatch-alerts-unified').removeClass('is-editing');
		$('.police .tab .central .dispatch-alerts-editor').addClass('is-hidden');
	},
	saveAlertNoteAlert: (code, annotation) => {
		TriggerCallback('origen_police:server:EditAlert', { code, annotation });
	},

	updateShapes: () => {
		TriggerCallback('origen_police:callback:GetShapes', {}).done((response) => {
			editableLayers.clearLayers();
			centralFunctions.cachedOperations = response.operations || {};
			centralFunctions.cachedShapes = response.shapes || {};

			let filterDiv = $(policeTabSelected + ' .shape-division-filter').val() || 'all';

			// Build filter options if not built yet
			if ($(policeTabSelected + ' .shape-division-filter option').length === 1 && Translations.DivisionsData) {
				Object.entries(Translations.DivisionsData).forEach(([id, div]) => {
					$(policeTabSelected + ' .shape-division-filter').append(`<option value="${id}">${div.name}</option>`);
				});
			}

			if (centralFunctions.currentOperation) {
				// Detail view: rendering shapes for the currently selected operation
				let renderedCount = 0;
				$(policeTabSelected + ' .shape-list').html('');
				Object.entries(centralFunctions.cachedShapes).forEach(([key, shape]) => {
					if (shape.operation_id == centralFunctions.currentOperation) {
						renderedCount++;
						var layer = GetDataShapes(shape);
						if (layer) {
							editableLayers.addLayer(layer);
							if (shape.title) layer.bindPopup(shape.title);
						}
						const title = shape.title;
						const type = shape.type;
						const radius = shape.radius.toFixed(3);
						const pos = getCenter(shape);
						const zoom = calculateZoom(shape.radius);

						$(policeTabSelected + ' .shape-list')
							.append(
								`
							<div class="shape-block d-flex align-items-center">
								<div class="shape-info w-100">
									<div class="w-100 shape-title">${title}</div>
									<div class="w-100 shape-data d-flex align-items-center">
										<div>
											<i class="fa-solid fa-shapes"></i>
											<span class="shape-type">${type}</span>
										</div>
										${shape.radius > 0 && (
									`
											<div class="ms-3">
												<i class="fa-regular fa-circle-dot"></i>
												<span>${radius} m</span>
											</div>
											`
								) || ''}
									</div>
								</div>
								<div class="shape-button s_view d-flex align-items-center justify-content-center" 
									onclick="zoomShape(${pos}, ${zoom})"
								>
									<i class="fa-solid fa-eye"></i>
								</div>
								<div class="shape-button bg-danger bg-gradient d-flex align-items-center justify-content-center"
									onclick="centralFunctions.deleteShape(${shape.id})"
								>
									<i class="fa-solid fa-trash"></i>
								</div>
							</div>
						`
							)
							.fadeIn(300);
					}
				});

				if (renderedCount === 0) {
					$(policeTabSelected + ' .shape-list')
						.html(
							`
						<div class="operation-item m-titles text-muted text-center mb-3">
							<div class="no-operations" translate="NoShapes">
								${Translations.NoShapes || "No shapes"}
							</div>
						</div>
					`
						).fadeIn(300);
				} else {
					$(policeTabSelected + ' .shape-list').fadeIn(300);
				}
			} else {
				// List view: rendering folders (Operations)
				let renderedCount = 0;
				$(policeTabSelected + ' .operations-list').html('');

				// Also draw Legacy shapes on the map if we want, or do we only draw shapes inside an operation?
				// Let's only display operations in the list.

				Object.entries(centralFunctions.cachedOperations).forEach(([key, op]) => {
					// Apply selected division filter
					if (filterDiv !== 'all') {
						if (!op.divisions || !op.divisions.includes(filterDiv)) {
							return;
						}
					}
					renderedCount++;

					let divNames = "";
					if (op.divisions && op.divisions.length > 0) {
						let names = [];
						op.divisions.forEach(d => {
							if (Translations.DivisionsData && Translations.DivisionsData[d]) {
								names.push(Translations.DivisionsData[d].name);
							} else {
								names.push(d);
							}
						});
						divNames = `<span style="font-size: 0.9vh; color: #a5a5a5; display: block; margin-top: 0.5vh; text-transform: uppercase;"><i class="fa-solid fa-users"></i> ${names.join(', ')}</span>`;
					}

					$(policeTabSelected + ' .operations-list')
						.append(
							`
						<div class="shape-block d-flex align-items-center operation-item-click" style="cursor: pointer;" data-id="${op.id}" data-title="${op.title}">
							<div class="shape-info w-100">
								<div class="w-100 shape-title" style="font-size: 1.4vh;"><i class="fa-solid fa-folder-open text-warning me-2"></i> ${op.title}${divNames}</div>
							</div>
							<div class="shape-button s_view d-flex align-items-center justify-content-center">
								<i class="fa-solid fa-chevron-right"></i>
							</div>
						</div>
					`
						)
						.fadeIn(300);
				});

				if (renderedCount === 0) {
					$(policeTabSelected + ' .operations-list')
						.html(
							`
						<div class="operation-item m-titles text-muted text-center mb-3">
							<div class="no-operations" translate="NoOperations">
								No hay operaciones
							</div>
						</div>
					`
						).fadeIn(300);
				} else {
					$(policeTabSelected + ' .operations-list').fadeIn(300);
				}

				// Draw shapes from all allowed operations simultaneously on map, maybe?
				// Or we only show shapes when INSIDE an operation. Let's show all valid shapes if not inside an operation.
				let renderedShapesCount = 0;
				Object.entries(centralFunctions.cachedShapes).forEach(([key, shape]) => {
					// We only want to show shapes natively if they DO NOT belong to any operation OR legacy mode
					if (shape.operation_id && shape.operation_id > 0) {
						return; // Skip drawing shapes that belong to an operation, keep map clean
					}

					let allowed = true;
					if (filterDiv !== 'all') {
						if (!shape.divisions || !shape.divisions.includes(filterDiv)) {
							allowed = false;
						}
					}

					if (allowed) {
						var layer = GetDataShapes(shape);
						if (layer) {
							editableLayers.addLayer(layer);
							if (shape.title) layer.bindPopup(shape.title);
						}
						renderedShapesCount++;

						// Also show these global shapes in the list view below the folders
						let divNames = "";
						if (shape.divisions && shape.divisions.length > 0) {
							let names = [];
							shape.divisions.forEach(d => {
								if (Translations.DivisionsData && Translations.DivisionsData[d]) {
									names.push(Translations.DivisionsData[d].name);
								} else {
									names.push(d);
								}
							});
							divNames = `<span style="font-size: 0.9vh; color: #a5a5a5; display: block; margin-top: 0.5vh; text-transform: uppercase;"><i class="fa-solid fa-users"></i> ${names.join(', ')}</span>`;
						}

						const title = shape.title;
						const type = shape.type;
						const radius = shape.radius.toFixed(3);
						const pos = getCenter(shape);
						const zoom = calculateZoom(shape.radius);

						$(policeTabSelected + ' .operations-list')
							.append(
								`
							<div class="shape-block d-flex align-items-center mt-2">
								<div class="shape-info w-100">
									<div class="w-100 shape-title">${title}${divNames}</div>
									<div class="w-100 shape-data d-flex align-items-center">
										<div>
											<i class="fa-solid fa-shapes"></i>
											<span class="shape-type">${type}</span>
										</div>
										${shape.radius > 0 && (
									`
											<div class="ms-3">
												<i class="fa-regular fa-circle-dot"></i>
												<span>${radius} m</span>
											</div>
											`
								) || ''}
									</div>
								</div>
								<div class="shape-button s_view d-flex align-items-center justify-content-center" 
									onclick="zoomShape(${pos}, ${zoom})"
								>
									<i class="fa-solid fa-eye"></i>
								</div>
								<div class="shape-button bg-danger bg-gradient d-flex align-items-center justify-content-center"
									onclick="centralFunctions.deleteShape(${shape.id})"
								>
									<i class="fa-solid fa-trash"></i>
								</div>
							</div>
						`
							)
							.fadeIn(300);
					}
				});

				if (renderedCount === 0 && renderedShapesCount === 0) {
					$(policeTabSelected + ' .operations-list')
						.html(
							`
						<div class="operation-item m-titles text-muted text-center mb-3">
							<div class="no-operations" translate="NoOperations">
								No hay operaciones ni marcas
							</div>
						</div>
					`
						).fadeIn(300);
				}

			}
		});
	},

	applyShapesFilter: () => {
		centralFunctions.updateShapes(); // Simply call updateShapes again and it will use cached or new data to filter from dropdown
	},

	createOperation: (title) => {
		if (title.length > 4) {
			let divisions = [];
			$('.operation-division-checkbox:checked').each(function () {
				divisions.push($(this).val());
			});
			let operation = {
				title: title,
				divisions: divisions
			};
			TriggerCallback('origen_police:callback:UpdateOperations', {
				action: 'create',
				operation: operation
			}).done((cb) => {
				if (!cb) return
				CloseModal();
				centralFunctions.updateShapes();
			});
		} else {
			sendNotification('error', Translations.TitleTooShort);
		}
	},

	deleteOperation: (id) => {
		if (HasPermissionMenu("DeleteShape")) {
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
		OpenModal(
			Translations.DeleteOperation || "Eliminar Operación",
			Translations.ConfirmDeleteOperation || "¿Estás seguro de que quieres eliminar esta operación y todas sus formas ligadas?",
			`<button class="btn-modal" onclick="centralFunctions.deleteOperationConfirm(${id})">${Translations.Remove}</button>`,
			Translations.Cancel
		);
	},

	deleteOperationConfirm: (id) => {
		TriggerCallback('origen_police:callback:UpdateOperations', {
			action: 'delete',
			id: id,
		}).done((cb) => {
			if (cb) {
				CloseModal();
				centralFunctions.currentOperation = null;
				$('#operations-detail-view').fadeOut(300, function () {
					$('#operations-list-view').fadeIn(300);
				});
				centralFunctions.updateShapes();
			}
		});
	},

	editOperationDivisions: (id) => {
		if (HasPermissionMenu('DeleteShape')) {
			$('.police .duty-alert .animate__animated').html(Translations.NoPermission);
			$('.police .tab-content-menu').addClass('blur');
			$('.police .duty-alert').fadeIn(300, function () {
				setTimeout(() => {
					$('.police .duty-alert').fadeOut(300, function () {
						$('.police .duty-alert .animate__animated').html(Translations.NotInDuty);
					});
					$('.police .tab-content-menu').removeClass('blur');
				}, 3000);
			});
			return;
		}

		// Get current divisions of this operation
		const op = centralFunctions.cachedOperations && centralFunctions.cachedOperations[id];
		const currentDivisions = (op && op.divisions) ? op.divisions.map(String) : [];

		let divisionsHtml = `<div class="mt-3" style="max-height: 25vh; overflow-y: auto; overflow-x: hidden;"><label style="color:white; font-size: 1.2vh; margin-bottom: 1vh;">${Translations.Divisions || 'Divisiones'}</label><div class="divisions-list d-flex flex-wrap" style="gap: 1vh;">`;
		if (Translations.DivisionsData) {
			Object.entries(Translations.DivisionsData).forEach(([divId, div]) => {
				const checked = currentDivisions.includes(String(divId)) ? 'checked' : '';
				divisionsHtml += `
					<div class="form-check form-switch w-100 d-flex align-items-center" style="gap:1vh">
					  <input class="form-check-input edit-op-division-checkbox m-0" type="checkbox" id="edit-op-div-${divId}" value="${divId}" ${checked}>
					  <label class="form-check-label text-white m-0" style="font-size: 1.2vh" for="edit-op-div-${divId}">${div.name}</label>
					</div>
				`;
			});
		}
		divisionsHtml += `</div></div>`;

		OpenModal(
			Translations.EditDivisions || 'Editar Divisiones',
			`<div class="row"><div class="col-12">${divisionsHtml}</div></div>`,
			`<button class="btn-modal" onclick="centralFunctions.editOperationDivisionsConfirm(${id})">${Translations.Save || 'Guardar'}</button>`,
			Translations.Cancel
		);
	},

	editOperationDivisionsConfirm: (id) => {
		let divisions = [];
		$('.edit-op-division-checkbox:checked').each(function () {
			divisions.push($(this).val());
		});
		TriggerCallback('origen_police:callback:UpdateOperations', {
			action: 'update',
			id: id,
			divisions: divisions,
		}).done((cb) => {
			if (cb) {
				CloseModal();
				centralFunctions.updateShapes();
			}
		});
	},

	createShape: (title, color) => {
		if (title.length > 4) {
			editableLayers.addLayer(currentLayer);
			var shape = saveShapes(editableLayers, title);

			if (color) {
				shape.data.color = color;
			} else {
				shape.data.color = '#3388ff'; // fallback to leafLet default
			}

			if (centralFunctions.currentOperation) {
				shape.operation_id = centralFunctions.currentOperation;
			} else {
				shape.divisions = [];
				shape.operation_id = 0;
			}

			TriggerCallback('origen_police:callback:UpdateShapes', {
				action: 'create',
				shape
			}).done((cb) => {
				if (!cb) return
				CloseModal();
				centralFunctions.updateShapes();
			});
		} else {
			sendNotification('error', Translations.TitleTooShort);
		}
	},

	deleteShape: (id) => {
		if (HasPermissionMenu("DeleteShape")) {
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
		OpenModal(
			Translations.DeleteShape,
			Translations.ConfirmDeleteShape,
			`<button class="btn-modal" onclick="centralFunctions.deleteShapeConfirm(${id})">${Translations.Remove}</button>`,
			Translations.Cancel
		);
	},

	deleteShapeConfirm: (id) => {
		const shapeID = id
		TriggerCallback('origen_police:callback:UpdateShapes', {
			action: 'delete',
			id: shapeID,
		}).done((cb) => {
			if (cb) {
				CloseModal();
				centralFunctions.updateShapes();
			}
		});
	},
};