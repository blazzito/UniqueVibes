const s_click = new Audio('./sounds/click.mp3');
const s_hover = new Audio('./sounds/hover.wav');
const s_open = new Audio('./sounds/transition.ogg');

s_click.volume = 0.2;
s_hover.volume = 0.2;
s_open.volume = 0.1;

$(document).keydown(function (e) {
	if (e.key === 'Escape') {
		$('.bg').removeClass('open');
		$('.footer-home').css('opacity', 0);
		
		fetch('closeMenu');
		s_open.currentTime = '0';
		s_open.play();
	}
});

$.post('https://origen_pausemenu/PlayerId', JSON.stringify({}), function (data) { //id del jugador
	$('#player-id').text(data);
});

function numberWithCommas(x) {
	var parts = x.toString().split('.');
	parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, '.');
	return parts.join(',');
}

$('document').ready(function () {
	$('.footer-home').css('opacity', 0);
	window.addEventListener('message', function (event) {
		switch (event.data.action) {
			case 'updatejobs':
				$('.police .d-data').text(
					event.data.police 
				);
				$('.ems .d-data').text(
					event.data.ems 
				);
				break;
			case 'UpdateNegocios':
				loadNegocios();
				break;
			case 'OpenMenu':
				$('.bg').addClass('open');
				$('#name').text(event.data.name);
				$('#job-name').text(event.data.job);

				$('#text-cash').text(numberWithCommas(event.data.cash) + '$');
				$('#text-bank').text(numberWithCommas(event.data.bank) + '$');

				if (event.data.mugshot) {
					$('.header-avatar').css('background-image', 'url(https://nui-img/' + event.data.mugshot + '/' + event.data.mugshot + ')');
				} else {
					$('.header-avatar').css('background-image', 'url(https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg)');
				}

				if (event.data.discord) {
					$('.discord').attr('url', event.data.discord);
				}

				if (event.data.instagram) {
					$('.instagram').attr('url', event.data.instagram);
				} else {
					$('.instagram').hide();
				}

				if (event.data.twitter) {
					$('.twitter').attr('url', event.data.twitter);
				} else {
					$('.twitter').hide();
				}

				if (event.data.youtube) {
					$('.youtube').attr('url', event.data.youtube);
				} else {
					$('.youtube').hide();
				}

				if (event.data.discord) {
					const regex = /^(?:https?:\/\/)?(?:www\.)?([^\/]+)/i;
					const domain = event.data.discord.match(regex)[1];
					const formattedWebsite = domain.startsWith('www.')
						? domain.slice(4)
						: domain;
					// Use formattedWebsite as needed

					$('.web').attr('url', event.data.discord).text(formattedWebsite);
				} else {
					$('.web').hide();
				}

				$('.players .d-data').text(
					event.data.usersOnline + '/' + event.data.maxPlayers
				);
				$('.police .d-data').text(
					event.data.police 
				);
				$('.ems .d-data').text(
					event.data.ems 
				);

				// Load panels by default
				$.post('https://origen_pausemenu/facturas', JSON.stringify({}), function(results) {
					if (results && results.length > 0) {
						$('.lista-facturas').html('');
						results.map((bill) => {
							$('.lista-facturas').append(`
							<div class="factura">
							<img src="https://cdn.discordapp.com/attachments/1172320936486248459/1196954004270354573/bill.png" class="img-fluid">
							 <div class="info-factura">
									<h4>${bill.title}</h4>
								</div>
								<div class="precio-factura text-center">
									<h4 class="text-success">${bill.price}$</h4>
								</div>
								<button class="btn btn-action p-1 pagar-factura" price="${bill.price}" job="${bill.job}" billid="${bill.billId}">PAGAR</button>
							</div>
							`);
						});
					} else {
						$('.lista-facturas').html(
							`<div class="w-100 p-1 text-muted text-center">NO HAY FACTURAS PENDIENTES</div>`
						);
					}
				});
				// STATS CARDS
				$('#players-online').text(event.data.usersOnline);
				$('#admins-online').text(event.data.admins || 0);

				// Police Logic
				const police = event.data.police || 0;
				const $polStat = $('#police-status');
				const $polCard = $('#stat-police');
				$polStat.removeClass('available unavailable offline');
				$polCard.removeClass('glow-blue glow-red');
				if (police === 0) {
					$polStat.text('NO DISPONIBLES').addClass('offline');
				} else if (police > 0 && police < 3) {
					$polStat.text('NO DISPONIBLE').addClass('unavailable');
					$polCard.addClass('glow-red');
				} else {
					$polStat.text('DISPONIBLE').addClass('available');
					$polCard.addClass('glow-blue');
				}

				// EMS Logic
				const ems = event.data.ems || 0;
				const $emsStat = $('#ems-status');
				const $emsCard = $('#stat-ems');
				$emsStat.removeClass('available unavailable offline');
				$emsCard.removeClass('glow-blue glow-red');
				if (ems === 0) {
					$emsStat.text('NO DISPONIBLES').addClass('offline');
				} else {
					$emsStat.text('DISPONIBLE').addClass('available');
					$emsCard.addClass('glow-blue');
				}
				// RENDER REWARDS TRACK
				const streak = event.data.streak || 0;
				const maxStreak = event.data.maxStreak || 30;
				const rewards = event.data.rewards || {};
				
				$('#current-streak').text(streak);

				const track = $('#rewards-track');
				track.empty();

				for(let i = 1; i <= maxStreak; i++) {
					let reward = rewards[i];
					let nodeClass = "locked";
					if (i < streak) {
						nodeClass = "completed";
					} else if (i === streak) {
						nodeClass = "current";
					}

					let milestoneClass = "";
					let icon = "lni-calendar";
					let tooltip = "";

					if (reward) {
						icon = reward.icon || "lni-gift";
						if (reward.milestone) {
							milestoneClass = "milestone";
						}
						tooltip = `<div class="reward-tooltip">Recompensa: ${reward.label}</div>`;
					}

					track.append(`
						<div class="reward-node ${nodeClass} ${milestoneClass}">
							<div class="reward-label">${reward ? reward.label : ''}</div>
							<i class="lni ${icon}"></i>
							<div class="day-label">DÍA ${i}</div>
							${tooltip}
						</div>
					`);
				}

				// Center scroll slightly on current node (after DOM update)
				setTimeout(() => {
					let progressWidth = ((streak - 1) / (maxStreak - 1)) * 100;
					if(progressWidth < 0) progressWidth = 0;
					$('.rewards-progress-bar').css('width', progressWidth + '%');
					
					let currentElement = $('.reward-node.current');
					if(currentElement.length > 0) {
						let container = $('#rewards-scroll-container');
						let scrollLeft = currentElement.position().left - (container.width() / 2) + (currentElement.width() / 2);
						container.animate({scrollLeft: scrollLeft}, 500);
					}
				}, 100);

				s_open.currentTime = '0';
				s_open.play();
				break;
		}
	});
});

