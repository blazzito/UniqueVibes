camerasFunctions = {
	cameraEvents: () => {
		$(document).on('click', '.cameras .refresh-cameras, .police .refresh-cameras-button', function () {
			const yo = $(this);
			yo.attr('disabled', true);
			camerasFunctions.loadCameras();
			setTimeout(() => {
				yo.attr('disabled', false);
			}, 2000);
		});

		// Botón de refresco de cámaras instaladas CCTV
		$(document).on('click', '.cameras .refresh-installed-cams', function () {
			camerasFunctions.loadInstalledCameras();
		});

		// Ver cámara instalada CCTV
		$(document).on('click', '.cameras .installed-cctv .camera', function () {
			const camId = $(this).attr('data-cam-id');
			if (!camId) return;
			camerasFunctions.showInstalledCam(camId, $(this).attr('data-cam-label') || "Cámara #" + camId);
		});

		// Renombrar cámara instalada CCTV
		$(document).on('click', '.cameras .installed-cctv .camera .cam-rename-btn', function (e) {
			e.stopPropagation();
			const camId = $(this).closest('.camera').attr('data-cam-id');
			const camLabel = $(this).closest('.camera').attr('data-cam-label');
			if (!camId) return;

			let title = "Renombrar Cámara";
			let content = `
				<div class="input-group">
					<input type="text" class="w-100 rename-cctv-input" value="${camLabel}" placeholder="Nombre descriptivo...">
				</div>
			`;
			let footerButtons = `<button class="btn-submit" onclick="camerasFunctions.renameInstalledCam(${camId})">Guardar</button>`;
			let closeText = "Cancelar";

			OpenModal(title, content, footerButtons, closeText, 40);
		});

	},

	renameInstalledCam: (camId) => {
		const newName = $('.rename-cctv-input').val();
		if (newName && newName.trim() !== '') {
			exportEvent('origen_police', 'RenameInstalledCCTVCam', { id: camId, name: newName.trim() });
			CloseModal();
		} else {
			sendNotification('error', 'El nombre no puede estar vacío');
		}
	},

	loadCameras: () => {
		$('.police .cameras .camera-list').html('');
		TriggerCallback('origen_police:server:GetBodyCams', {}).done((cb) => {
			if (cb && cb.length > 0) {
				cb.map((camera) => {
					$('.police .cameras .camera-list.bodycam').append(`
                    <div class="camera scale-in" id="pl-${camera.source}" onclick="camerasFunctions.showCam('body', ${camera.source
						}, '${camera.name}', '${camera.badge} - ${camera.grade}')">
                        <img src="${camera.image || './img/default.jpg'}" class="rounded" style="filter:hue-rotate(-${currentHueDeg}deg);">
                        <div class="camera-info">
                            <div class="camera-title">${camera.name}</div>
                            <div class="camera-owner">${camera.badge} - ${camera.grade
						}</div>
                        </div>
                    </div>
                    `);

					setTimeout(() => {
						try {
							var imageElement = $('.police .cameras .camera-list.bodycam #pl-' + camera.source.toString() + ' img');
							var imgUrl = imageElement.attr("src");
							var url = imgUrl.replace('https://', 'https://').split('?')[0];

							var img = new Image();
							img.src = url;
							img.onerror = function () {
								imageElement.attr('src', defaultImage);
							}
						}
						catch (e) { }
					}, 200);
				});
			}
		});

		TriggerCallback('origen_police:server:GetVehiclesTracked', {}).done((cb) => {
			if (cb && Object.keys(cb).length > 0) {
				Object.entries(cb).map(([key, camera]) => {
					$('.police .cameras .camera-list.vehicles').append(`
                    <div class="camera scale-in" onclick="camerasFunctions.showCam('vehicle', ${key}, '${camera.model}', '${camera.plate}')">
                        <img src="./img/icons/8aWTt9A.png">
                        <div class="camera-info">
                            <div class="camera-title">${camera.model}</div>
                            <div class="camera-owner">${camera.plate}</div>
                        </div>
                    </div>
                    `);
				});
			}
		});
		exportEvent('origen_police', 'GetCamsInArea', {}).done((cb) => {
			if (cb && cb.length > 0) {
				cb.map((camera, i) => {
					$('.police .cameras .camera-list.business').append(`
                    <div class="camera scale-in" onclick="camerasFunctions.showCam('business', ${camera.obj
						}, '${Translations.SingleCamera} ${i + 1}', 'A ${camera.dist.toFixed(2)} ${Translations.Meters}')">
                        <img src="./img/icons/46IfeYQ.png">
                        <div class="camera-info">
                            <div class="camera-title">${Translations.SingleCamera} ${i + 1}</div>
                            <div class="camera-owner"><i class="fas fa-map-marker-alt"></i> A ${camera.dist.toFixed(
							2
						)} ${Translations.Meters}</div>
                        </div>
                    </div>
                    `);
				});
			}
		});

		// También cargar cámaras instaladas CCTV
		camerasFunctions.loadInstalledCameras();
	},

	// ============================================================
	// CÁMARAS CCTV INSTALADAS
	// ============================================================
	loadInstalledCameras: () => {
		const $list = $('.police .cameras .camera-list.installed-cctv');
		$list.html(`<div class="text-muted text-center" style="font-size:1.1vh;padding:1vh;"><i class="fas fa-spinner fa-spin"></i></div>`);

		exportEvent('origen_police', 'GetInstalledCCTVCams', {}).done((cb) => {
			$list.html('');

			if (!cb || cb.length === 0) {
				$list.html(`<div class="text-muted text-center" style="font-size:1.1vh;padding:2vh;" translate="NoCCTVInstalled">${Translations.NoCCTVInstalled || 'No hay cámaras instaladas'}</div>`);
				return;
			}

			cb.forEach((cam, i) => {
				$list.append(`
					<div class="camera scale-in cctv-installed-cam" data-cam-id="${cam.id}" data-cam-label="${cam.label || 'Cámara #' + cam.id}" style="cursor:pointer;">
						<img src="./img/icons/46IfeYQ.png" style="filter: hue-rotate(120deg);">
						<div class="camera-info" style="flex:1;">
							<div class="camera-title"><i class="fas fa-video"></i> ${cam.label || 'Cámara #' + cam.id}</div>
							<div class="camera-owner"><i class="fas fa-user"></i> ${cam.placerName || 'Desconocido'}</div>
						</div>
						<div class="cam-rename-btn" title="Renombrar cámara" style="padding:0.5vh; color:#3498db; cursor:pointer; font-size:1.3vh; margin-right:0.5vh;">
							<i class="fas fa-pen"></i>
						</div>
					</div>
				`);
			});
		});
	},

	showInstalledCam: (camId, name) => {
		if (HasPermissionMenu('SeeBusinessCameras')) return sendNotification('error', Translations.NoPermissionPage);
		exportEvent('origen_police', 'ShowInstalledCCTVCam', { id: camId }).done(() => {
			$('.cam-overlay .name').text(name);
			$('.cam-overlay .other').text('CCTV Instalada');
			setTimeout(() => {
				$.post('https://origen_police/close', JSON.stringify({}));
				$('.screen').removeClass('show');
				$('.cam-overlay').fadeIn(300);
			}, 1000);
		});
	},

	removeInstalledCam: (camId) => {
		exportEvent('origen_police', 'RemoveInstalledCCTVCam', { id: camId }).done(() => {
			// La lista se actualizará por el evento RefreshInstalledCams
		});
	},

	showCam: (type, source, name, grade) => {
		if (type == 'body') {
			if (HasPermissionMenu('SeeBodyCams')) return sendNotification('error', Translations.NoPermissionPage);
			lastBodyCamData = {
				name: name,
				grade: grade
			};
			fetch('ShowBodycam', { id: source });
		}
		if (type == 'vehicle') {
			if (HasPermissionMenu('SeeVehicleCamera')) return sendNotification('error', Translations.NoPermissionPage);
			fetch('ShowCarcam', { netid: source });
		}
		if (type == 'business') {
			if (HasPermissionMenu('SeeBusinessCameras')) return sendNotification('error', Translations.NoPermissionPage);
			exportEvent('origen_police', 'ShowCam', { obj: source });
		}
		if (type == 'body') return;

		$('.cam-overlay .name').text(name);
		$('.cam-overlay .other').text(grade);
		setTimeout(() => {
			$.post('https://origen_police/close', JSON.stringify({}));
			$('.screen').removeClass('show');
			$('.cam-overlay').fadeIn(300);
		}, 1000);
	}
};

// Escuchar mensaje NUI para refrescar la lista de cámaras instaladas en tiempo real
window.addEventListener('message', function (e) {
	if (e.data && e.data.action === 'RefreshInstalledCams') {
		if ($('.police .cameras .camera-list.installed-cctv').length > 0 && $('.police .cameras').is(':visible')) {
			camerasFunctions.loadInstalledCameras();
		}
	}
});
