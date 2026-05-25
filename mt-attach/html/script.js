const sHover = document.getElementById('s-hover');
const sClick = document.getElementById('s-click');
const sOpen = document.getElementById('s-open');
const sOk = document.getElementById('s-ok');
const play = a => {
  if (!a) return;
  try {
    a.currentTime = 0;
    const p = a.play();
    if (p && p.catch) p.catch(() => { });
  } catch (e) { }
};

const ui = document.getElementById('ui-root');
const carousel = document.getElementById('carousel');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');
const btnClose = document.getElementById('btn-close');

const mdlDetails = document.getElementById('modal-details');
const mdlOk = document.getElementById('modal-ok');
const mdTitle = document.getElementById('md-title');
const mdSubtitle = document.getElementById('md-subtitle');
const mdPrice = document.getElementById('md-price');
const mdCap = document.getElementById('md-capacity');
const mdSize = document.getElementById('md-size');
const mdConfirm = document.getElementById('md-confirm');
const mdBack = document.getElementById('md-back');

let currentItem = null;
let catalog = [];
let processing = false;

const RES = (typeof GetParentResourceName === 'function')
  ? GetParentResourceName()
  : 'mt_trailer_qb_ox_target';

function toast(msg, type = 'error') {
  const host = document.createElement('div');
  host.style.position = 'fixed';
  host.style.inset = '20px 0 auto 0';
  host.style.display = 'grid';
  host.style.placeItems = 'center';
  host.style.pointerEvents = 'none';
  host.style.zIndex = '9999';

  const box = document.createElement('div');
  box.textContent = msg.toUpperCase();
  box.style.pointerEvents = 'auto';
  box.style.padding = '15px 30px';
  box.style.border = '4px solid #000';
  box.style.fontFamily = "'Bebas Neue', sans-serif";
  box.style.fontSize = '24px';
  box.style.letterSpacing = '1px';
  box.style.boxShadow = '6px 6px 0 #000';
  box.style.transition = 'transform .2s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity .2s ease';
  box.style.transform = 'translateY(-20px) rotate(-2deg)';
  box.style.opacity = '0';

  if (type === 'success') {
    box.style.background = '#fff200';
    box.style.color = '#000';
  } else {
    box.style.background = '#ff0055';
    box.style.color = '#fff';
    box.style.textShadow = '2px 2px 0 #000';
  }

  host.appendChild(box);
  document.body.appendChild(host);
  requestAnimationFrame(() => {
    box.style.transform = 'translateY(0) rotate(2deg)';
    box.style.opacity = '1';
  });
  setTimeout(() => {
    box.style.transform = 'translateY(-20px) rotate(-2deg)'; box.style.opacity = '0';
    setTimeout(() => host.remove(), 220);
  }, 3000);
}

function openModal(node) { node.classList.remove('hidden'); document.body.classList.add('modal-open'); }
function closeModal(node) { node.classList.add('hidden'); document.body.classList.remove('modal-open'); }

document.querySelectorAll('[data-close]').forEach(b => {
  b.addEventListener('click', () => {
    play(sClick);
    const modal = b.closest('.modal');
    closeModal(modal);
    if (modal.id === 'modal-ok') sendClose();
  });
});
document.querySelectorAll('.modal').forEach(m => {
  m.addEventListener('click', e => {
    if (e.target.classList.contains('modal')) { play(sClick); closeModal(m); }
  });
});