$(document).on('mouseenter', '.btn-sound', function () {
	s_hover.currentTime = '0';
	s_hover.play();
});

$(document).on('click', '.btn-sound', function () {
	s_click.currentTime = '0';
	s_click.play();
});

$(document).on('click', '#rewards-prev', function() {
	const container = $('#rewards-scroll-container');
	container.animate({scrollLeft: container.scrollLeft() - 300}, 300);
});

$(document).on('click', '#rewards-next', function() {
	const container = $('#rewards-scroll-container');
	container.animate({scrollLeft: container.scrollLeft() + 300}, 300);
});

$(document).on('click', '.btn-menu, .sidebar-item', function () {
	const action = $(this).attr('action');
	switch (action) {
		case 'map':
			fetch('openMap');
			$('.bg').removeClass('open');
			fetch('closeMenu');

			break;

		case 'settings':
			fetch('openSettings');
			$('.bg').removeClass('open');
			fetch('closeMenu');

			break;

		case 'logout':
			fetch('logout');
			$('.bg').removeClass('open');
			fetch('closeMenu');
			break;

		case 'quit':
			OpenModal();
			break;
	}
});

$(document).on('click', '.pagar-factura', function () {
	const billid = $(this).attr('billid');
	const yo = $(this);
	const job = $(this).attr('jbo');
	const price = $(this).attr('price');
	s_click.currentTime = '0';
	s_click.play();
	$.post('https://origen_pausemenu/paybill', JSON.stringify({
		id: parseInt(billid),
		job : job,
		price : parseInt(price)
	}), function(results) {
	
			if (results == true) {
				yo.parent().addClass(
					'animate__animated animate__fadeOutLeft animate__faster'
				);
				setTimeout(() => {
					yo.parent().remove();
				}, 500);
			} 
		
	});

});

$(document).on('click', '.facturas', function () {


});

function OpenModal() {
	$('body').append(`
    <div class="c-modal fadeIn">
       <div class="modal-block">
            <div class="modal-content scale-in-2" style="width: max-content">

                <div class="modal-body">
					Estas seguro de querer salirte del servidor?
                </div>
                <div class="modal-footer">
                    <button class="btn-modal btn-sound" onclick='quitGame()'>
						SI</button>
                    <button class="btn-cancel btn-sound" onclick='CloseModal()'>No</button>
                </div>
            </div>
        </div>
    </div>
    `);
}

function quitGame() {
	fetch('exitGame');
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

$(document).on('click', '.link', function () {
	const url = $(this).attr('url');
	if (url) {
		window.invokeNative('openUrl', url);
	}
});


$(document).on('click', '.set-waypoint', function () {
	const e = $(this).parent();
	const x = parseFloat(e.attr('x'));
	const y = parseFloat(e.attr('y'));
	fetch('SetWaypointinCoords', { x, y });
});


function fetch(event, data) {
	return $.post(
		'https://origen_pausemenu/' + event || {},
		JSON.stringify(data)
	).promise();
}

function loadNegocios() {
	$.post('https://origen_pausemenu/negocios', JSON.stringify({}), function(results) {
		if (results && results.length > 0) {
			$('.lista-comercios').html('');
			let hasOpen = false;
			results.map((negocio) => {
				if(negocio.open){
					hasOpen = true;
					$('.lista-comercios').append(`
					<div class="factura animate__animated animate__fadeInUp anim_titulo animate__faster" x="${negocio.coords.x}" y="${negocio.coords.y}"  style="animation-delay:0.2s">
					<img src="https://i.imgur.com/gLJFRFX.png" class="img-fluid">
						<div class="info-factura">
							<h3 class="bankgothic">${negocio.label}</h3>
						</div>
						<button class="btn btn-action set-waypoint p-1"><i class="lni lni-map-marker"></i></button>
					</div>
					`);
				}
			});
			if (!hasOpen) {
				$('.lista-comercios').html(
					`<div class="w-100 p-1 text-muted text-center">NO HAY NEGOCIOS DISPONIBLES</div>`
				);
			}
		} else {
			$('.lista-comercios').html(
				`<div class="w-100 p-1 text-muted text-center">NO HAY NEGOCIOS DISPONIBLES</div>`
			);
		}
	});
}
