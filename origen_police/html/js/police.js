policeFunctions = {
	federalCache: [],
	debtorsCache: [],
	isSavingWeapon: false,

	setTopButtonsByTabName: (name) => {
		const tabName = (name || '').trim();
		const isReports = tabName === Translations.Reports || tabName === 'INFORMES' || tabName === 'Informes';
		const isCriminalCode = tabName === Translations.CriminalCodeAbrev || tabName === 'CÓDIGO PENAL' || tabName === 'C. CRIMINAL';
		const isFederal = tabName === Translations.FederalManagement || tabName === 'ADMINISTRACION FEDERAL' || tabName === 'Administración Federal';
		const isDebtors = tabName === Translations.Debtors || tabName === Translations.DebtSubjects || tabName === 'DEUDORES' || tabName === 'Deudores';
		const isCameras = tabName === Translations.Cameras || tabName === Translations.SecurityCameras || tabName === 'CÁMARAS' || tabName === 'CÁMARAS DE SEGURIDAD';
		const isManage = tabName === Translations.PoliceManagement || tabName === Translations.AgentManagement || tabName === 'POLICIAS' || tabName === 'POLICÍAS' || tabName === 'GESTIÓN DE AGENTES';
		const isRadio = tabName === 'RADIO' || tabName === 'Radio' || tabName === (Translations.Radio || 'RADIO');

		$('.police-action-btn.duty-button').toggle(!isReports && !isCriminalCode && !isFederal && !isDebtors && !isCameras && !isManage && !isRadio);
		$('.police-actions-bar').toggle(isReports || isCriminalCode || isFederal || isDebtors || isCameras || isManage || isRadio);
		$('.police-action-btn.radio-shortcuts-header').toggle(isRadio);
		$('.police-action-btn.new-report-button').toggle(isReports);
		$('.police-action-btn.new-denuncia-button').toggle(isReports);
		$('.police-action-btn.add-federal-button').toggle(isFederal);
		$('.police-action-btn.add-agent-button').toggle(isManage);
		$('.police-action-btn.refresh-cameras-button').toggle(isCameras);
		$('.police-action-btn.add-capitulo').toggle(isCriminalCode);
		$('.police-action-btn.add-articulo').toggle(isCriminalCode);
	},

	syncSidebarWithTabName: (name) => {
		const tabName = (name || '').trim();
		let module = '';
		if (tabName === Translations.Dispatch || tabName === 'DISPATCH') module = 'dispatch';
		else if (tabName === Translations.Citizens || tabName === 'CIUDADANOS') module = 'citizens';
		else if (tabName === Translations.Reports || tabName === 'INFORMES') module = 'reports';
		else if (tabName === Translations.Vehicles || tabName === 'VEHÍCULOS') module = 'vehicles';
		else if (tabName === Translations.CriminalCodeAbrev || tabName === 'CÓDIGO PENAL' || tabName === 'C. CRIMINAL') module = 'code';
		else if (tabName === Translations.SearchCapture || tabName === 'BUSCA Y CAPTURA') module = 'wanted';
		else if (tabName === Translations.Debtors || tabName === Translations.DebtSubjects || tabName === 'DEUDORES') module = 'debtors';
		else if (tabName === Translations.FederalManagement || tabName === 'ADMINISTRACIÓN FEDERAL' || tabName === 'ADMINISTRACION FEDERAL') module = 'federal';
		else if (tabName === Translations.AgentManagement || tabName === 'GESTIÓN DE AGENTES') module = 'agents';
		else if (tabName === Translations.SecurityCameras || tabName === 'CÁMARAS DE SEGURIDAD') module = 'cameras';

		$('.police-service-card').removeClass('active-service');
		if (module.length) {
			$(`.police-service-card[data-module="${module}"]`).addClass('active-service');
		}

		const isRadioConnected = typeof frecuenciaActual !== 'undefined' && frecuenciaActual && frecuenciaActual !== 'NONE';
		$('.radio-button').toggleClass('active', !!isRadioConnected);
		$('.radio-state-text').text(isRadioConnected ? frecuenciaActual : (Translations.Disconnected || 'DESCONECTADA'));
	},

	setServiceBadge: (module, count) => {
		const $badge = $(`.police-service-card[data-module="${module}"] .service-badge`);
		if (!$badge.length) return;
		const parsed = Number(count) || 0;
		if (parsed > 0) {
			$badge.text(parsed > 99 ? '99+' : parsed).fadeIn(150);
		} else {
			$badge.fadeOut(150);
		}
	},

	refreshMenuBadges: () => {
		TriggerCallback('origen_police:police:Get100Reports', {}).done((cb) => {
			policeFunctions.setServiceBadge('reports', Array.isArray(cb) ? cb.length : 0);
		});
		TriggerCallback('origen_police:police:GetMorosos', {}).done((cb) => {
			policeFunctions.setServiceBadge('debtors', Array.isArray(cb) ? cb.length : 0);
		});
		TriggerCallback('origen_police:server:GetFederalList', {}).done((cb) => {
			policeFunctions.setServiceBadge('federal', cb ? Object.keys(cb).length : 0);
		});
	},

	toggleCompactMode: () => {
		const $root = $('.police.police-redesign');
		const enabled = !$root.hasClass('compact-mode');
		$root.toggleClass('compact-mode', enabled);
		try {
			localStorage.setItem('origen_police_compact_mode', enabled ? '1' : '0');
		} catch (e) { }
		sendNotification('success', enabled ? 'Modo compacto activado' : 'Modo compacto desactivado');
	},

	policeNavigation: function (name, to) {
		return new Promise(function (resolve, reject) {
			if (onDuty) {
				const activeTab = $('.tabs-bar .tab.active').attr('data-tab');


				$('.police-header-info h1').text(name);
				policeFunctions.setTopButtonsByTabName(name);
				policeFunctions.syncSidebarWithTabName(name);


				if (!activeTab || activeTab === undefined) {

					const tabNumber = 1;
					$('.tabs-list').append(`
						<div class="tab active" data-tab="${tabNumber}">
							<div class="tab-name">${name}</div>
							<div class="tab-close"><i class="fas fa-times"></i></div>
						</div>
					`);
					$('.tab-content-menu').append(`
						<div class="tab show" id="tab-${tabNumber}">
							${to}
						</div>
					`);
					$('.tab-content-menu').addClass('has-tabs');
					$('.police-main').hide();

					policeTabSelected = '#tab-' + tabNumber;
					resolve();
				} else {

					policeTabSelected = '#tab-' + activeTab;
					const $activeTabContent = $('#tab-' + activeTab);



					if ($activeTabContent.length === 0) {
						$('.tab-content-menu .tab').removeClass('show');
						$('.tab-content-menu').append(`
							<div class="tab show" id="tab-${activeTab}">
								${to || ''}
							</div>
						`);
						$('.tab-content-menu').addClass('has-tabs');
						$('.police-main').hide();
						resolve();
					} else {
						const $scaleIn = $activeTabContent.find('>.scale-in');
						if ($scaleIn.length > 0) {
							$scaleIn
								.removeClass('scale-in')
								.addClass('scale-out')
								.fadeOut(300, function () {
									$activeTabContent.html(to || '');
									$('.tab-content-menu .tab').removeClass('show');
									$activeTabContent.addClass('show');
									$('.tab-content-menu').addClass('has-tabs');
									$('.police-main').hide();
									resolve();
								});
						} else {
							$activeTabContent.html(to || '');
							$('.tab-content-menu .tab').removeClass('show');
							$activeTabContent.addClass('show');
							$('.tab-content-menu').addClass('has-tabs');
							$('.police-main').hide();
							resolve();
						}
					}
					$(".tabs-list .tab[data-tab='" + activeTab + "'] .tab-name").text(
						name,
						to
					);
				}
			} else {
				policeFunctions.dutyAlert();
				resolve();
			}
		});
	},

	loadPoliceEvents: function () {
		citizenSelectorFunctions.loadSelectorFunctions();
		informesFunctions.loadInformesFunctions();
		vehiclesSectionFunctions.loadVehiclesFunctions();
		multasFunctions.loadMultasFunctions();
		codigoPenalFunctions.loadCodigoPenalFunctions();
		vehicleSelectorFunctions.loadSelectorFunctions();
		agentesFunctions.loadAgentesEvents();

		radioFunctions.loadRadioEventsMenu();
		centralFunctions.loadCentralEvents();

		$(document).on('change', '.select-preconfigured-insurance', function () {
			const val = $(this).val();
			if (val !== "") {
				const ins = availableInsurances[val];
				$('.input-insurance-name').val(ins.name);
				$('.input-insurance-type').val(ins.type);

				if (ins.duration) {
					const now = new Date();
					const expireDate = new Date(now.getTime() + (ins.duration * 24 * 60 * 60 * 1000));

					const year = expireDate.getFullYear();
					const month = String(expireDate.getMonth() + 1).padStart(2, '0');
					const day = String(expireDate.getDate()).padStart(2, '0');
					const hours = String(now.getHours()).padStart(2, '0');
					const minutes = String(now.getMinutes()).padStart(2, '0');

					$('.input-insurance-date').val(`${year}-${month}-${day}`);
					$('.input-insurance-time').val(`${hours}:${minutes}`);
				}
			}
		});

		camerasFunctions.cameraEvents();

		try {
			const compactEnabled = localStorage.getItem('origen_police_compact_mode') === '1';
			$('.police.police-redesign').toggleClass('compact-mode', compactEnabled);
		} catch (e) { }

		$(document).on('keydown', function (e) {
			if (e.ctrlKey && e.shiftKey && (e.key === 'M' || e.key === 'm')) {
				e.preventDefault();
				policeFunctions.toggleCompactMode();
			}
		});

		$(document).on('click', '.police .police-service-card', function () {
			$('.police .police-service-card').removeClass('active-service');
			$(this).addClass('active-service');
		});

		$(document).on('click', '.police .btn-federal', function () {
			if (HasPermissionMenu("AddFederal")) {
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
			policeFunctions.openAddCondenaModal();
		});
		$(document).on('click', '.police .btn-search-federal', function () {
			policeFunctions.searchFederal();
		});
		$(document).on('click', '.police .add-federal-button', function () {
			if (HasPermissionMenu('AddFederal')) return sendNotification('error', Translations.NoPermissionPage);
			policeFunctions.openAddCondenaModal();
		});
		$(document).on('keyup', '.police .input-search-federal', function (e) {
			if (e.keyCode == 13) {
				policeFunctions.searchFederal();
			}
		});
		$(document).on('click', '.police .federal-list .report', function (e) {
			e.preventDefault();
			e.stopPropagation();
			const citizenid = $(this).data('citizenid');
			policeFunctions.selectFederal(citizenid);
		});
		$(document).on('click', '.police .btn-search-debtor', function () {
			policeFunctions.searchDebtors();
		});
		$(document).on('keyup', '.police .input-search-debtor', function (e) {
			if (e.keyCode == 13) {
				policeFunctions.searchDebtors();
			}
		});
		$(document).on('click', '.police .debtors-list .report', function (e) {
			e.preventDefault();
			e.stopPropagation();
			const citizenid = $(this).data('citizenid');
			policeFunctions.selectDebtor(citizenid);
		});

		$(document).on('click', '.tabs-list .tab .tab-name', function () {
			if (!$(this).parent().hasClass('active')) {
				if (onDuty) {
					policeFunctions.openTab(this, false);
				} else {
					policeFunctions.dutyAlert();
				}
			}
		});
		$(document).on('click', '.police .tabs-bar .tab.add', function () {
			policeFunctions.createTab(Translations.Home);
		});
		$(document).on('click', '.btn-police-citizen', function () {
			if (HasPermissionMenu("SearchCitizen")) {
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
			policeFunctions.policeNavigation(Translations.Citizens, $('.police-citizen').html());
		});

		$(document).on('click', '.btn-agentes', function () {
			if (HasPermissionMenu("AgentManagement")) {
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
			fetch('LoadPolicePage', { page: 'agents' }).done((cb) => {
				if (cb) {
					policeFunctions.policeNavigation(
						Translations.Polices,
						$('.police-manage').html()
					);
					setTimeout(() => {
						agentesFunctions.loadAgentes();
					}, 500);
				} else {
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
				}
			});
		});

		$(document).on('click', '.btn-camaras', function () {
			if (HasPermissionMenu("SecurityCamera")) {
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
			policeFunctions
				.policeNavigation(Translations.Cameras, $('.police-cameras').html())
				.then(() => {
					camerasFunctions.loadCameras();
				});
		});

		$(document).on('click', '.tab-close', function () {
			policeFunctions.closeTab(this);
		});
		$(document).on('click', '.duty-button', function () {
			$.post('https://origen_police/duty', JSON.stringify({}), function (cb) {
				if (cb != undefined) {
					policeFunctions.alternarServicio(cb);
				}
			});
		});

		$(document).on('click', '.btn-search-citizen', function () {
			policeFunctions.searchCitizen(this, false);
		});

		$(document).on('keydown', '.input-search-citizen', function (event) {
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == '13') {
				policeFunctions.searchCitizen(this, false);
			}
		});

		$(document).on('click', '.citizen-list .citizen', function () {
			policeFunctions.getCitizen($(this).find('.citizen-id').text().trim());
		});

		$(document).on('click', '.police .new-note', function () {
			if (HasPermissionMenu("CreateNotes")) return sendNotification('error', Translations.NoPermissionPage);
			policeFunctions.newNote();
		});

		$(document).on('click', '.police .new-multa', function () {
			if (HasPermissionMenu("CreateBill")) return sendNotification('error', Translations.NoPermissionPage);
			const cid = $(this)
				.parent()
				.parent()
				.parent()
				.parent()
				.parent()
				.attr('citizen-id');
			const name = $(this)
				.parent()
				.parent()
				.parent()
				.parent()
				.parent()
				.attr('citizen-name');
			codigoPenalFunctions.loadTabla(1);

			multasFunctions.openBill(
				'ciudadano',
				multasFunctions.addMultaCitizen,
				name,
				cid
			);
		});

		$(document).on('click', '.cancel-note-button', function () {
			$(this)
				.parent()
				.parent()
				.removeClass('scale-in')
				.addClass('scale-out')
				.fadeOut(300, function () {
					$(this).remove();
					if (
						$('.police ' + policeTabSelected + ' .notes-list li').length == 0
					) {
						$('.police ' + policeTabSelected + ' .notes-list').append(
							`<li class="list-group-item list-group-item-action no-notes scale-in"><h5>${Translations.NoRegisteredNotes}</h5></li>`
						);
					}
				});
		});

		$(document).on('click', '.police .add-license', function () {
			if (HasPermissionMenu("AddLicenses")) return sendNotification('error', Translations.NoPermissionPage);
			const cid = $(this).closest('[citizen-id]').attr('citizen-id');
			policeFunctions.AddLicenseModal(cid);
		});

		$(document).on('click', '.police .add-weapon', function () {
			if (HasPermissionMenu("AddWeapons")) return sendNotification('error', Translations.NoPermissionPage);
			const cid = $(this).closest('[citizen-id]').attr('citizen-id');
			policeFunctions.addWeapon(cid);
		});

		$(document).on('click', '.police .citizen-ficha .weapons-list .delete-weapon', function () {
			if (HasPermissionMenu("DeleteWeapons")) return sendNotification('error', Translations.NoPermissionPage);
			const cid = $(this).closest('[citizen-id]').attr('citizen-id');
			const weaponName = $(this).closest('li').attr('weapon-name');
			const weaponSerie = $(this).closest('li').attr('weapon-serie');
			policeFunctions.deleteWeapon(cid, weaponName, weaponSerie, this);
		});

		$(document).on('click', '.police .new-note-button', function () {
			if (HasPermissionMenu("CreateNotes")) return sendNotification('error', Translations.NoPermissionPage);
			const noteTitle = $(this).parent().parent().find('.note-title').val();
			const noteText = $(this).parent().parent().find('.note-text').val();
			const citizenid = $('.police ' + policeTabSelected + ' .citizenid')
				.text()
				.trim();
			const note = $(this);
			let params = { noteTitle, noteText, citizenid };
			if ($(this).attr('type') == 'agente') {
				params = { noteTitle, noteText, citizenid, police: true };
			}

			if (noteTitle.length > 0 && noteText.length > 0) {
				TriggerCallback('origen_police:police:NewPoliceNote', params).done((cb) => {
					if (cb) {
						const date = timeStampToDate(cb.date * 1000);
						note.parent()
							.parent()
							.removeClass('scale-in')
							.addClass('scale-out')
							.fadeOut(300, function () {
								$(this).remove();
								$(
									'.police ' + policeTabSelected + ' .notes-list'
								).prepend(`
                            <li class="list-group-item list-group-item-action scale-in" note-id="${cb.id}">
                                <h5 class="note-title-text">${noteTitle}</h5>
                                <p class="note-content-text">${noteText}</p>
                                <div class="note-info d-flex">
                                    <div class="note-author"><i class="fas fa-user"></i> ${cb.author}</div>
                                    <div class="note-date"><i class="fas fa-calendar-alt"></i> ${date.date}</div>
                                    <div class="note-hour"><i class="fas fa-clock"></i> ${date.time}</div>
                                </div>
                                <div class="pin-button">
                                    <i class="fas fa-thumbtack"></i>
                                </div>
                                <div class="edit-note-button">
                                    <i class="fas fa-edit"></i>
                                </div>
                                <div class="delete-button">
                                    <i class="fa-solid fa-trash"></i>
                                </div>
                            </li>
                            `);
							});
					}
				});
			}
		});

		$(document).on('click', '.police .citizen-scroll .pin-button', function () {
			if (HasPermissionMenu("PinNotes")) return sendNotification('error', Translations.NoPermissionPage);
			const noteId = $(this).parent().attr('note-id');
			const note = $(this).parent();
			let type = 'pin';
			if (note.hasClass('pinned')) {
				type = 'unpin';
			}
			TriggerCallback('origen_police:police:UpdatePoliceNote', {
				noteid: noteId,
				type: type
			}).done((cb) => {
				if (cb) {
					if (type == 'pin') {
						note.addClass('scale-out').fadeOut(300, function () {
							let nota = $(this);
							$(this).remove();
							nota.removeClass('scale-out')
								.addClass('scale-in')
								.addClass('pinned')
								.show();
							$(
								'.police ' + policeTabSelected + ' .notes-list-pinned'
							).prepend(nota);
						});
					} else {
						note.addClass('scale-out').fadeOut(300, function () {
							let nota = $(this);
							$(this).remove();
							nota.removeClass('scale-out')
								.removeClass('pinned')
								.addClass('scale-in')
								.show();
							$('.police ' + policeTabSelected + ' .notes-list').prepend(
								nota
							);
						});
					}
				}
			});
		});

		$(document).on('click', '.police .delete-button', function () {
			if (HasPermissionMenu("DeleteNotes")) return sendNotification('error', Translations.NoPermissionPage);
			const noteId = $(this).parent().attr('note-id');
			const note = $(this).parent();

			TriggerCallback('origen_police:police:UpdatePoliceNote', {
				noteid: noteId,
				type: 'delete'
			}).done((cb) => {
				if (cb) {
					note.addClass('scale-out').fadeOut(300, function () {
						$(this).remove();
					});
				}
			});
		});

		$(document).on('click', '.police .edit-note-button', function () {
			if (HasPermissionMenu("CreateNotes")) return sendNotification('error', Translations.NoPermissionPage);
			const noteElement = $(this).parent();
			const currentTitle = noteElement.find('.note-title-text').text();
			const currentText = noteElement.find('.note-content-text').text();

			noteElement.attr('data-original-title', currentTitle);
			noteElement.attr('data-original-text', currentText);

			noteElement.find('.note-title-text').replaceWith(`
				<input type="text" class="form-control note-title-edit" value="${currentTitle.replace(/"/g, '&quot;')}">
			`);
			noteElement.find('.note-content-text').replaceWith(`
				<textarea class="form-control note-text-edit" rows="3">${currentText}</textarea>
			`);

			$(this).replaceWith(`
				<div class="save-note-button" title="Guardar">
					<i class="fas fa-save"></i>
				</div>
				<div class="cancel-edit-note-button" title="Cancelar">
					<i class="fas fa-times-circle"></i>
				</div>
			`);
		});

		$(document).on('click', '.police .save-note-button', function () {
			const noteElement = $(this).parent();
			const noteId = noteElement.attr('note-id');
			const newTitle = noteElement.find('.note-title-edit').val();
			const newText = noteElement.find('.note-text-edit').val();

			if (newTitle.length > 0 && newText.length > 0) {
				TriggerCallback('origen_police:police:UpdatePoliceNote', {
					noteid: noteId,
					type: 'edit',
					title: newTitle,
					text: newText
				}).done((cb) => {
					if (cb) {
						noteElement.find('.note-title-edit').replaceWith(`
							<h5 class="note-title-text">${newTitle}</h5>
						`);
						noteElement.find('.note-text-edit').replaceWith(`
							<p class="note-content-text">${newText}</p>
						`);

						noteElement.find('.save-note-button, .cancel-edit-note-button').remove();
						noteElement.find('.delete-button').before(`
							<div class="edit-note-button">
								<i class="fas fa-edit"></i>
							</div>
						`);

						sendNotification('success', Translations.NoteUpdated || 'Nota actualizada');
					}
				});
			} else {
				sendNotification('error', Translations.FillAllFields || 'Rellena todos los campos');
			}
		});

		$(document).on('click', '.police .cancel-edit-note-button', function () {
			const noteElement = $(this).parent();

			const originalTitle = noteElement.attr('data-original-title');
			const originalText = noteElement.attr('data-original-text');

			noteElement.find('.note-title-edit').replaceWith(`
				<h5 class="note-title-text">${originalTitle}</h5>
			`);
			noteElement.find('.note-text-edit').replaceWith(`
				<p class="note-content-text">${originalText}</p>
			`);

			noteElement.find('.save-note-button, .cancel-edit-note-button').remove();
			noteElement.find('.delete-button').before(`
				<div class="edit-note-button">
					<i class="fas fa-edit"></i>
				</div>
			`);

			noteElement.removeAttr('data-original-title');
			noteElement.removeAttr('data-original-text');
		});

		$(document).on(
			'click',
			'.police .citizen-ficha .busca-captura .btn-check',
			function () {
				if (HasPermissionMenu("SetWanted")) return sendNotification('error', Translations.NoPermissionPage);
				$('.police .citizen-ficha .busca-captura .btn-check').attr(
					'checked',
					false
				);
				$(this).attr('checked', true);
				const citizenid = $(
					'.police ' + policeTabSelected + ' .citizen-ficha .citizenid'
				)
					.text()
					.trim();
				let value = 0;
				if ($(this).hasClass('si')) {
					value = 1;
				}
				TriggerCallback('origen_police:police:UpdateCitizenStatus', {
					citizenid,
					column: 'wanted',
					value
				});
			}
		);

		$(document).on(
			'click',
			'.police .citizen-ficha .dangerous .btn-check',
			function () {
				if (HasPermissionMenu("SetDanger")) return sendNotification('error', Translations.NoPermissionPage);
				$('.police .citizen-ficha .dangerous .btn-check').attr('checked', false);
				$(this).attr('checked', true);
				const citizenid = $(
					'.police ' + policeTabSelected + ' .citizen-ficha .citizenid'
				)
					.text()
					.trim();
				let value = 0;
				if ($(this).hasClass('si')) {
					value = 1;
				}
				TriggerCallback('origen_police:police:UpdateCitizenStatus', {
					citizenid,
					column: 'dangerous',
					value
				});
			}
		);

		$(document).on('click', '.citizen-photo', function () {
			OpenModal(
				Translations.HowUploadImage,
				`
                <div class="d-flex justify-content-around content-tipo-imagen">
                    <button class="btn-modal" onclick="policeFunctions.cargarFoto(1)"><img src="./img/camera.png"></br>${Translations.Photo}</button>
                    <button class="btn-modal" onclick="policeFunctions.cargarFoto(0)"><img src="./img/link.png"></br>${Translations.AddURL}</button>
                </div>
            `,
				`<div></div>`,
				Translations.Cancel,
			);
		});
		$(document).on(
			'click',
			'.police .citizen-ficha .citizen-informes .informe, .police .agent-ficha .informe',
			function () {
				policeFunctions.createTab(Translations.Reports, '.police-reports');
				const that = $(this);
				setTimeout(() => {
					if (informesFunctions.loadReports()) {
						informesFunctions.loadInforme(that.find('.report-id').text());
					}
				}, 500);
			}
		);
		$(document).on(
			'click',
			'.police .citizen-ficha .multas-list .delete-button',
			function () {
				if (HasPermissionMenu("DeleteBill")) return sendNotification('error', Translations.NoPermissionPage);
				const billid = $(this).parent().attr('bill-id');

				TriggerCallback('origen_police:police:DeleteBill', {
					billid
				}).done((cb) => {
					if (cb) {
						$(this)
							.parent()
							.addClass('scale-out')
							.fadeOut(300, function () {
								$(this).remove();
							});
					} else {
						sendNotification(
							'error',
							'Only a high position can eliminate a fine'
						);
					}
				});
			}
		);
		$(document).on(
			'click',
			'.police .citizen-ficha .licenses-list .delete-button',
			function () {
				if (HasPermissionMenu("DeleteLicenses")) return sendNotification('error', Translations.NoPermissionPage);
				const $li = $(this).closest('li');
				const dbid = $li.attr('dbid');

				$li.addClass('scale-out').fadeOut(300, function () {
					$(this).remove();
					if ($('.police .citizen-ficha .licenses-list li').length === 0) {
						$('.police .citizen-ficha .licenses-list').append(`
							<li class="list-group-item list-group-item-action no-notes">
								<div class="d-flex justify-content-between align-items-center">
									<h5>${Translations.NoData || 'SIN LICENCIAS ACTIVAS'}</h5>
								</div>
							</li>
						`);
					}
					if (dbid) {
						TriggerCallback('origen_police:police:RemoveLicense', {
							id: parseInt(dbid)
						}).done((cb) => {
							if (cb) {
								sendNotification('success', Translations.LicenseDeleted || 'Licencia eliminada correctamente');
							}
						});
					}
				});
			}
		);

		$(document).on('click', '.police .btn-byc', function () {
			if (HasPermissionMenu("SearchCapture")) {
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
			TriggerCallback('origen_police:police:GetBusqueda', {}).done((cb) => {
				if (cb) {
					let rows = '';

					if (cb.length > 0) {
						cb.map(function (citizen) {
							rows += `
                            <div class="col-4 mb-3">
                                <div class="citizen-box">
                                    <div class="citizen-image" style="background-image:url(${citizen.image || defaultImage
								});filter:hue-rotate(-${currentHueDeg}deg);"></div>
                                    <div class="p-2 text-center">
                                        <div class="citizen-name">${citizen.name}</div>
                                        <div class="d-flex flex-wrap">
                                            <div class="citizen-id text-center"><i class="lni lni-postcard"></i> ${citizen.citizenid
								}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            `;
						});
					} else {
						rows = `<div class="col-12"><h5>${Translations.NoSubjectsInSearch}</h5></div>`;
					}
					OpenModal(
						Translations.SubjectsInSearch,
						`<div class="scroll-citizen-modal">
                        <div class="row">
                            ${rows}
                        </div>
                    </div>
                `,
						`<div></div>`,
						Translations.Close,
						80
					);
				}
			});
		});

		$(document).on('click', '.police .btn-deudores', function () {
			if (HasPermissionMenu("SearchDebtors")) {
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
			policeFunctions.policeNavigation(Translations.Debtors || Translations.DebtSubjects, $('.police-debtors').html()).then(() => {
				policeFunctions.loadDebtorsList();
			});
		});

		$(document).on('click', '.operations-button', function () {
			if (HasPermissionMenu("Operations")) {
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
				if ($(this).text() == Translations.Operations) {
					valid = $(this);
				}
			});
			if (!valid) {
				policeFunctions.policeNavigation(Translations.Operations, $('.police-operations').html())
					.then(() => {
						loadShapesMap();
					});
			} else {
				policeFunctions.openTab($(valid), false);
			}
		});

		$(document).on('click', '.guide-button', function () {
			window.invokeNative('openUrl', 'https://docs.origennetwork.store/origen-police/guide-of-use/police-cad');
		});

		$(document).on('click', '.open-admin-panel-btn', function () {
			fetch('op_admin_openPanel', {}).done((cb) => {
				// The backend will open the UI
			});
		});

		$(document).on('click', '.settings-button', function () {
			if (HasPermissionMenu("Settings")) {
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
				if ($(this).text() == Translations.Settings) {
					valid = $(this);
				}
			});
			if (!valid) {
				policeFunctions.policeNavigation(Translations.Settings, $('.police-settings').html())
					.then(() => {
						settingsFunctions.loadListeners();
					});
			} else {
				policeFunctions.openTab($(valid), false);
			}
		});

		$(document).on('click', '.police .add-insurance', function () {
			const cid = $(this).closest('[citizen-id]').attr('citizen-id');
			policeFunctions.addInsurance(cid);
		});

		$(document).on('click', '.police .citizen-ficha .insurances-list .delete-insurance', function () {
			const id = $(this).closest('li').attr('insurance-id');
			policeFunctions.deleteInsurance(id, this);
		});
	},

	openTab: function (tab, create, tabClass) {
		if (create) {
			tabN = tab;
			policeFunctions.loadHomeFunctions();
			tabHome = true;
		} else {
			tabN = $(tab).parent().attr('data-tab');
			policeTabSelected = '#tab-' + tabN;
			tabHome = false;
		}

		const activeTabNameFromButton = create
			? ($('.tabs-list .tab[data-tab=' + tabN + '] .tab-name').text() || '')
			: ($(tab).text() || '');
		const isHomeTab =
			tabClass === '.police-home' ||
			activeTabNameFromButton === Translations.Home ||
			activeTabNameFromButton === 'INICIO' ||
			activeTabNameFromButton === 'Inicio';



		if (isHomeTab) {
			$('.tabs-list .tab').removeClass('active');
			$('.tabs-list .tab[data-tab=' + tabN + ']').addClass('active');
			$('.tab-content-menu .tab').removeClass('show');
			$('.tab-content-menu').removeClass('has-tabs');
			$('.police-main').show();
			const homeName = activeTabNameFromButton || Translations.Home || 'INICIO';
			$('.police-header-info h1').text(homeName);
			policeFunctions.setTopButtonsByTabName(homeName);
			policeFunctions.syncSidebarWithTabName(homeName);
			policeFunctions.refreshMenuBadges();

			setTimeout(() => {
				if (typeof mapHome !== 'undefined' && mapHome && mapHome.invalidateSize) {
					mapHome.invalidateSize();
				}
			}, 300);
			return;
		}


		if (tabN == 1 && create && $('.tabs-list .tab').length === 0 && tabClass === '.police-home') {

			$('.tab-content-menu').removeClass('has-tabs');
			$('.police-main').show();


			setTimeout(() => {
				if (typeof mapHome !== 'undefined' && mapHome && mapHome.invalidateSize) {
					mapHome.invalidateSize();
				}
			}, 300);
			return;
		}

		if ($('.tab-content-menu #tab-' + tabN).length > 0) {
			$('.tab-content-menu .tab').removeClass('show');
			$('.tab-content-menu #tab-' + tabN).addClass('show');
			$('.tabs-list .tab').removeClass('active');
			$(tab).parent().addClass('active');
		} else {
			$('.tab-content-menu .tab').removeClass('show');
			const tabContent = $(tabClass).html();
			$('.tab-content-menu').append(`
                <div class="tab show" id="tab-${tabN}">
                    ${tabContent}
                </div>
            `);
			$('.tabs-list .tab').removeClass('active');
			$('.tabs-list .tab[data-tab=' + tabN + ']').addClass('active');
		}


		if ($('.tab-content-menu .tab').length > 0) {
			$('.tab-content-menu').addClass('has-tabs');
		} else {
			$('.tab-content-menu').removeClass('has-tabs');
		}


		const activeTabName = $('.tabs-list .tab.active .tab-name').text();
		if (activeTabName) {
			$('.police-header-info h1').text(activeTabName);
			policeFunctions.setTopButtonsByTabName(activeTabName);
			policeFunctions.syncSidebarWithTabName(activeTabName);
		}

		const activeTab = $('.tabs-bar .tab.active').attr('data-tab');
		policeTabSelected = '#tab-' + activeTab;


		if (tabN == 1) {
			setTimeout(() => {
				if (typeof mapHome !== 'undefined' && mapHome && mapHome.invalidateSize) {
					mapHome.invalidateSize();
				}
			}, 300);
		}
	},

	createTab: function (title, tabContent) {
		const isHomeTitle = title === Translations.Home || title === 'INICIO' || title === 'Inicio';
		if (isHomeTitle) {
			let existingHomeTab = null;
			$('.tabs-list .tab .tab-name').each(function () {
				const tabText = $(this).text().trim();
				if (tabText === (Translations.Home || 'INICIO') || tabText === 'INICIO' || tabText === 'Inicio') {
					existingHomeTab = $(this);
				}
			});
			if (existingHomeTab) {
				policeFunctions.openTab(existingHomeTab, false);
				return;
			}
		}

		const tabNumber =
			parseInt($('.tabs-list .tab:last-child').attr('data-tab')) + 1 || 1;

		const numberOfTabs = $('.tabs-list .tab').length;

		if (numberOfTabs + 1 <= 12) {
			$('.tabs-list').append(`
                <div class="tab new-tab" data-tab="${tabNumber}">
                    <div class="tab-name">${title}</div><div class="tab-close"><i class="fas fa-times"></i></div>
                </div>
            `);
			setTimeout(() => {
				$('.tabs-list .tab.new-tab').removeClass('new-tab');
			}, 500);
			policeFunctions.openTab(
				tabNumber,
				true,
				tabContent ? tabContent : '.police-home'
			);
		}
	},

	closeTab: function (tab) {
		const tabN = $(tab).parent().attr('data-tab');
		const isLastTab = $('.tabs-list .tab').length === 1;
		const isActiveTab = $('.tabs-list .tab[data-tab=' + tabN + ']').hasClass('active');

		if (isActiveTab) {
			$('.tabs-list .tab[data-tab=' + tabN + ']')
				.addClass('animate__animated animate__fadeOutDown animate__faster')
				.fadeOut(300, function () {
					$(this).remove();
					if (!isLastTab) {
						$('.tabs-list .tab:last-child').addClass('active');

						const activeTabName = $('.tabs-list .tab.active .tab-name').text();
						if (activeTabName) {
							$('.police-header-info h1').text(activeTabName);
							policeFunctions.setTopButtonsByTabName(activeTabName);
							policeFunctions.syncSidebarWithTabName(activeTabName);
						}
					}
				});
			$('.tab-content-menu #tab-' + tabN).fadeOut(150, function () {
				$(this).remove();
				if (!isLastTab) {
					$('.tab-content-menu .tab:last-child').addClass('show');
				}

				if (isLastTab || $('.tab-content-menu .tab').length === 0) {
					$('.tab-content-menu').removeClass('has-tabs');
					$('.police-main').show();

					$('.police-header-info h1').text('SERVICIOS PÚBLICOS');
					policeFunctions.setTopButtonsByTabName(Translations.Home || 'INICIO');
					policeFunctions.syncSidebarWithTabName(Translations.Home || 'INICIO');
					policeFunctions.refreshMenuBadges();

					setTimeout(() => {
						if (typeof mapHome !== 'undefined' && mapHome && mapHome.invalidateSize) {
							mapHome.invalidateSize();
						}
					}, 300);
				}
			});
		} else {
			$('.tabs-list .tab[data-tab=' + tabN + ']')
				.addClass('animate__animated animate__fadeOutDown animate__faster')
				.fadeOut(300, function () {
					$(this).remove();
				});
			$('.tab-content-menu #tab-' + tabN).remove();

			if (isLastTab || $('.tab-content-menu .tab').length === 0) {
				$('.tab-content-menu').removeClass('has-tabs');
				$('.police-main').show();

				$('.police-header-info h1').text('SERVICIOS PÚBLICOS');
				policeFunctions.setTopButtonsByTabName(Translations.Home || 'INICIO');
				policeFunctions.syncSidebarWithTabName(Translations.Home || 'INICIO');
				policeFunctions.refreshMenuBadges();

				setTimeout(() => {
					if (typeof mapHome !== 'undefined' && mapHome && mapHome.invalidateSize) {
						mapHome.invalidateSize();
					}
				}, 300);
			}
		}
		if (
			$('.tabs-list .tab[data-tab=' + tabN + ']')
				.find('.tab-name')
				.text() == 'Radio'
		) {
			$('.tabs-list .tab[data-tab=' + tabN + ']').fadeOut(0, function () {
				$(this).remove();
			});
			$('.tab-content-menu #tab-' + tabN).fadeOut(0, function () {
				$(this).remove();

				if ($('.tabs-list .tab').length === 0) {
					$('.tab-content-menu').removeClass('has-tabs');
					$('.police-main').show();
				} else {

					$('.tabs-list .tab:last-child').addClass('active');
					$('.tab-content-menu .tab:last-child').addClass('show');
				}
			});
		} else if (
			$('.tabs-list .tab[data-tab=' + tabN + ']')
				.find('.tab-name')
				.text() == Translations.Dispatch
		) {
			destruirMapaCentral();

			TriggerCallback('origen_police:server:CloseCentral', {});
			$('.tabs-list .tab[data-tab=' + tabN + ']').fadeOut(0, function () {
				$(this).remove();
			});
			$('.tab-content-menu #tab-' + tabN).fadeOut(0, function () {
				$(this).remove();

				if ($('.tabs-list .tab').length === 0) {
					$('.tab-content-menu').removeClass('has-tabs');
					$('.police-main').show();
				} else {

					$('.tabs-list .tab:last-child').addClass('active');
					$('.tab-content-menu .tab:last-child').addClass('show');
				}
			});
		} else if (
			$('.tabs-list .tab[data-tab=' + tabN + ']')
				.find('.tab-name')
				.text() == Translations.Settings
		) {
			settingsLoaded = false;
		} else if (
			$('.tabs-list .tab[data-tab=' + tabN + ']')
				.find('.tab-name')
				.text() == Translations.Citizens
		) {
			destruirMapaAnkle();
		} else if (
			$('.tabs-list .tab[data-tab=' + tabN + ']')
				.find('.tab-name')
				.text() == Translations.Operations
		) {
			removeShapesMap();
			$('.tabs-list .tab[data-tab=' + tabN + ']').fadeOut(0, function () {
				$(this).remove();
			});
			$('.tab-content-menu #tab-' + tabN).fadeOut(0, function () {
				$(this).remove();

				policeFunctions.createTab(Translations.Home);
			});
		}
	},

	alternarServicio: function (cb) {
		onDuty = cb;
		const dutyText = cb ? Translations.InDuty : Translations.OutDuty;
		$('.service-tag').text(dutyText).toggleClass('on-service', cb);


		if (cb) {
			$('.duty-button').removeClass('off-duty').addClass('on-duty');
		} else {
			$('.duty-button').removeClass('on-duty').addClass('off-duty');
		}

		fetch('LoadPolicePage', { page: "home" }).done((cb) => {
			policeFunctions.setOnService(cb.cops);
		});
	},

	dutyAlert: function () {
		$('.police .tab-content-menu').addClass('blur');
		$('.police .duty-alert').fadeIn(300, function () {
			setTimeout(() => {
				$('.police .duty-alert').fadeOut(300);
				$('.police .tab-content-menu').removeClass('blur');
			}, 3000);
		});
	},

	getHueDeg: function (category) {
		if (!category || !jobCategories || !jobCategories[category]) return 0;
		for (let i = 0; i < jobCategories[category].length; i++) {
			if (jobCategories[category][i].name === jobData.name) {
				return jobCategories[category][i].colorHueDeg;
			}
		}
		return 0;
	},

	getCategory: function () {
		if (!jobCategories || !jobData || !jobData.name) return null;
		const category = Object.keys(jobCategories).find(key => {
			return jobCategories[key].some(element => element.name === jobData.name);
		});
		return category;
	},

	setOnService: function (cops) {
		let policeLabel;
		let category = policeFunctions.getCategory();

		if (category === 'ambulance') {
			if (cops === 0 || cops === undefined) {
				policeLabel = Translations.NoEMSDuty;
			} else if (cops === 1) {
				policeLabel = cops + ' ' + Translations.EMSOnDuty;
			} else {
				policeLabel = cops + ' ' + Translations.EMSSOnDuty;
			}
		} else {
			if (cops === 0 || cops === undefined) {
				policeLabel = Translations.NoPoliceDuty;
			} else if (cops === 1) {
				policeLabel = cops + ' ' + Translations.PoliceOnDuty;
			} else {
				policeLabel = cops + ' ' + Translations.PoliceSOnDuty;
			}
		}

		$('.police .number-polices').html(policeLabel);
	},


	loadHomeFunctions: function () {
		fetch('LoadPolicePage', { page: "home" }).done((cb) => {
			policeFunctions.alternarServicio(cb.service);
			policeFunctions.setOnService(cb.cops);
			policeFunctions.syncSidebarWithTabName(Translations.Home || 'INICIO');
			policeFunctions.refreshMenuBadges();
		});
	},
	searchCitizen: function (element, selector) {
		const text = !selector
			? $(element).parent().parent().find('.input-search-citizen').val()
			: $('.input-search-citizen-selector').val();
		if (text.length > 2 && text != '') {
			if (!selector) {

				const targetList = policeTabSelected && $(policeTabSelected + ' .citizen-list').length > 0
					? policeTabSelected + ' .citizen-list'
					: '.tab-content-menu .tab.show .citizen-list';

				$(targetList).fadeOut(300, function () {
					TriggerCallback('origen_police:police:SearchCitizen', {
						text
					}).done((cb) => {
						if (cb != undefined && cb.length > 0) {
							$(targetList).html('');
							cb.map(function (citizen) {
								const citizenName =
									citizen.firstname + ' ' + citizen.lastname;
								const citizenId = citizen.citizenid;
								const citizenImage = citizen.image || defaultImage;
								const citizenPhone = citizen.phone || 'Unknown';
								$(targetList)
									.append(
										`
                                    <div class="white-block citizen ${citizen.wanted ? 'wanted' : ''}">
                                        ${citizen.wanted ? `<div class="wanted-tag p-1 w-100 text-center" style="position:absolute; bottom:2vh; font-size: 1vh; left:0; right:0; margin:auto; z-index:10; border-radius:0;">EN BÚSQUEDA Y CAPTURA</div>` : ''}
                                        <div class="citizen-image image-${citizenId}" style="background-image:url('${citizenImage}');filter:hue-rotate(-${currentHueDeg}deg); ${citizen.wanted ? 'border: 2px solid #ff0000; box-shadow: 0 0 10px #ff0000;' : ''}"></div>
                                        <div class="citizen-info w-100">
                                            <div class="citizen-name w-100">${citizenName}</div>
                                            <div class="d-flex text-uppercase citizen-fast-data">
												<div class="w-50" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><i class="fa-solid fa-id-card"></i> <span class="citizen-id" style="max-width: 6em; display: inline-block;">${citizenId}</span></div>
                                                <div class="w-50" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"><i class="fa-solid fa-phone"></i> <span class="citizen-phone">${citizenPhone}</span></div>
                                            </div>
                                        </div>
                                    </div>
                                `
									)
									.fadeIn(300);

								setTimeout(() => {
									try {
										var imageElement = $(targetList + ' .image-' + citizenId);
										var style = imageElement.css('background-image');
										const regex = /"([^"]*)"/g;
										let resultado;
										const resultados = [];

										while ((resultado = regex.exec(style)) !== null) {
											resultados.push(resultado[1]);
										}
										var url = resultados[0];

										var img = new Image();
										img.src = url;
										img.onerror = function () {
											imageElement.css('background-image', 'url(' + defaultImage + ')');
										}
									}
									catch (e) { }
								}, 200);
							});
							$(targetList).fadeIn(300);
						} else {
							$(targetList)
								.html(
									`
                                    <div class="citizen-item m-titles text-muted">
                                        <div class="citizen-name">${Translations.NoResult}</div>
                                    </div>
                                `
								)
								.fadeIn(300);
						}
					});
				});
			} else {
				let params = { text };
				if ($('.btn-search-citizen-selector').attr('data-type') != 'persona') {
					params = {
						text,
						job: $('.btn-search-citizen-selector').attr('data-type')
					};
				}
				$('.police .citizen-box-list .row').fadeOut(300, function () {
					TriggerCallback('origen_police:police:SearchCitizen', params).done(
						(cb) => {
							if (cb != undefined && cb.length > 0) {
								$('.police .citizen-box-list .row').html('');
								cb.map(function (citizen) {
									const citizenName =
										citizen.firstname + ' ' + citizen.lastname;
									const citizenId = citizen.citizenid;
									const citizenImage = citizen.image || defaultImage;
									$('.police .citizen-box-list .row').append(`
                                    <div class="col-4 h-100 mb-3">
                                        <div class="citizen-box p-0 position-relative">
                                            ${citizen.wanted ? `<div class="wanted-tag p-1 w-100 text-center" style="position:absolute; bottom:5vh; font-size: 1vh; left:0; right:0; margin:auto; z-index:10; border-radius:0;">EN BÚSQUEDA Y CAPTURA</div>` : ''}
                                            <div class="citizen-image image-${citizenId}" style="background-image:url(${citizenImage});filter:hue-rotate(-${currentHueDeg}deg); ${citizen.wanted ? 'border: 2px solid #ff0000; box-shadow: 0 0 10px #ff0000;' : ''}"></div>
                                            <div class="p-2 text-center">
                                                <div class="citizen-name">${citizenName}</div>
                                                <div class="citizen-id">${citizenId}</div>
                                            </div>
                                        </div>
                                    </div>
                                `);
								});
								$('.police .citizen-box-list .row').fadeIn(300);
							} else {
								$('.police .citizen-box-list .row')
									.html(
										`
                                    <div class="col-12 text-muted">
                                        <h4 class="citizen-name">${Translations.NoResultFound}</h4>
                                    </div>
                                `
									)
									.fadeIn(300);
							}
						}
					);
				});
			}
		}
	},

	getCitizen: function (citizenid) {
		TriggerCallback('origen_police:police:GetCitizen', { citizenid }).done((cb) => {
			if (cb) {
				let citizenBills = '';
				let citizenVehicles = '';
				let citizenNotes = '';
				let citizenNotesPinned = '';
				let citizenLicenses = '';
				let citizenProperties = '';
				let citizenReports = '';
				let citizenWeapons = '';
				let citizenInsurances = '';
				let citizenAnkle = {};

				citizenAnkle = cb.ankle || {};

				if (cb.bills.length > 0) {
					cb.bills.map(function (bill) {
						let articulos = '';
						JSON.parse(bill.concepts).map(function (article) {
							articulos += `<li><p>${article}</p></li>`;
						});
						const fecha = timeStampToDate(bill.date);

						citizenBills += `
                        <li class="list-group-item list-group-item-action ${bill.payed ? 'multa-pagada' : ''
							}" bill-id="${bill.id}">
                            <h5>${fecha.date} - ${fecha.time}</h5>
                            <ul>
                                ${articulos}

                            </ul>
                            <div class="note-info d-flex">
                                <div class="multa-author"><i class="fas fa-user"></i> ${bill.author
							}</div>
                                <div class="multa-price"><i class="fas fa-dollar-sign"></i> ${bill.price
							}$</div>
                                <div class="multa-"><i class="fas fa-gavel"></i> ${bill.months
							} ${Translations.Month}</div>
                            </div>
                            <div class="delete-button">
                                <i class="fa-solid fa-trash"></i>
                            </div>
                        </li>
                        `;
					});
				} else {
					citizenBills = `
                    <li class="list-group-item list-group-item-action no-notes">
                        <h5>${Translations.NoRegisteredFines}</h5>
                    </li>`;
				}

				if (cb.notes.length > 0) {
					cb.notes.map(function (note) {
						const date = timeStampToDate(note.date);
						if (note.fixed) {
							citizenNotesPinned += `
                            <li class="list-group-item list-group-item-action pinned" note-id="${note.id}">
                                <h5 class="note-title-text">${note.title}</h5>
                                <p class="note-content-text">${note.description}</p>
                                <div class="note-info d-flex">
                                    <div class="note-author"><i class="fas fa-user"></i> ${note.author}</div>
                                    <div class="note-date"><i class="fas fa-calendar-alt"></i> ${date.date}</div>
                                    <div class="note-hour"><i class="fas fa-clock"></i> ${date.time}</div>
                                </div>
                                <div class="edit-note-button">
                                    <i class="fas fa-edit"></i>
                                </div>
                                <div class="delete-button">
                                    <i class="fa-solid fa-trash"></i>
                                </div>
                                <div class="pin-button">
                                    <i class="fas fa-thumbtack"></i>
                                </div>
                            </li>`;
						} else {
							citizenNotes += `
                            <li class="list-group-item list-group-item-action" note-id="${note.id}">
                                <h5 class="note-title-text">${note.title}</h5>
                                <p class="note-content-text">${note.description}</p>
                                <div class="note-info d-flex">
                                    <div class="note-author"><i class="fas fa-user"></i> ${note.author}</div>
                                    <div class="note-date"><i class="fas fa-calendar-alt"></i> ${date.date}</div>
                                    <div class="note-hour"><i class="fas fa-clock"></i> ${date.time}</div>
                                </div>
                                <div class="edit-note-button">
                                    <i class="fas fa-edit"></i>
                                </div>
                                <div class="delete-button">
                                    <i class="fa-solid fa-trash"></i>
                                </div>
                                <div class="pin-button">
                                    <i class="fas fa-thumbtack"></i>
                                </div>
                            </li>`;
						}
					});
				} else {
					citizenNotes = `
                    <li class="list-group-item list-group-item-action no-notes">
                        <h5>${Translations.NoRegisteredNotes}</h5>
                    </li>`;
				}

				if (cb.vehicles.length > 0) {
					cb.vehicles.map(function (vehicle) {
						citizenVehicles += `
                        <li class="list-group-item list-group-item-action link-vehiculo" data-plate="${vehicle.plate}" style="cursor: pointer;">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="vehicle-title d-flex align-items-center">
                                    <h5>${vehicle.label}</h5>
                                    <div class="vehicle-plate">
                                        <p>${Translations.LicensePlate} <i class="fas fa-angle-right"></i> ${vehicle.plate
							}</p>
                                    </div>
                                </div>
                                <div class="confiscado">${vehicle.status} ${vehicle.wanted
								? ' <span class="text-danger fw-bold"><i class="fas fa-search"></i> COD.9</span>'
								: ''
							} </div>
                            </div>
                        </li>
                        `;
					});
				} else {
					citizenVehicles = `
                    <li class="list-group-item list-group-item-action no-notes">
                        <div class="d-flex justify-content-between align-items-center">
                        <h5>${Translations.NoData}</h5>
                        </div>
                    </li>`;
				}

				if (cb.properties.length > 0) {
					cb.properties.map(function (property) {
						citizenProperties += `
                        <li class="list-group-item list-group-item-action">
                            <div class="d-flex justify-content-between align-items-center">
                                <h5>${property}</h5>
                            </div>
                        </li>
                        `;
					});
				} else {
					citizenProperties = `
                    <li class="list-group-item list-group-item-action no-notes">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5>${Translations.NoData}</h5>
                        </div>
                    </li>`;
				}

				if (cb.weapons.length > 0) {
					cb.weapons.map(function (weapon, index) {
						citizenWeapons += `
						<li class="list-group-item list-group-item-action" weapon-index="${index}" weapon-name="${weapon.name}" weapon-serie="${weapon.serie}">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="vehicle-title d-flex align-items-center">
                                    <div class="vehicle-plate">
                                        <p>${weapon.name} <i class="fas fa-angle-right"></i> ${weapon.serie}</p>
                                        ${weapon.addedBy ? `<small class="text-muted" style="font-size: 0.9vh; opacity: 0.7;"><i class="fas fa-user"></i> ${Translations.AddedBy || 'Añadido por'}: ${weapon.addedBy}</small>` : ''}
                                    </div>
                                </div>
                                <div class="delete-button delete-weapon">
                                    <i class="fa-solid fa-trash"></i>
                                </div>
                            </div>
                        </li>
						`;
					});
				} else {
					citizenWeapons = `
					<li class="list-group-item list-group-item-action no-notes no-weapons">
						<div class="d-flex justify-content-between align-items-center">
							<h5>${Translations.NoData}</h5>
						</div>
					</li>`;
				}

				if (cb.insurances && cb.insurances.length > 0) {
					cb.insurances.map(function (insurance) {
						const datetime = timeStampToDate(insurance.expire * 1000);
						citizenInsurances += `
						<li class="list-group-item list-group-item-action" insurance-id="${insurance.id}">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="vehicle-title d-flex align-items-center">
                                    <div class="vehicle-plate">
                                        <p>${insurance.name} <i class="fas fa-angle-right"></i> ${insurance.type}</p>
                                        <h5 class="expire">${Translations.Expiration + ': ' + datetime.date + ' - ' + datetime.time}</h5>
										${insurance.addedBy ? `<small class="text-muted" style="font-size: 0.9vh; opacity: 0.7;"><i class="fas fa-user"></i> ${Translations.AddedBy}: ${insurance.addedBy}</small>` : ''}
                                    </div>
                                </div>
                                <div class="delete-button delete-insurance">
                                    <i class="fa-solid fa-trash"></i>
                                </div>
                            </div>
                        </li>
						`;
					});
				} else {
					citizenInsurances = `
					<li class="list-group-item list-group-item-action no-notes no-insurances">
						<div class="d-flex justify-content-between align-items-center">
							<h5>${Translations.NoInsurances}</h5>
						</div>
					</li>`;
				}

				if (cb.licenses && typeof cb.licenses === 'string') {
					cb.licenses = JSON.parse(cb.licenses);
				}
				if (cb.licenses && cb.licenses.length > 0) {
					cb.licenses.map(function (license) {
						const datetime = timeStampToDate(
							parseInt(license.expire) * 1000
						);

						citizenLicenses += `
                            <li class="list-group-item list-group-item-action" expire="${license.expire}" lictype="${license.type}" dbid="${license.id || ''}">
                                <span>${license.name}</span> <h5 class="expire">${Translations.Expiration + ': ' + datetime.date + ' - ' + datetime.time}</h5>
                                ${license.addedBy ? `<small class="text-muted" style="font-size: 0.9vh; opacity: 0.7;"><i class="fas fa-user"></i> ${Translations.AddedBy || 'Emitida por'}: ${license.addedBy}</small>` : ''}
                                <div class="delete-button">
                                    <i class="fa-solid fa-trash"></i>
                                </div>
                            </li>
                            `;
					});
				} else {
					citizenLicenses = `
                        <li class="list-group-item list-group-item-action no-notes">
                            <div class="d-flex justify-content-between align-items-center">
                                <h5>${Translations.NoData}</h5>
                            </div>
                        </li>`;
				}
				if (cb.reports && cb.reports.length > 0) {
					cb.reports.map(function (report) {
						citizenReports += `
                        <div class="informe">
                            <span class="report-name">${report.title}</span> #<span class="report-id">${report.id}</span>
                        </div>`;
					});
				} else {
					citizenReports = `
                        <ul class="list-group w-100">
                            <li class="list-group-item list-group-item-action no-notes">
                                <h5>${Translations.NoData}</h5>
                            </li>
                        </ul>
                    `;
				}

				let birthdate = cb.birthdate.split('-');

				if (typeof cb.phone === "object") {
					cb.phone = cb.phone.join(', ');
				}

				let category = (policeFunctions.getCategory() || "").toLowerCase();
				let isAmbulance = (category == 'ambulance');
				let isSaspa = (category == 'saspa');
				let isRestrictedJob = isAmbulance || isSaspa;

				$(policeTabSelected + ' .citizen-ficha').fadeOut(300, function () {
					$(this).attr('citizen-id', cb.citizenid);
					$(this).attr('citizen-name', cb.firstname + ' ' + cb.lastname);
					$(this)
						.html(
							`
                <div class="row d-flex align-items-center m-titles citizen-info-all mt-0">
                    <div class="col-2 p-0 position-relative">
                        ${cb.wanted ? `<div class="wanted-tag p-1 w-100 text-center" style="position:absolute; bottom:-1vh; font-size: 1vh; left:0; right:0; margin:auto; z-index:10;">EN BÚSQUEDA Y CAPTURA</div>` : ''}
                        <div class="citizen-photo ${cb.wanted ? 'wanted' : ''}" style="background-image:url('${cb.image || defaultImage
							}');filter:hue-rotate(-${currentHueDeg}deg); ${cb.wanted ? 'border: 2px solid #ff0000; box-shadow: 0 0 15px #ff0000;' : ''}">
                            <div class="edit-photo"><img src="./img/webp/edit.webp"></div>
                        </div>
                    </div>
                    <div class="col-10 pe-0">
                        <div class="d-flex w-100 flex-data">
                            <div class="w-33">
                                <div class="info-box m-1">
                                    <div class="info-box-title">${Translations.Name}</div>
                                    <div class="info-box-value">${cb.firstname}</div>

                                </div>
                            </div>
                            <div class="w-33">
                                <div class="info-box m-1">
                                    <div class="info-box-title">${Translations.Surname}</div>
                                    <div class="info-box-value">${cb.lastname}</div>

                                </div>
                            </div>
                            <div class="w-33">
                                <div class="info-box m-1">
                                    <div class="info-box-title">${Translations.Gender}</div>
                                    <div class="info-box-value">${cb.gender}</div>

                                </div>
                            </div>
                            <div class="w-33">
                                <div class="info-box m-1">
                                    <div class="info-box-title">${Translations.Nationality}</div>
                                    <div class="info-box-value">${cb.nationality}</div>

                                </div>
                            </div>
                            <div class="w-33">
                                <div class="info-box m-1">
                                    <div class="info-box-title">${Translations.Birthdate}</div>
                                    <div class="info-box-value">${birthdate[0]}</div>

                                </div>
                            </div>
                            <div class="w-33">
                                <div class="info-box m-1">
                                    <div class="info-box-title">${Translations.Id}</div>
                                    <div class="info-box-value citizenid" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${cb.citizenid
							}</div>

                                </div>
                            </div>
                            <div class="w-33">
                                <div class="info-box m-1">
                                    <div class="info-box-title">${Translations.PhoneNumber}</div>
                                    <div class="info-box-value">${cb.phone || 'Unknown'
							}</div>

                                </div>
                            </div>
                            <div class="w-33">
                                <div class="info-box m-1">
                                    <div class="info-box-title">${Translations.BankAccount}</div>
                                    <div class="info-box-value">${cb.iban}</div>

                                </div>
                            </div>
                            <div class="w-33">
                                <div class="info-box m-1">
                                    <div class="info-box-title">${Translations.Job}</div>
                                    <div class="info-box-value">${cb.job}</div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12 pe-1 text-center">
                        <div class="info-box m-1">
                            <div class="row">
                                <div class="col-6">
                                    <h4>${Translations.InSearchCapture}</h4>
                                    <div class="busca-captura btn-group mt-2 w-100" citizen-id="${cb.citizenid
							}" role="group" aria-label="Basic radio toggle button group">
                                        <input type="radio" class="btn-check si" name="btn-wanted-${cb.citizenid
							}" id="btn-wanted-${cb.citizenid
							}-1" autocomplete="off" ${cb.wanted == 1 && 'checked'}>
                                        <label class="btn btn-outline-primary" for="btn-wanted-${cb.citizenid
							}-1">${Translations.Yes}</label>

                                        <input type="radio" class="btn-check" name="btn-wanted-${cb.citizenid
							}" id="btn-wanted-${cb.citizenid
							}-2" autocomplete="off" ${cb.wanted == 0 && 'checked'}>
                                        <label class="btn btn-outline-primary no" for="btn-wanted-${cb.citizenid
							}-2">${Translations.No}</label>
                                    </div>
                                </div>
                                <div class="col-6 border-left text-center">
                                    <h4>${Translations.Dangerous}</h4>
                                    <div class="dangerous btn-group mt-2 w-100" citizen-id="${cb.citizenid
							}" role="group" aria-label="Basic radio toggle button group">
                                        <input type="radio" class="btn-check si" name="btn-dangerous-${cb.citizenid
							}" id="btn-dangerous-${cb.citizenid
							}-1" autocomplete="off" ${cb.dangerous == 1 && 'checked'}>
                                        <label class="btn btn-outline-primary" for="btn-dangerous-${cb.citizenid
							}-1">${Translations.Yes}</label>

                                        <input type="radio" class="btn-check" name="btn-dangerous-${cb.citizenid
							}" id="btn-dangerous-${cb.citizenid
							}-2" autocomplete="off" ${cb.dangerous == 0 && 'checked'}>
                                        <label class="btn btn-outline-primary no" for="btn-dangerous-${cb.citizenid
							}-2">${Translations.No}</label>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-6 pe-1">
                        <div class="info-box m-1 mt-2">
                            <div class="notes-title d-flex justify-content-between align-items-center">
                                <h4><i class="fas fa-quote-right"></i> ${Translations.Notes}</h4>
                                <div class="new-button new-note"><i class="fas fa-plus"></i> ${Translations.NewNote}</div>
                            </div>
                            <div class="citizen-info-container mt-2">
                                <ul class="list-group notes-list-pinned">
                                    ${citizenNotesPinned}
                                </ul>
                                <ul class="list-group notes-list mt-2">
                                    ${citizenNotes}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 ps-1">
                        <div class="info-box m-1 mt-2">
                            <div class="d-flex justify-content-between align-items-center">
                                <h4><i class="fas fa-book"></i> ${Translations.Fine}</h4>
                                <div class="new-button new-multa"><i class="fas fa-plus"></i> ${Translations.AddFine}</div>
                            </div>
                            <div class="citizen-info-container mt-2">
                                <ul class="list-group multas-list">
                                   ${citizenBills}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 pe-1">
                        <div class="info-box m-1 mt-2">
                            <div class="d-flex justify-content-between align-items-center">
                                <h4><i class="fas fa-sticky-note"></i> ${Translations.Reports}</h4>
                            </div>
                            <div class="citizen-info-container-mini mt-2 d-flex flex-wrap citizen-informes align-content-start">
                                ${citizenReports}
                            </div>
                        </div>
                    </div>
                    <div class="col-6 ps-1">
						<div class="row">
							${!isRestrictedJob ? `
							<div class="col-6 pe-1">
								<div class="info-box m-1 mt-2">
									<div class="d-flex justify-content-between align-items-center">
										<h4><i class="fas fa-id-card"></i> ${Translations.Licenses}</h4>
										<div class="new-button add-license"><i class="fas fa-plus"></i> ${Translations.AddLicense}</div>
									</div>
									<div class="citizen-info-container-mini mt-2">
										<ul class="list-group licenses-list">
										${citizenLicenses}
										</ul>
									</div>
								</div>
							</div>
							` : ''}
							<div class="${isRestrictedJob ? 'col-12' : 'col-6'} ps-1">
								<div class="info-box m-1 mt-2">
									<div class="d-flex justify-content-between align-items-center">
										<h4><i class="fas ${isAmbulance ? 'fa-shield-heart' : 'fa-gun'}"></i> ${isAmbulance ? Translations.Insurances : (Translations.Weapons || 'ARMAS')}</h4>
										<div class="new-button ${isAmbulance ? 'add-insurance' : 'add-weapon'}"><i class="fas fa-plus"></i> ${isAmbulance ? Translations.AddInsurance : (Translations.AddWeapon || 'Añadir Arma')}</div>
									</div>
									<div class="citizen-info-container-mini mt-2">
										<ul class="list-group ${isAmbulance ? 'insurances-list' : 'weapons-list'}">
										${isAmbulance ? citizenInsurances : citizenWeapons}
										</ul>
									</div>
								</div>
							</div>
						</div>
                    </div>
					${!isRestrictedJob ? `
                    <div class="col-6 pe-1">
                        <div class="info-box m-1 mt-2">
                            <div class="d-flex justify-content-between align-items-center">
                                <h4><i class="fas fa-car"></i> ${Translations.Vehicles}</h4>
                            </div>
                            <div class="citizen-info-container-mini mt-2">
                                <ul class="list-group">
                                    ${citizenVehicles}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 ps-1">
                        <div class="info-box m-1 mt-2">
                            <div class="d-flex justify-content-between align-items-center">
                                <h4><i class="fas fa-house"></i> ${Translations.Houses}</h4>
                            </div>
                            <div class="citizen-info-container-mini mt-2">
                                <ul class="list-group">
                                    ${citizenProperties}
                                </ul>
                            </div>
                        </div>
                    </div>
					` : ''}
					<div class="col-12" style="display:${Object.entries(citizenAnkle).length != 0 ? "block" : "none"}">
                        <div class="info-box m-1 mt-2">
                            <div class="d-flex justify-content-between align-items-center">
                                <h4><i class="fas fa-ring"></i> ANKLES</h4>
                            </div>
                            <div class="citizen-info-container-mini mt-2" style="display: flex;height: 25vh;border-radius: 11px;">
								<div class="col-7" id="anklemap"></div>
								<div class="col-5">
									<div style="margin-left: 2vh;">
										<h4><i class="fas fa-book"></i> ${Translations.AgentsInvolved}</h4>
										<div class="list-group-item list-group-item-action scale-in" style="border-radius: 6px;margin-top: 0.5vh;">
											<div class="d-flex align-items-center">
												<h5 class="persona-name">${citizenAnkle.policeLabel != null ? citizenAnkle.policeLabel : "none"}</h5>
											</div>
										</div>
										<h4 style="margin-top: 2vh;"><i class="fas fa-calendar-days"></i> ${Translations.LogsDate}</h4>
										<div class="d-flex" style="gap: 0.5vh;border-radius: 6px;margin-top: 0.5vh;">
												

									<li class="list-group-item list-group-item-action" expire="1893456000" lictype="driver" style="border-radius: 0.5vh;">
										<span>Registered</span>
										<h5 class="expire">${citizenAnkle.date != null ? new Date(citizenAnkle.date).toISOString().replace('T', ' ').substring(0, 19) : "none"}</h5>
									</li>
									<li class="list-group-item list-group-item-action" expire="1893456000" lictype="driver" style="border-radius: 0.5vh;">
										<span>Last Shock</span> 
										<h5 class="expire">${citizenAnkle.lastShock != null ? (citizenAnkle.lastShock == 0 ? "None" : new Date(citizenAnkle.lastShock).toISOString().replace('T', ' ').substring(0, 19)) : "none"}</h5>
									</li>
								</div>
								<h4 style="margin-top: 2vh;"><i class="fas fa-bars"></i> ${Translations.Action}</h4>
								<div style="gap: 0.5vh;display: flex;">
									<button onclick="ZoomAnkleBlip()" class="btn-action ankle-localize" style="display: flex;width: 100%;text-align: center;align-items: center;gap: .25vw;font-size: 1.4vh;">
										<i class="fas fa-location-dot"></i> <span>${Translations.Localize}</span>
									</button><button onclick="AnkleTase(${citizenAnkle.targetId})" class="btn-action ankle-tase" style="display: flex;width: 100%;text-align: center;align-items: center;gap: .25vw;font-size: 1.4vh;">
										<i class="fas fa-bolt"></i> <span>${Translations.Tase}</span>
									</button>
          						</div>
                            </div>
							</div>
                            </div>
                        </div>
                    </div>
                </div>

                `
						)
						.fadeIn(300);
				});
				setTimeout(() => {
					try {
						var imageElement = $(policeTabSelected + ' .citizen-ficha .citizen-photo');
						var style = imageElement.css('background-image');
						const regex = /"([^"]*)"/g;
						let resultado;
						const resultados = [];

						while ((resultado = regex.exec(style)) !== null) {
							resultados.push(resultado[1]);
						}
						var url = resultados[0];
						var img = new Image();
						img.src = url;
						img.onerror = function () {
							imageElement.css('background-image', 'url(' + defaultImage + ')');
						}
					}
					catch (e) { }
				}, 350);
				if (Object.entries(citizenAnkle).length != 0)
					setTimeout(() => {
						LoadAnkleMap(citizenAnkle);
					}, 500);
			} else {
				$(policeTabSelected + ' .citizen-ficha').fadeOut(300, function () {
					$(this).html(`<h5>${Translations.NoData}</h5>`).fadeIn(300);
				});
			}
		});
	},

	newNote: (type) => {
		let agentClass = '';
		if (type) {
			agentClass = 'agente';
		}
		const noteHtml = `
            <li class="list-group-item list-group-item-action scale-in">
                <h5><input class="input note-title w-100" placeholder="${Translations.NoteTitle}"></h5>
                <p><textarea rows="4" class="input note-text w-100 mt-1" placeholder="${Translations.TextNote}"></textarea></p>
                <div class="d-flex justify-content-between mt-2">
                    <div class="btn btn-secondary cancel-note-button btn-sm me-2">${Translations.Cancel}</div>
                    <div class="btn btn-secondary new-note-button btn-sm" type="${agentClass}">${Translations.Save}</div>
                </div>
            </li>`;
		if ($('.police ' + policeTabSelected + ' .notes-list .no-notes').length > 0) {
			$('.police ' + policeTabSelected + ' .notes-list .no-notes').fadeOut(
				300,
				function () {
					$(this).remove();
					$('.police ' + policeTabSelected + ' .notes-list').append(noteHtml);
				}
			);
		} else {
			$('.police ' + policeTabSelected + ' .notes-list').prepend(noteHtml);
		}
	},

	cargarFoto: (type) => {
		if (type) {
			CloseModal();
			const citizenid = $(
				'.police ' + policeTabSelected + ' .info-box-value.citizenid'
			)
				.text()
				.trim();
			fetch('TakePicture', { citizenid }).done((cb) => {
				if (cb) {
					$('.police ' + policeTabSelected + ' .citizen-photo').css(
						'background-image',
						"url('" + cb + "')"
					);
					$('.police ' + policeTabSelected + ' .citizen-photo').css(
						'filter',
						`hue-rotate(-${currentHueDeg}deg)`
					);
					$('.police .white-block .citizen-image.image-' + citizenid).css(
						'background-image',
						"url('" + cb + "')"
					);
					$('.police .white-block .citizen-image.image-' + citizenid).css(
						'filter',
						`hue-rotate(-${currentHueDeg}deg)`
					);
					$('.police .white-block .image-' + citizenid).css(
						'background-image',
						"url('" + cb + "')"
					);
				}
			});
			$('.screen').removeClass('show');
			$.post('https://origen_police/close', JSON.stringify({}));
		} else {
			CloseModal();
			OpenModal(
				Translations.EnterURLImage,
				`
                <input class="form-control w-100 url-nueva-foto" placeholder="URL">
            `,
				`<button class="btn-modal" onclick="policeFunctions.guardarFoto($('.url-nueva-foto').val())">${Translations.SaveImage}</button>`,
				Translations.Cancel
			);
		}
	},

	guardarFoto: (value) => {
		CloseModal();
		const citizenid = $('.police ' + policeTabSelected + ' .info-box-value.citizenid')
			.text()
			.trim();

		TriggerCallback('origen_police:police:UpdateCitizenImage', {
			citizenid,
			value
		}).done((cb) => {
			if (cb) {
				$('.police ' + policeTabSelected + ' .citizen-photo').css(
					'background-image',
					"url('" + value + "')"
				);
				$('.police ' + policeTabSelected + ' .citizen-photo').css(
					'filter',
					`hue-rotate(-${currentHueDeg}deg)`
				);
				$('.police .white-block .image-' + citizenid).css(
					'background-image',
					"url('" + value + "')"
				);
			}
		});
	},

	loadFederalList: () => {
		TriggerCallback('origen_police:server:GetFederalList', {}).done((cb) => {
			const entries = [];
			if (cb) {
				Object.entries(cb).forEach(([citizenid, data]) => {
					entries.push({
						citizenid,
						...data
					});
				});
			}

			policeFunctions.federalCache = entries;
			policeFunctions.renderFederalList(entries);
			policeFunctions.renderFederalEmptyDetail(entries.length === 0);
		});
	},

	renderFederalEmptyDetail: (noData = false) => {
		const icon = noData ? 'fa-building-shield' : 'fa-id-card';
		const message = noData
			? (Translations.NoFederals || 'No hay internos federales')
			: 'Selecciona una ficha para ver la informacion federal';

		$('.police ' + policeTabSelected + ' .federal-detail').html(`
			<div class="d-flex flex-column align-items-center justify-content-center text-center" style="height: 100%; min-height: 40vh; opacity: 0.75;">
				<i class="fas ${icon}" style="font-size: 3.2vh; margin-bottom: 1.2vh; color: var(--primary-color);"></i>
				<div style="font-family: 'Quicksand', sans-serif; font-size: 1.2vh; text-transform: uppercase; letter-spacing: 0.05vh;">
					${message}
				</div>
			</div>
		`);
	},

	renderFederalList: (entries) => {
		const $root = $('.police ' + policeTabSelected + ' .federal-admin');
		policeFunctions.setServiceBadge('federal', (entries || []).length);

		const $list = $root.find('.federal-list');
		$list.html('');

		if (!entries || entries.length === 0) {
			$list.html(`
				<div class="col-12 text-muted">
					<h4 class="report-name">${Translations.NoResultFound}</h4>
				</div>
			`);
			return;
		}

		entries.forEach((citizen) => {
			const fecha = citizen.date ? timeStampToDate(citizen.date) : { date: '-', time: '-' };
			$list.append(`
				<div class="white-block report scale-in open-case" data-citizenid="${citizen.citizenid}">
					<i class="fas fa-building-shield" aria-hidden="true"></i>
					<div class="report-name">
						${citizen.name || 'SIN NOMBRE'} <span>#${citizen.citizenid}</span>
					</div>
					<div class="d-flex w-100">
						<div class="w-50">
							<div class="report-owner">
								<i class="fas fa-clock" aria-hidden="true"></i>
								<span>${citizen.time || 0} ${Translations.RemainMonth || 'meses restantes'}</span>
							</div>
						</div>
						<div class="w-50">
							<div class="report-date">
								<i class="fas fa-calendar-alt" aria-hidden="true"></i>
								<span>${fecha.date} - ${fecha.time}</span>
							</div>
						</div>
					</div>
				</div>
			`);
		});
	},

	searchFederal: () => {
		const text = ($('.police ' + policeTabSelected + ' .input-search-federal').val() || '').trim().toLowerCase();
		if (!text.length) {
			policeFunctions.renderFederalList(policeFunctions.federalCache || []);
			return;
		}

		const filtered = (policeFunctions.federalCache || []).filter((citizen) => {
			const byName = (citizen.name || '').toLowerCase().includes(text);
			const byId = String(citizen.citizenid || '').toLowerCase().includes(text);
			const byDanger = (citizen.danger || '').toLowerCase().includes(text);
			return byName || byId || byDanger;
		});

		policeFunctions.renderFederalList(filtered);
	},

	selectFederal: (citizenid) => {
		const list = policeFunctions.federalCache || [];
		const citizen = list.find((item) => String(item.citizenid) === String(citizenid));
		if (!citizen) return;

		const fecha = citizen.date ? timeStampToDate(citizen.date) : { date: '-', time: '-' };
		$('.police ' + policeTabSelected + ' .federal-list .report').removeClass('selected');
		$('.police ' + policeTabSelected + ` .federal-list .report[data-citizenid="${citizen.citizenid}"]`).addClass('selected');

		$('.police ' + policeTabSelected + ' .federal-detail').html(`
			<div class="title-2 mb-3">${citizen.name || 'SIN NOMBRE'} <span style="opacity:0.6;">#${citizen.citizenid}</span></div>
			<div class="row">
				<div class="col-6 mb-2">
					<div class="info-box">
						<div class="info-box-title">CONDENA INICIAL</div>
						<div class="info-box-value">${citizen.initial || 0} ${Translations.Month || 'meses'}</div>
					</div>
				</div>
				<div class="col-6 mb-2">
					<div class="info-box">
						<div class="info-box-title">TIEMPO RESTANTE</div>
						<div class="info-box-value">${citizen.time || 0} ${Translations.RemainMonth || 'meses restantes'}</div>
					</div>
				</div>
				<div class="col-6 mb-2">
					<div class="info-box">
						<div class="info-box-title">PELIGROSIDAD</div>
						<div class="info-box-value">${citizen.danger || '-'}</div>
					</div>
				</div>
				<div class="col-6 mb-2">
					<div class="info-box">
						<div class="info-box-title">INGRESO</div>
						<div class="info-box-value">${citizen.joinedfrom || '-'}</div>
					</div>
				</div>
				<div class="col-12 mb-2">
					<div class="info-box">
						<div class="info-box-title">FECHA DE CONDENA</div>
						<div class="info-box-value">${fecha.date} - ${fecha.time}</div>
					</div>
				</div>
				<div class="col-12 mb-2">
					<div class="info-box">
						<div class="info-box-title">ESTADO</div>
						<div class="info-box-value">${citizen.online ? (Translations.ServingSentance || 'Cumpliendo condena') : (Translations.Sleeping || 'Desconectado')}</div>
					</div>
				</div>
				<div class="col-12 mt-2">
					<button class="btn btn-secondary w-100" onclick="policeFunctions.liberarPreso('${citizen.citizenid}')">
						${Translations.Release || 'Liberar'}
					</button>
				</div>
			</div>
		`);
	},

	loadDebtorsList: () => {
		TriggerCallback('origen_police:police:GetMorosos', {}).done((cb) => {
			const entries = Array.isArray(cb) ? cb : [];
			entries.sort((a, b) => (a.name || '').localeCompare(b.name || ''));

			policeFunctions.debtorsCache = entries;
			policeFunctions.renderDebtorsList(entries);
			policeFunctions.renderDebtorsEmptyDetail(entries.length === 0);
		});
	},

	renderDebtorsEmptyDetail: (noData = false) => {
		const icon = noData ? 'fa-file-invoice-dollar' : 'fa-id-card';
		const message = noData
			? (Translations.NoDebtors || 'No hay deudores')
			: 'Selecciona una ficha para ver la informacion de deuda';

		$('.police ' + policeTabSelected + ' .debtors-detail').html(`
			<div class="d-flex flex-column align-items-center justify-content-center text-center" style="height: 100%; min-height: 40vh; opacity: 0.75;">
				<i class="fas ${icon}" style="font-size: 3.2vh; margin-bottom: 1.2vh; color: var(--primary-color);"></i>
				<div style="font-family: 'Quicksand', sans-serif; font-size: 1.2vh; text-transform: uppercase; letter-spacing: 0.05vh;">
					${message}
				</div>
			</div>
		`);
	},

	renderDebtorsList: (entries) => {
		const $root = $('.police ' + policeTabSelected + ' .debtors-admin');
		policeFunctions.setServiceBadge('debtors', (entries || []).length);

		const $list = $root.find('.debtors-list');
		$list.html('');

		if (!entries || entries.length === 0) {
			$list.html(`
				<div class="col-12 text-muted">
					<h4 class="report-name">${Translations.NoResultFound}</h4>
				</div>
			`);
			return;
		}

		entries.forEach((citizen) => {
			$list.append(`
				<div class="white-block report scale-in null-case" data-citizenid="${citizen.citizenid}">
					<i class="fas fa-file-invoice-dollar" aria-hidden="true"></i>
					<div class="report-name">
						${citizen.name || 'SIN NOMBRE'} <span>#${citizen.citizenid || '-'}</span>
					</div>
					<div class="d-flex w-100">
						<div class="w-50">
							<div class="report-owner">
								<i class="fas fa-wallet" aria-hidden="true"></i>
								<span>${citizen.price || 0} $</span>
							</div>
						</div>
						<div class="w-50">
							<div class="report-date">
								<i class="fas fa-user" aria-hidden="true"></i>
								<span>${Translations.Debtors || 'Deudor'}</span>
							</div>
						</div>
					</div>
				</div>
			`);
		});
	},

	searchDebtors: () => {
		const text = ($('.police ' + policeTabSelected + ' .input-search-debtor').val() || '').trim().toLowerCase();
		if (!text.length) {
			policeFunctions.renderDebtorsList(policeFunctions.debtorsCache || []);
			return;
		}

		const filtered = (policeFunctions.debtorsCache || []).filter((citizen) => {
			const byName = (citizen.name || '').toLowerCase().includes(text);
			const byId = String(citizen.citizenid || '').toLowerCase().includes(text);
			return byName || byId;
		});

		policeFunctions.renderDebtorsList(filtered);
	},

	selectDebtor: (citizenid) => {
		const list = policeFunctions.debtorsCache || [];
		const citizen = list.find((item) => String(item.citizenid) === String(citizenid));
		if (!citizen) return;

		$('.police ' + policeTabSelected + ' .debtors-list .report').removeClass('selected');
		$('.police ' + policeTabSelected + ` .debtors-list .report[data-citizenid="${citizen.citizenid}"]`).addClass('selected');

		$('.police ' + policeTabSelected + ' .debtors-detail').html(`
			<div class="title-2 mb-3">${citizen.name || 'SIN NOMBRE'} <span style="opacity:0.6;">#${citizen.citizenid || '-'}</span></div>
			<div class="row">
				<div class="col-6 mb-2">
					<div class="info-box">
						<div class="info-box-title">CIUDADANO</div>
						<div class="info-box-value">${citizen.name || '-'}</div>
					</div>
				</div>
				<div class="col-6 mb-2">
					<div class="info-box">
						<div class="info-box-title">ID</div>
						<div class="info-box-value">${citizen.citizenid || '-'}</div>
					</div>
				</div>
				<div class="col-12 mb-2">
					<div class="info-box">
						<div class="info-box-title">DEUDA PENDIENTE</div>
						<div class="info-box-value text-danger fw-bold">${citizen.price || 0} $</div>
					</div>
				</div>
			</div>
		`);
	},

	openAddCondenaModal: () => {
		OpenModal(
			Translations.AddConden || 'Añadir condena',
			`
			<div class="row">
				<div class="col-12 mb-3">
					<div class="p-3 rounded" style="background: rgba(0,0,0,0.2); border: 1px solid rgba(255,255,255,0.1);">
						<div class="row">
							<div class="col-12 mb-2">
								<label class="form-label">${Translations.CitizenID || 'ID del ciudadano'}</label>
								<input type="number" class="form-control w-100 input-id-condena" placeholder="${Translations.CitizenID || 'ID del ciudadano'}">
							</div>
							<div class="col-12 mb-2">
								<label class="form-label">${Translations.Sentence || 'Condena'} (${Translations.Month || 'Meses'})</label>
								<input type="number" class="form-control w-100 input-meses-condena" placeholder="${Translations.Sentence || 'Condena'} (${Translations.Month || 'Meses'})">
							</div>
						</div>
					</div>
				</div>
			</div>
			`,
			`<button class="btn-modal" onclick="policeFunctions.addCondenaFederal()">${Translations.Add || 'Añadir'}</button>`,
			Translations.Cancel || 'Cancelar',
			52
		);
	},

	addCondenaFederal: () => {
		if (HasPermissionMenu('AddFederal')) return sendNotification('error', Translations.NoPermissionPage);
		const id = $('.c-modal .input-id-condena').val().trim();
		const condena = $('.c-modal .input-meses-condena').val().trim();

		if (id.length != 0 && condena > 0 && condena < 10000) {
			fetch('ExecuteCommand', {
				command: 'jail ' + id + ' ' + condena
			}).done((cb) => {
				if (cb) {
					CloseModal();
					if ($('.police ' + policeTabSelected + ' .federal-admin').length > 0) {
						policeFunctions.loadFederalList();
					}
				} else {
					sendNotification('error', Translations.ErrorOccurred);
				}
			});
		} else {
			sendNotification('error', Translations.ErrorOccurred);
		}
	},

	liberarPreso: (cid) => {
		TriggerCallback('origen_police:server:releasefederal', {
			citizenid: cid
		}).done((cb) => {
			if (cb) {
				if ($('.police ' + policeTabSelected + ' .federal-admin').length > 0) {
					policeFunctions.loadFederalList();
				} else {
					CloseModal();
				}
			} else {
				sendNotification('error', Translations.ErrorOccurred);
			}
		});
	},

	addCondena: (yo) => {

		policeFunctions.addCondenaFederal();
	},

	AddLicenseModal: (cid) => {
		let options = `<option value="">-- ${Translations.SelectLicense || 'Seleccionar Licencia'} --</option>`;
		availableLicensesTypes.forEach((lic, index) => {
			options += `<option value="${index}">${lic.name}</option>`;
		});

		const canManage = !HasPermissionMenu("ManageLicenses");
		const manageButton = canManage ? `<button class="btn-modal mb-3 w-100" onclick="CloseModal(); setTimeout(() => policeFunctions.manageLicensesTypes('${cid}'), 520)"><i class="fas fa-cog"></i> ${Translations.ManageLicenses || 'Gestionar Licencias'}</button>` : '';

		OpenModal(
			Translations.AddLicense || 'Añadir Licencia',
			`
			<div class="row">
				${manageButton}
				<div class="col-12 mb-3">
					<label class="form-label text-uppercase fw-bold" style="font-size: 1.2vh; opacity: 0.7;">${Translations.PreconfiguredLicenses || 'Licencias Preconfiguradas'}</label>
					<select class="form-control w-100 select-preconfigured-license" style="background: rgba(0,0,0,0.2); border: 1px solid rgba(255,255,255,0.1); color: white;">
						${options}
					</select>
				</div>
				<div class="col-12 mb-2">
					<label class="form-label">${Translations.LicenseName || 'Nombre de la Licencia'}</label>
					<input type="text" class="form-control w-100 input-license-name" placeholder="${Translations.LicenseName || 'Ej: Licencia de Armas'}">
				</div>
				<div class="col-12 mb-2">
					<label class="form-label">${Translations.LicenseType || 'Tipo de Licencia'}</label>
					<input type="text" class="form-control w-100 input-license-type" placeholder="${Translations.LicenseType || 'Ej: weapon, hunting, etc.'}">
				</div>
                <div class="col-6 mb-2">
					<label class="form-label">${Translations.ExpirationDate || 'Fecha de Expiración'}</label>
					<input type="date" class="form-control w-100 input-license-date">
				</div>
                <div class="col-6 mb-2">
					<label class="form-label">${Translations.ExpirationTime || 'Hora de Expiración'}</label>
					<input type="time" class="form-control w-100 input-license-time">
				</div>
			</div>
			`,
			`<button class="btn-modal" onclick="policeFunctions.saveLicense('${cid}')">${Translations.Save || 'Guardar'}</button>`,
			Translations.Cancel || 'Cancelar',
			50
		);

		$(document).off('change', '.select-preconfigured-license');
		$(document).on('change', '.select-preconfigured-license', function () {
			const val = $(this).val();
			if (val !== '') {
				const lic = availableLicensesTypes[val];
				$('.input-license-name').val(lic.name);
				$('.input-license-type').val(lic.type);

				const durationDays = lic.duration || 30;
				const futureDate = new Date();
				futureDate.setDate(futureDate.getDate() + durationDays);

				const year = futureDate.getFullYear();
				const month = String(futureDate.getMonth() + 1).padStart(2, '0');
				const day = String(futureDate.getDate()).padStart(2, '0');

				const hours = String(futureDate.getHours()).padStart(2, '0');
				const minutes = String(futureDate.getMinutes()).padStart(2, '0');

				$('.input-license-date').val(`${year}-${month}-${day}`);
				$('.input-license-time').val(`${hours}:${minutes}`);
			} else {
				$('.input-license-name').val('');
				$('.input-license-type').val('');
				$('.input-license-date').val('');
				$('.input-license-time').val('');
			}
		});
	},

	manageLicensesTypes: (cid) => {
		let rows = '';
		availableLicensesTypes.forEach((lic) => {
			rows += `
			<div class="col-12 mb-2">
				<div class="info-box p-2 d-flex justify-content-between align-items-center" style="background: rgba(255,255,255,0.05);">
					<div>
						<div class="fw-bold">${lic.name}</div>
						<small style="opacity: 0.7;">${lic.type} - ${lic.duration} ${Translations.days || 'días'}</small>
					</div>
					<button class="btn btn-danger btn-sm" onclick="policeFunctions.deleteLicenseType(${lic.id}, '${cid}')">
						<i class="fas fa-trash"></i>
					</button>
				</div>
			</div>`;
		});

		if (rows === '') rows = `<div class="col-12 text-center py-3 opacity-50">${Translations.NoData || 'No hay datos'}</div>`;

		OpenModal(
			Translations.ManageLicenses || 'Gestionar Licencias',
			`
			<div class="row" style="max-height: 50vh; overflow-y: auto;">
				<div class="col-12 mb-4">
					<div class="p-3 rounded" style="background: rgba(0,0,0,0.2); border: 1px solid rgba(255,255,255,0.1);">
						<h5 class="mb-3" style="font-size: 1.4vh;">${Translations.AddLicenseType || 'Añadir Tipo de Licencia'}</h5>
						<div class="row">
							<div class="col-12 mb-2">
								<input type="text" class="form-control w-100 input-new-lic-name" placeholder="${Translations.Name || 'Nombre'}">
							</div>
							<div class="col-6 mb-2">
								<input type="text" class="form-control w-100 input-new-lic-type" placeholder="${Translations.Type || 'Tipo'}">
							</div>
							<div class="col-6 mb-2">
								<input type="number" class="form-control w-100 input-new-lic-duration" placeholder="${Translations.Duration || 'Duración (Días)'}">
							</div>
							<div class="col-12">
								<button class="btn-modal w-100" onclick="policeFunctions.saveNewLicenseType('${cid}')">${Translations.Add || 'Añadir'}</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12">
					<h5 class="mb-2" style="font-size: 1.4vh;">${Translations.PreconfiguredLicenses || 'Licencias Guardadas'}</h5>
					<div class="row">
						${rows}
					</div>
				</div>
			</div>
			`,
			`<div></div>`,
			Translations.Back || 'Volver',
			60
		);

		$('.btn-cancel').attr('onclick', `CloseModal(); setTimeout(() => policeFunctions.AddLicenseModal('${cid}'), 520)`);
	},

	saveNewLicenseType: (cid) => {
		const name = $('.input-new-lic-name').val().trim();
		const type = $('.input-new-lic-type').val().trim();
		const duration = parseInt($('.input-new-lic-duration').val());

		if (name.length === 0 || type.length === 0 || isNaN(duration)) {
			sendNotification('error', Translations.FillAllFields || 'Rellena todos los campos');
			return;
		}

		TriggerCallback('origen_police:police:AddLicenseType', {
			label: name,
			type: type,
			duration: duration
		}).done((cb) => {
			if (cb && cb.success) {
				sendNotification('success', Translations.LicenseTypeAdded || 'Tipo de licencia añadido');
				availableLicensesTypes.push({
					id: cb.id,
					name: name,
					type: type,
					duration: duration
				});
				policeFunctions.manageLicensesTypes(cid);
			} else {
				sendNotification('error', Translations.ErrorOccurred);
			}
		});
	},

	deleteLicenseType: (id, cid) => {
		OpenModal(
			Translations.Atention || 'Atención',
			`<div class="text-center py-3">${Translations.AreYouSureDeleteLicense || '¿Estás seguro de querer eliminar este tipo de licencia?'}</div>`,
			`<button class="btn-modal" onclick="policeFunctions.deleteLicenseTypeConfirm(${id}, '${cid}')">${Translations.Confirm || 'Confirmar'}</button>`,
			Translations.Cancel || 'Cancelar'
		);
	},

	deleteLicenseTypeConfirm: (id, cid) => {
		TriggerCallback('origen_police:police:DeleteLicenseType', { id: id }).done((cb) => {
			if (cb) {
				sendNotification('success', Translations.LicenseTypeDeleted || 'Tipo de licencia eliminado');
				availableLicensesTypes = availableLicensesTypes.filter(lic => lic.id !== id);
				CloseModal();
				policeFunctions.manageLicensesTypes(cid);
			} else {
				sendNotification('error', Translations.ErrorOccurred);
			}
		});
	},

	saveLicense: (cid) => {
		const name = $('.input-license-name').val().trim();
		const type = $('.input-license-type').val().trim();
		const date = $('.input-license-date').val();
		const time = $('.input-license-time').val();

		if (name.length === 0 || type.length === 0 || !date || !time) {
			sendNotification('error', Translations.FillAllFields || 'Rellena todos los campos');
			return;
		}

		const expireDateTime = new Date(`${date}T${time}`);
		const expireTimestamp = Math.floor(expireDateTime.getTime() / 1000);

		if (expireTimestamp <= Math.floor(Date.now() / 1000)) {
			sendNotification('error', 'La fecha de expiración debe ser futura');
			return;
		}

		TriggerCallback('origen_police:police:AddLicense', {
			citizenid: cid,
			label: name,
			type: type,
			expire: expireTimestamp
		}).done((cb) => {
			if (cb && (cb === true || cb.success)) {
				const label = name;
				sendNotification('success', Translations.AddedLicense + ' ' + label);
				const datetime = timeStampToDate(
					expireTimestamp * 1000
				);
				$('.police ' + policeTabSelected + ' ul.licenses-list .no-notes').remove();
				$('.police .citizen-ficha .licenses-list').prepend(`
					<li class="list-group-item list-group-item-action scale-in" expire="${expireTimestamp}" lictype="${type}" dbid="${cb.id || ''}">
						<span>${label}</span> 
						<h5 class="expire">${Translations.Expiration + ': ' + datetime.date + ' - ' + datetime.time}</h5>
						<div class="delete-button">
							<i class="fa-solid fa-trash"></i>
						</div>
					</li>
				`);
				CloseModal();
			} else {
				sendNotification('error', Translations.ErrorOccurred);
			}
		});
	},

	addWeapon: (cid) => {
		OpenModal(
			Translations.AddWeapon || 'Añadir Arma',
			`
			<div class="row">
				<div class="col-12 mb-2">
					<label class="form-label">${Translations.WeaponName || 'Nombre del Arma'}</label>
					<input type="text" class="form-control w-100 input-weapon-name" placeholder="${Translations.WeaponNamePlaceholder || 'Ej: Pistola, Rifle, etc.'}">
				</div>
				<div class="col-12">
					<label class="form-label">${Translations.WeaponSerial || 'Número de Serie'}</label>
					<input type="text" class="form-control w-100 input-weapon-serie" placeholder="${Translations.WeaponSerialPlaceholder || 'Ej: ABC123456'}">
				</div>
			</div>
			`,
			`<button class="btn-modal" onclick="policeFunctions.saveWeapon('${cid}')">${Translations.Save || 'Guardar'}</button>`,
			Translations.Cancel || 'Cancelar',
			50
		);
	},

	saveWeapon: (cid) => {
		if (policeFunctions.isSavingWeapon) {
			return;
		}

		const weaponName = $('.input-weapon-name').val().trim();
		const weaponSerie = $('.input-weapon-serie').val().trim();

		if (weaponName.length === 0 || weaponSerie.length === 0) {
			sendNotification('error', Translations.FillAllFields || 'Rellena todos los campos');
			return;
		}

		$('.input-weapon-name').val('');
		$('.input-weapon-serie').val('');

		policeFunctions.isSavingWeapon = true;

		TriggerCallback('origen_police:police:AddWeapon', {
			citizenid: cid,
			weaponName: weaponName,
			weaponSerie: weaponSerie
		}).done((cb) => {
			if (cb && (cb === true || cb.success)) {
				const addedBy = cb.addedBy || '';
				sendNotification('success', Translations.WeaponAdded || 'Arma añadida correctamente');
				$('.police ' + policeTabSelected + ' ul.weapons-list .no-weapons').remove();
				$('.police .citizen-ficha .weapons-list').prepend(`
					<li class="list-group-item list-group-item-action scale-in" weapon-name="${weaponName}" weapon-serie="${weaponSerie}">
						<div class="d-flex justify-content-between align-items-center">
							<div class="vehicle-title d-flex align-items-center">
								<div class="vehicle-plate">
									<p>${weaponName} <i class="fas fa-angle-right"></i> ${weaponSerie}</p>
									${addedBy ? `<small class="text-muted" style="font-size: 0.9vh; opacity: 0.7;"><i class="fas fa-user"></i> ${Translations.AddedBy || 'Añadido por'}: ${addedBy}</small>` : ''}
								</div>
							</div>
							<div class="delete-button delete-weapon">
								<i class="fa-solid fa-trash"></i>
							</div>
						</div>
					</li>
				`);
				CloseModal();
				policeFunctions.isSavingWeapon = false;
			} else {
				sendNotification('error', Translations.ErrorOccurred);
				policeFunctions.isSavingWeapon = false;
			}
		}).fail(() => {
			policeFunctions.isSavingWeapon = false;
		});
	},

	deleteWeapon: (cid, weaponName, weaponSerie, element) => {
		TriggerCallback('origen_police:police:DeleteWeapon', {
			citizenid: cid,
			weaponName: weaponName,
			weaponSerie: weaponSerie
		}).done((cb) => {
			if (cb) {
				sendNotification('success', Translations.WeaponDeleted || 'Arma eliminada correctamente');
				$(element).closest('li').addClass('scale-out').fadeOut(300, function () {
					$(this).remove();
					if ($('.police .citizen-ficha .weapons-list li').length === 0) {
						$('.police .citizen-ficha .weapons-list').append(`
							<li class="list-group-item list-group-item-action no-notes no-weapons">
								<div class="d-flex justify-content-between align-items-center">
									<h5>${Translations.NoData}</h5>
								</div>
							</li>
						`);
					}
				});
			} else {
				sendNotification('error', Translations.ErrorOccurred);
			}
		});
	},

	addInsurance: (cid) => {
		let options = `<option value="">-- ${Translations.SelectInsurance || 'Seleccionar Seguro'} --</option>`;
		availableInsurances.forEach((ins, index) => {
			options += `<option value="${index}">${ins.name}</option>`;
		});

		const canManage = !HasPermissionMenu("ManageInsuranceTypes");
		const manageButton = canManage ? `<button class="btn-modal mb-3 w-100" onclick="CloseModal(); setTimeout(() => policeFunctions.manageInsuranceTypes('${cid}'), 520)"><i class="fas fa-cog"></i> ${Translations.ManageInsurances || 'Gestionar Seguros'}</button>` : '';

		OpenModal(
			Translations.AddInsurance || 'Añadir Seguro',
			`
			<div class="row">
				${manageButton}
				<div class="col-12 mb-3">
					<label class="form-label text-uppercase fw-bold" style="font-size: 1.2vh; opacity: 0.7;">${Translations.PreconfiguredInsurances || 'Seguros Preconfigurados'}</label>
					<select class="form-control w-100 select-preconfigured-insurance" style="background: rgba(0,0,0,0.2); border: 1px solid rgba(255,255,255,0.1); color: white;">
						${options}
					</select>
				</div>
				<div class="col-12 mb-2">
					<label class="form-label">${Translations.InsuranceName || 'Nombre del Seguro'}</label>
					<input type="text" class="form-control w-100 input-insurance-name" placeholder="${Translations.InsuranceName || 'Ej: Seguro de Vida'}">
				</div>
				<div class="col-12 mb-2">
					<label class="form-label">${Translations.InsuranceType || 'Tipo de Seguro'}</label>
					<input type="text" class="form-control w-100 input-insurance-type" placeholder="${Translations.InsuranceType || 'Ej: Básico, Médico, etc.'}">
				</div>
                <div class="col-6 mb-2">
					<label class="form-label">${Translations.ExpirationDate || 'Fecha de Expiración'}</label>
					<input type="date" class="form-control w-100 input-insurance-date">
				</div>
                <div class="col-6 mb-2">
					<label class="form-label">${Translations.ExpirationTime || 'Hora de Expiración'}</label>
					<input type="time" class="form-control w-100 input-insurance-time">
				</div>
			</div>
			`,
			`<button class="btn-modal" onclick="policeFunctions.saveInsurance('${cid}')">${Translations.Save || 'Guardar'}</button>`,
			Translations.Cancel || 'Cancelar',
			50
		);
	},

	manageInsuranceTypes: (cid) => {
		let rows = '';
		availableInsurances.forEach((ins) => {
			rows += `
			<div class="col-12 mb-2">
				<div class="info-box p-2 d-flex justify-content-between align-items-center" style="background: rgba(255,255,255,0.05);">
					<div>
						<div class="fw-bold">${ins.name}</div>
						<small style="opacity: 0.7;">${ins.type} - ${ins.duration} ${Translations.days || 'días'}</small>
					</div>
					<button class="btn btn-danger btn-sm" onclick="policeFunctions.deleteInsuranceType(${ins.id}, '${cid}')">
						<i class="fas fa-trash"></i>
					</button>
				</div>
			</div>`;
		});

		if (rows === '') rows = `<div class="col-12 text-center py-3 opacity-50">${Translations.NoData || 'No hay datos'}</div>`;

		OpenModal(
			Translations.ManageInsurances || 'Gestionar Seguros',
			`
			<div class="row" style="max-height: 50vh; overflow-y: auto;">
				<div class="col-12 mb-4">
					<div class="p-3 rounded" style="background: rgba(0,0,0,0.2); border: 1px solid rgba(255,255,255,0.1);">
						<h5 class="mb-3" style="font-size: 1.4vh;">${Translations.AddInsuranceType || 'Añadir Tipo de Seguro'}</h5>
						<div class="row">
							<div class="col-12 mb-2">
								<input type="text" class="form-control w-100 input-new-ins-name" placeholder="${Translations.Name || 'Nombre'}">
							</div>
							<div class="col-6 mb-2">
								<input type="text" class="form-control w-100 input-new-ins-type" placeholder="${Translations.Type || 'Tipo'}">
							</div>
							<div class="col-6 mb-2">
								<input type="number" class="form-control w-100 input-new-ins-duration" placeholder="${Translations.InsuranceDuration || 'Duración (Días)'}">
							</div>
							<div class="col-12">
								<button class="btn-modal w-100" onclick="policeFunctions.saveNewInsuranceType('${cid}')">${Translations.Add || 'Añadir'}</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12">
					<h5 class="mb-2" style="font-size: 1.4vh;">${Translations.PreconfiguredInsurances || 'Seguros Guardados'}</h5>
					<div class="row">
						${rows}
					</div>
				</div>
			</div>
			`,
			`<div></div>`,
			Translations.Back || 'Volver',
			60
		);


		$('.btn-cancel').attr('onclick', `CloseModal(); setTimeout(() => policeFunctions.addInsurance('${cid}'), 520)`);
	},

	saveNewInsuranceType: (cid) => {
		const name = $('.input-new-ins-name').val().trim();
		const type = $('.input-new-ins-type').val().trim();
		const duration = parseInt($('.input-new-ins-duration').val());

		if (name.length === 0 || type.length === 0 || isNaN(duration)) {
			sendNotification('error', Translations.FillAllFields || 'Rellena todos los campos');
			return;
		}

		TriggerCallback('origen_police:police:AddInsuranceType', {
			label: name,
			type: type,
			duration: duration
		}).done((cb) => {
			if (cb && cb.success) {
				sendNotification('success', Translations.InsuranceTypeAdded || 'Tipo de seguro añadido');
				availableInsurances.push({
					id: cb.id,
					name: name,
					type: type,
					duration: duration
				});
				policeFunctions.manageInsuranceTypes(cid);
			} else {
				sendNotification('error', Translations.ErrorOccurred);
			}
		});
	},

	deleteInsuranceType: (id, cid) => {
		OpenModal(
			Translations.Atention || 'Atención',
			`<div class="text-center py-3">${Translations.AreYouSureDeleteInsurance || '¿Estás seguro de querer eliminar este tipo de seguro?'}</div>`,
			`<button class="btn-modal" onclick="policeFunctions.deleteInsuranceTypeConfirm(${id}, '${cid}')">${Translations.Confirm || 'Confirmar'}</button>`,
			Translations.Cancel || 'Cancelar'
		);
	},

	deleteInsuranceTypeConfirm: (id, cid) => {
		TriggerCallback('origen_police:police:DeleteInsuranceType', { id: id }).done((cb) => {
			if (cb) {
				sendNotification('success', Translations.InsuranceTypeDeleted || 'Tipo de seguro eliminado');
				availableInsurances = availableInsurances.filter(ins => ins.id !== id);
				CloseModal();
				policeFunctions.manageInsuranceTypes(cid);
			} else {
				sendNotification('error', Translations.ErrorOccurred);
			}
		});
	},

	saveInsurance: (cid) => {
		const name = $('.input-insurance-name').val().trim();
		const type = $('.input-insurance-type').val().trim();
		const date = $('.input-insurance-date').val();
		const time = $('.input-insurance-time').val();

		if (name.length === 0 || type.length === 0 || !date || !time) {
			sendNotification('error', Translations.FillAllFields || 'Rellena todos los campos');
			return;
		}

		const expireDateTime = new Date(`${date}T${time}`);
		const expireTimestamp = Math.floor(expireDateTime.getTime() / 1000);

		if (expireTimestamp <= Math.floor(Date.now() / 1000)) {
			sendNotification('error', 'La fecha de expiración debe ser futura');
			return;
		}

		TriggerCallback('origen_police:police:AddInsurance', {
			citizenid: cid,
			insuranceName: name,
			type: type,
			expire: expireTimestamp
		}).done((cb) => {
			if (cb && (cb === true || cb.success)) {
				const addedBy = cb.addedBy || '';
				sendNotification('success', Translations.InsuranceAdded || 'Seguro añadido correctamente');
				$('.police ' + policeTabSelected + ' ul.insurances-list .no-insurances').remove();

				const datetime = timeStampToDate(expireTimestamp * 1000);

				$('.police .citizen-ficha .insurances-list').prepend(`
					<li class="list-group-item list-group-item-action scale-in" insurance-id="${cb.id || ''}">
						<div class="d-flex justify-content-between align-items-center">
							<div class="vehicle-title d-flex align-items-center">
								<div class="vehicle-plate">
									<p>${name} <i class="fas fa-angle-right"></i> ${type}</p>
									<h5 class="expire">${Translations.Expiration + ': ' + datetime.date + ' - ' + datetime.time}</h5>
									${addedBy ? `<small class="text-muted" style="font-size: 0.9vh; opacity: 0.7;"><i class="fas fa-user"></i> ${Translations.AddedBy}: ${addedBy}</small>` : ''}
								</div>
							</div>
							<div class="delete-button delete-insurance">
								<i class="fa-solid fa-trash"></i>
							</div>
						</div>
					</li>
				`);
				CloseModal();


			} else {
				sendNotification('error', Translations.ErrorOccurred);
			}
		});
	},

	deleteInsurance: (id, element) => {
		OpenModal(
			Translations.Atention || 'Atención',
			`<div class="text-center py-3">${Translations.AreYouSureDeleteInsurance || '¿Estás seguro de querer eliminar este seguro?'}</div>`,
			`<button class="btn-modal" onclick="policeFunctions.deleteInsuranceConfirm(${id})">${Translations.Confirm || 'Confirmar'}</button>`,
			Translations.Cancel || 'Cancelar'
		);
	},

	deleteInsuranceConfirm: (id) => {
		TriggerCallback('origen_police:police:DeleteInsurance', {
			id: id
		}).done((cb) => {
			if (cb) {
				sendNotification('success', Translations.InsuranceDeleted || 'Seguro eliminado correctamente');
				const $el = $(`.insurances-list li[insurance-id="${id}"]`);
				$el.addClass('scale-out').fadeOut(300, function () {
					$(this).remove();
					if ($('.police .citizen-ficha .insurances-list li').length === 0) {
						$('.police .citizen-ficha .insurances-list').append(`
							<li class="list-group-item list-group-item-action no-notes no-insurances">
								<div class="text-center py-3 opacity-50">
									${Translations.NoInsurances || 'SIN SEGUROS ACTIVOS'}
								</div>
							</li>
						`);
					}
				});
				CloseModal();
			} else {
				sendNotification('error', Translations.ErrorOccurred);
			}
		});
	},
};

$(document).on('input', '.buscar-deudor', function () {
	const value = $(this).val();
	$('.c-modal .col-4 .citizen-name').each(function () {
		if ($(this).text().indexOf(value) === -1) {
			$(this).parent().parent().parent().fadeOut(300);
		} else {
			$(this).parent().parent().parent().fadeIn(300);
		}
	});
});

function AnkleTase(targetId) {
	fetch('AnckleShock', { id: targetId }).done((cb) => { });
}