function createCard(item) {
  const card = document.createElement('article');
  card.className = 'card';
  const isIcon = item.image && item.image.startsWith('fa-');

  card.innerHTML = `
    <div class="media">
      ${isIcon ? `<div class="icon-wrap"><i class="${item.image}"></i></div>` : `<div class="img" style="background-image:url('${item.image ?? 'https://picsum.photos/800/600?blur=1'}')"></div>`}
      <div class="price">$${item.price}<span>/DÍA</span></div>
    </div>

    <h3>${item.label}</h3>
    <p>${item.description ?? 'Remolque robusto para múltiples usos.'}</p>

    <div class="meta">
      <div class="row"><span class="material-symbols-outlined">scale</span>CAPACIDAD: ${item.capacity ?? '—'}</div>
      <div class="row"><span class="material-symbols-outlined">straighten</span>MEDIDAS: ${item.size ?? '—'}</div>
    </div>

    <button class="btn-rent">RENTAR AHORA</button>
  `;
  card.addEventListener('mouseenter', () => play(sHover));
  card.querySelector('.btn-rent').addEventListener('click', () => {
    play(sClick);
    currentItem = item;
    mdTitle.textContent = item.label;
    mdSubtitle.textContent = (item.subtitle ?? item.model?.toUpperCase() ?? 'ESPECIFICACIONES').toUpperCase();
    mdPrice.textContent = `$${item.price}`;
    mdCap.textContent = item.capacity ?? '—';
    mdSize.textContent = item.size ?? '—';

    // Activar modo previsualización
    ui.classList.add('preview-mode');
    mdlDetails.classList.add('preview-state'); // Para fondo transparente
    openModal(mdlDetails);

    fetch(`https://${RES}/uiPreview`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ model: item.model })
    }).catch(() => { });
  });
  return card;
}

function renderCatalog(list) {
  carousel.innerHTML = '';
  list.forEach(i => carousel.appendChild(createCard(i)));
}

function step() { const it = carousel.querySelector('.card'); return it ? it.offsetWidth + 24 : 320; }
nextBtn.addEventListener('click', () => { carousel.scrollBy({ left: step(), behavior: 'smooth' }); play(sClick); });
prevBtn.addEventListener('click', () => { carousel.scrollBy({ left: -step(), behavior: 'smooth' }); play(sClick); });

mdBack.addEventListener('click', () => {
  play(sClick);
  ui.classList.remove('preview-mode');
  mdlDetails.classList.remove('preview-state');
  closeModal(mdlDetails);
  fetch(`https://${RES}/uiCancelPreview`, { method: 'POST', body: '{}' }).catch(() => { });
});

document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape' || e.key === 'Backspace') {
    if (!mdlOk.classList.contains('hidden')) {
      closeModal(mdlOk);
      sendClose();
      return;
    }
    if (!mdlDetails.classList.contains('hidden')) {
      // If in preview, go back to main menu instead of closing all
      mdBack.click();
      return;
    }
    sendClose();
  }
});

mdConfirm.addEventListener('click', async () => {
  if (!currentItem || processing) return;
  processing = true;
  play(sClick);

  const btnText = mdConfirm.textContent;
  mdConfirm.textContent = 'Procesando...';
  mdConfirm.disabled = true;

  const pay = (document.querySelector('input[name="pay"]:checked')?.value) || 'card';

  try {
    const controller = new AbortController();
    const subId = setTimeout(() => controller.abort(), 10000); // 10s timeout

    const res = await fetch(`https://${RES}/uiRent`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify({ model: currentItem.model, price: currentItem.price, pay }),
      signal: controller.signal
    });

    clearTimeout(subId);
    let data = {};
    try { data = await res.json(); } catch { }

    if (res.ok && data && data.ok) {
      ui.classList.remove('preview-mode');
      closeModal(mdlDetails);
      openModal(mdlOk);
      play(sOk);
    } else {
      toast(data && data.reason ? data.reason : 'No se pudo completar el pago.', 'error');
    }
  } catch (err) {
    toast('Error de comunicación con el juego.', 'error');
  } finally {
    processing = false;
    mdConfirm.textContent = btnText;
    mdConfirm.disabled = false;
  }
});

function sendClose() {
  ui.classList.add('hidden');
  ui.classList.remove('preview-mode');
  document.querySelectorAll('.modal').forEach(m => closeModal(m));
  fetch(`https://${RES}/uiClose`, { method: 'POST', body: '{}' }).catch(() => { });
}

window.addEventListener('message', (e) => {
  const d = e.data; if (!d) return;
  switch (d.action) {
    case 'openShop': {
      catalog = Array.isArray(d.items) ? d.items : [];
      renderCatalog(catalog);
      ui.classList.remove('hidden');
      play(sOpen);
      break;
    }
    case 'closeShop': {
      sendClose();
      break;
    }
    case 'paymentResult': {
      if (d.ok) {
        if (!mdlDetails.classList.contains('hidden')) closeModal(mdlDetails);
        openModal(mdlOk); play(sOk);
      } else {
        toast(d.reason || 'No se pudo completar el pago.', 'error');
      }
      break;
    }
  }
});

