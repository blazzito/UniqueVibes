window.addEventListener('error', function(e) {
    fetch('https://lls_mechanic/nuiError', {
        method: 'POST',
        body: JSON.stringify({ message: e.message, filename: e.filename, lineno: e.lineno, colno: e.colno, error: e.error ? e.error.stack : '' })
    });
});
'use strict';

// 
// PALETA FIJA DE COLORES GTA (nacarado / llantas / tablero / interior)
// Estos slots NO aceptan RGB libre, solo un indice de la lista interna
// del juego (0-159). Los RGB de abajo son solo una aproximacion visual
// para que el picker se vea bien; el indice es lo que realmente importa.
// 
const PALETTE_COLORS = [
    [13,17,22], [28,29,33], [50,56,61], [69,75,79], [153,157,160], [194,196,198], [151,154,151], [99,115,128],
    [99,98,92], [60,63,71], [68,78,84], [29,33,41], [19,24,31], [38,40,42], [81,85,84], [21,25,33],
    [30,36,41], [51,58,60], [140,144,149], [57,67,77], [80,98,114], [30,35,47], [54,58,63], [160,161,153],
    [211,211,211], [183,191,202], [119,135,148], [192,14,26], [218,25,24], [182,17,27], [165,30,35], [123,26,34],
    [142,27,31], [111,24,24], [73,17,29], [182,15,37], [212,74,23], [194,148,79], [247,134,22], [207,31,33],
    [115,32,33], [242,125,32], [255,201,31], [156,16,22], [222,15,24], [143,30,23], [169,71,68], [177,108,81],
    [55,28,37], [19,36,40], [18,46,43], [18,56,60], [49,66,63], [21,92,45], [27,103,112], [102,184,31],
    [34,56,62], [29,90,63], [45,66,63], [69,89,75], [101,134,127], [34,46,70], [35,49,85], [48,76,126],
    [71,87,143], [99,123,167], [57,71,98], [214,231,241], [118,175,190], [52,94,114], [11,156,241], [47,45,82],
    [40,44,77], [35,84,161], [110,163,198], [17,37,82], [27,32,62], [39,81,144], [96,133,146], [36,70,168],
    [66,113,225], [59,57,224], [31,40,82], [37,58,167], [28,53,81], [76,95,129], [88,104,142], [116,181,216],
    [255,207,32], [251,226,18], [145,101,50], [224,225,61], [152,210,35], [155,140,120], [80,50,24], [71,63,43],
    [34,27,25], [101,63,35], [119,92,62], [172,153,117], [108,107,75], [64,46,43], [164,150,95], [70,35,26],
    [117,43,25], [191,174,123], [223,213,178], [247,237,213], [58,42,27], [120,95,51], [181,160,121], [255,255,246],
    [234,234,234], [176,171,148], [69,56,49], [42,40,43], [114,108,87], [106,116,124], [53,65,88], [155,160,168],
    [88,112,161], [234,230,222], [223,221,208], [242,173,46], [249,164,88], [131,197,102], [241,204,64], [76,195,218],
    [78,100,67], [188,172,143], [248,182,88], [252,249,241], [255,255,251], [129,132,76], [255,255,255], [242,31,153],
    [253,214,205], [223,88,145], [246,174,32], [176,238,110], [8,233,250], [10,12,23], [12,13,24], [14,13,20],
    [159,158,138], [98,18,118], [11,20,33], [17,20,26], [107,31,123], [30,29,34], [188,25,23], [45,54,42],
    [105,103,72], [122,108,85], [195,180,146], [90,99,82], [129,130,127], [175,214,228], [122,100,64], [127,106,72]
];

// 
// ESTADO  MENU
// 
let menuId        = null;
let menuTitle     = '';
let options       = [];
let defaultOpt    = 0;
let isVisible     = false;
let selectedIndex = 0;
let menuHistory   = {};

// 
// ESTADO  FREECAM
// 
let freecamOn        = false;
let freecamLastMove  = 0;

// 
// ESTADO  COLOR PICKER
// 
let cpModType     = null;
let cpPendingType = null;
let cpTitle       = '';
let cpPriceMult   = 1;
let cpPrice       = 0;
let cpOriginalRGB = null;
let cpH = 0; let cpS = 100; let cpV = 100;
let cpDragging    = null;
let cpLastSend    = 0;

// Modo paleta (no-custom): nacarado, llantas, tablero, interior
let cpIsCustom      = true;
let cpPaletteIndex  = 0;
let cpOriginalIndex = 0;

// 
// ESTADO  RESUMEN DE SESIN
// 
let sessionMods  = [];
let sessionTotal = 0;

// 
// NUI
// 
function nuiPost(endpoint, data) {
    fetch(`https://${GetParentResourceName()}/${endpoint}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data || {})
    }).catch(() => {});
}
function sendHandle(payload) { nuiPost('handle', payload); }

// 
// CARRUSEL  POSICIONES Y TRANSFORMACIONES
// 

// Offsets X (centro a centro)  ajustado al ancho del HUD (840px) y tarjetas de 178px
const CARD_OFFSETS   = [0, 188, 450];   // 2 queda fuera del clip (efecto depth)
const CARD_SCALES    = [1.0, 0.78, 0.60];
const CARD_OPACITIES = [1, 0.65, 0];    // 2 invisible, solo para la transicion

function getCardTransform(dist) {
    const abs = Math.abs(dist);
    if (abs > 2) return null; // ocultar
    const sign   = dist === 0 ? 0 : dist / abs;
    const offsetX = CARD_OFFSETS[abs] * sign;
    const scale   = CARD_SCALES[abs];
    const opacity = CARD_OPACITIES[abs];
    return { offsetX, scale, opacity };
}

function applyCardTransforms() {
    const cards = document.querySelectorAll('.card');
    cards.forEach((card, idx) => {
        const dist = idx - selectedIndex;
        const t = getCardTransform(dist);

        if (!t) {
            card.style.opacity = '0';
            card.style.pointerEvents = 'none';
            // Moverlos fuera de vista sin animacion brusca
            const side = dist > 0 ? 1 : -1;
            card.style.transform =
                `translate(calc(-50% + ${side * 620}px), -50%) scale(0.5)`;
            card.style.zIndex = '0';
            return;
        }

        card.style.pointerEvents = 'auto';
        card.style.opacity  = t.opacity.toString();
        card.style.zIndex   = (10 - Math.abs(dist)).toString();
        card.style.transform =
            `translate(calc(-50% + ${t.offsetX}px), -50%) scale(${t.scale})`;

        // Solo el centro y adyacentes son interactivos
        card.classList.toggle('adj', Math.abs(dist) === 1);
        card.style.pointerEvents = Math.abs(dist) <= 1 ? 'auto' : 'none';
    });
}

// 
// CARRUSEL  RENDER
// 
function renderCarousel() {
    const carousel = document.getElementById('carousel');
    carousel.innerHTML = '';

    const titleEl = document.getElementById('menu-title');
    titleEl.textContent = menuTitle || 'MENU';

    const isModSub = menuId && menuId.startsWith('mod_');
    const total    = options.length;

    options.forEach((opt, idx) => {
        if (!opt) return;
        const isCurrent = (opt.price === -1);
        let label = opt.label || '';

        if (isModSub) {
            if (label === 'Default') {
                label = menuTitle + ' Stock';
            } else {
                label = String(label).replace(
                    /^Level\s+(\d+)$/i,
                    (_, n) => `${menuTitle} Nivel ${n}`
                );
            }
        }

        const card = document.createElement('div');
        card.className = 'card' + (isCurrent ? ' is-current' : '');
        card.dataset.idx = idx;

        // Imagen
        const imgHtml = opt.img
            ? `<div class="card-img-wrap">
                   <img class="card-img" src="${opt.img}" alt="">
               </div>`
            : `<div class="card-img-wrap"></div>`;

        // Subtitle
        let subtitle = '';
        let subtitleClass = 'card-subtitle';
        if (isCurrent) {
            subtitle = 'v ACTIVO';
            subtitleClass = 'card-subtitle is-active';
        } else if (opt.price != null && opt.price > 0) {
            subtitle = '$' + Math.floor(opt.price).toLocaleString('es-MX');
        }

        // Dots de nivel para submenus de mods
        let dotsHtml = '';
        if (isModSub && String(opt.label) !== 'Default') {
            const match = String(opt.label).match(/^Level\s+(\d+)$/i);
            if (match) {
                const lvl = parseInt(match[1]);
                const max = Math.min(total - 1, 8);
                let dots = '';
                for (let d = 1; d <= max; d++) {
                    dots += `<span class="lvl-dot${d <= lvl ? ' on' : ''}"></span>`;
                }
                dotsHtml = `<div class="card-levels">${dots}</div>`;
            }
        }

        // Boton inferior
        let btnHtml = '';
        if (isCurrent) {
            btnHtml = `<div class="card-btn card-btn-current">v SELECCIONADO</div>`;
        } else {
            btnHtml = `<div class="card-btn">Abrir <span class="card-btn-accent">Seleccion</span> ></div>`;
        }

        card.innerHTML = `
            ${imgHtml}
            <div class="card-info">
                <div class="card-title">${label}</div>
                ${subtitle ? `<div class="${subtitleClass}">${subtitle}</div>` : ''}
            </div>
            ${dotsHtml}
            ${btnHtml}
        `;

        card.addEventListener('click', () => {
            if (idx === selectedIndex) {
                if (cpModType) {
                    document.getElementById('cp-ok').click();
                } else {
                    activateItem(selectedIndex);
                }
            } else {
                navigateTo(idx);
            }
        });
        carousel.appendChild(card);
    });

    // Marcar la tarjeta central como seleccionada
    highlightSelected();
    applyCardTransforms();

    // Enviar hover a Lua para que el vehiculo haga preview
    if (options.length > 0) {
        sendHandle({
            type: 'update', what: 'menu', user: 'hover',
            menuId, menuIndex: selectedIndex
        });
    }
}

function highlightSelected() {
    document.querySelectorAll('.card').forEach((card, idx) => {
        card.classList.toggle('selected', idx === selectedIndex);
    });
}

// 
// NAVEGACIN DEL CARRUSEL
// 
function navigateTo(idx) {
    if (!options || options.length === 0) return;
    // Wrap around
    if (idx < 0) idx = options.length - 1;
    if (idx >= options.length) idx = 0;
    
    if (idx === selectedIndex) return;
    selectedIndex = idx;
    if (menuId) menuHistory[menuId] = selectedIndex;
    highlightSelected();
    applyCardTransforms();
    sendHandle({
        type: 'update', what: 'menu', user: 'hover',
        menuId, menuIndex: selectedIndex
    });
}

function navPrev() { navigateTo(selectedIndex - 1); }
function navNext() { navigateTo(selectedIndex + 1); }

// 
// RESUMEN DE SESIN
// 
function getItemDisplayName(opt) {
    const isModSub = menuId && menuId.startsWith('mod_');
    let label = opt.label || '';
    if (isModSub) {
        if (label === 'Default') {
            label = menuTitle + ' Stock';
        } else {
            label = String(label).replace(/^Level\s+(\d+)$/i, (_, n) => `${menuTitle} Nivel ${n}`);
        }
    }
    return label;
}

function addToSummary(item) {
    sessionMods.push(item);
    sessionTotal += item.price;
    renderSummary();
}

function renderSummary() {
    const listEl     = document.getElementById('sum-list');
    const emptyEl    = document.getElementById('sum-empty');
    const totalEl    = document.getElementById('sum-total');
    const countEl    = document.getElementById('sum-count');
    const confirmBtn = document.getElementById('sum-confirm');

    const count = sessionMods.length;
    countEl.textContent = count + (count === 1 ? ' mod' : ' mods');

    if (sessionTotal > 0) {
        totalEl.textContent = '$' + Math.floor(sessionTotal).toLocaleString('es-MX');
    } else if (count > 0) {
        totalEl.textContent = 'GRATIS';
    } else {
        totalEl.textContent = '$0';
    }

    confirmBtn.textContent = count > 0 ? 'v  CONFIRMAR TUNEO' : ' SALIR DEL TALLER';

    if (count === 0) {
        emptyEl.style.display = 'block';
        listEl.innerHTML = '';
        return;
    }

    emptyEl.style.display = 'none';
    listEl.innerHTML = sessionMods.map(mod => {
        let iconHtml = '';
        if (mod.colorRGB) {
            iconHtml = `<span class="sum-swatch" style="background:rgb(${mod.colorRGB.join(',')})"></span>`;
        } else if (mod.img) {
            iconHtml = `<img class="sum-icon" src="${mod.img}" alt="">`;
        }
        const priceHtml = mod.price > 0
            ? `<span class="sum-price">$${Math.floor(mod.price).toLocaleString('es-MX')}</span>`
            : '';
        return `<div class="sum-item">
            <div class="sum-item-left">
                ${iconHtml}
                <div class="sum-item-text">
                    <span class="sum-item-name">${mod.name}</span>
                    <span class="sum-item-cat">${mod.category}</span>
                </div>
            </div>
            ${priceHtml}
        </div>`;
    }).join('');

    const bodyEl = document.getElementById('sum-body');
    bodyEl.scrollTop = bodyEl.scrollHeight;
}

// 
// ACTIVAR ITEM
// 
function activateItem(idx) {
    const opt = options[idx];
    if (!opt) return;

    const isColorType = opt.customType === 'customColor' || opt.customType === 'color';

    // Registrar en el resumen: solo mods directos (precio explicito, no ya activo, no color  esos se rastrean en cp-ok)
    if (!isColorType && opt.price != null && opt.price !== -1) {
        addToSummary({
            category: menuTitle || 'Modificacion',
            name: getItemDisplayName(opt),
            price: opt.price || 0,
            img: opt.img || null,
            colorRGB: null
        });
    }

    if (isColorType) {
        cpPendingType = opt.modType || null;
    }
    sendHandle({
        type: 'update', what: 'menu', user: 'enter',
        menuId, menuIndex: idx
    });
}

// 
// MODO LIBRE  quita foco NUI, camara de tercera persona normal
// 
function toggleFreecam() {
    if (freecamOn) {
        freecamOn = false;
        document.body.style.cursor = '';
        nuiPost('freecamOff', {});
    } else {
        freecamOn = true;
        document.body.style.cursor = 'none';
        nuiPost('freecam', {});
    }
}

// 
// HUD SHOW / HIDE
// 
function showHud() {
    isVisible = true;
    document.getElementById('hud').style.display = 'flex';
    document.getElementById('summary').style.display = 'flex';
}

function hideHud() {
    isVisible = false;
    if (freecamOn) {
        freecamOn = false;
        document.body.style.cursor = '';
        nuiPost('freecamOff', {});
    }
    document.getElementById('hud').style.display = 'none';
    document.getElementById('summary').style.display = 'none';
    menuId = null; menuTitle = ''; options = []; defaultOpt = 0; selectedIndex = 0;
    menuHistory = {};
    document.getElementById('carousel').innerHTML = '';
    closeCp();
    // Resetear sesion
    sessionMods = []; sessionTotal = 0;
    document.getElementById('sum-list').innerHTML = '';
    document.getElementById('sum-empty').style.display = 'block';
    document.getElementById('sum-total').textContent = '$0';
    document.getElementById('sum-count').textContent = '0 mods';
    document.getElementById('sum-confirm').textContent = ' SALIR DEL TALLER';
}

function goBack() {
    sendHandle({ type: 'update', what: 'menu', user: 'backspace', menuId });
}

// 
// SONIDO  desactivado
// 
function playUISound(_n, _v) {}

// 
// COLOR PICKER  CONVERSIONES
// 
function hsvToRgb(h, s, v) {
    s /= 100; v /= 100;
    const c = v * s, x = c * (1 - Math.abs((h / 60) % 2 - 1)), m = v - c;
    let r = 0, g = 0, b = 0;
    if      (h < 60)  { r = c; g = x; }
    else if (h < 120) { r = x; g = c; }
    else if (h < 180) { g = c; b = x; }
    else if (h < 240) { g = x; b = c; }
    else if (h < 300) { r = x; b = c; }
    else              { r = c; b = x; }
    return {
        r: Math.round((r + m) * 255),
        g: Math.round((g + m) * 255),
        b: Math.round((b + m) * 255)
    };
}

function rgbToHsv(r, g, b) {
    r /= 255; g /= 255; b /= 255;
    const max = Math.max(r, g, b), min = Math.min(r, g, b), d = max - min;
    let h = 0;
    const s = max === 0 ? 0 : d / max, v = max;
    if (d !== 0) {
        if      (max === r) h = ((g - b) / d + (g < b ? 6 : 0)) / 6;
        else if (max === g) h = ((b - r) / d + 2) / 6;
        else                h = ((r - g) / d + 4) / 6;
    }
    return { h: h * 360, s: s * 100, v: v * 100 };
}

function rgbToHex(r, g, b) {
    return '#' + [r, g, b]
        .map(v => Math.min(255, Math.max(0, v | 0)).toString(16).padStart(2, '0'))
        .join('').toUpperCase();
}

// 
// COLOR PICKER  CANVAS
// 
function drawSV() {
    const cv = document.getElementById('cp-sv');
    const ctx = cv.getContext('2d');
    const W = cv.width, H = cv.height;
    ctx.fillStyle = `hsl(${cpH},100%,50%)`;
    ctx.fillRect(0, 0, W, H);
    const gW = ctx.createLinearGradient(0, 0, W, 0);
    gW.addColorStop(0, 'rgba(255,255,255,1)');
    gW.addColorStop(1, 'rgba(255,255,255,0)');
    ctx.fillStyle = gW; ctx.fillRect(0, 0, W, H);
    const gB = ctx.createLinearGradient(0, 0, 0, H);
    gB.addColorStop(0, 'rgba(0,0,0,0)');
    gB.addColorStop(1, 'rgba(0,0,0,1)');
    ctx.fillStyle = gB; ctx.fillRect(0, 0, W, H);
    const cx = (cpS / 100) * W, cy = (1 - cpV / 100) * H;
    ctx.beginPath(); ctx.arc(cx, cy, 9, 0, Math.PI * 2);
    ctx.strokeStyle = 'rgba(0,0,0,0.6)'; ctx.lineWidth = 3; ctx.stroke();
    ctx.beginPath(); ctx.arc(cx, cy, 8, 0, Math.PI * 2);
    ctx.strokeStyle = '#fff'; ctx.lineWidth = 2; ctx.stroke();
}

function drawHue() {
    const cv = document.getElementById('cp-hue');
    const ctx = cv.getContext('2d');
    const W = cv.width, H = cv.height;
    const grad = ctx.createLinearGradient(0, 0, W, 0);
    for (let i = 0; i <= 6; i++) grad.addColorStop(i / 6, `hsl(${i * 60},100%,50%)`);
    ctx.clearRect(0, 0, W, H); ctx.fillStyle = grad; ctx.fillRect(0, 0, W, H);
    const tx = (cpH / 360) * W, R = H / 2;
    ctx.beginPath(); ctx.arc(tx, R, R - 1, 0, Math.PI * 2);
    ctx.strokeStyle = 'rgba(0,0,0,0.5)'; ctx.lineWidth = 3; ctx.stroke();
    ctx.beginPath(); ctx.arc(tx, R, R - 2, 0, Math.PI * 2);
    ctx.strokeStyle = '#fff'; ctx.lineWidth = 2; ctx.stroke();
}

function cpRefresh(sendToLua) {
    drawSV(); drawHue();
    const { r, g, b } = hsvToRgb(cpH, cpS, cpV);
    document.getElementById('cp-swatch').style.background = `rgb(${r},${g},${b})`;
    document.getElementById('cp-hex').value = rgbToHex(r, g, b);
    if (sendToLua && cpModType) {
        const now = Date.now();
        if (now - cpLastSend >= 50) {
            cpLastSend = now;
            sendHandle({
                type: 'update', what: 'menu', user: 'hover',
                menuId: 'mod_' + cpModType, menuIndex: 0,
                color: [r, g, b]
            });
        }
    }
}

function openCp(data) {
    cpModType     = data.modType || cpModType || cpPendingType || null;
    cpPendingType = null;
    cpTitle       = data.title     || '';
    cpPriceMult   = data.priceMult || 1;
    cpPrice       = data.price     || 0;
    cpIsCustom    = !!data.isCustom;
    cpCategory    = data.category  || null;

    document.getElementById('cp-title').textContent = cpTitle.toUpperCase();
    document.getElementById('cp-price-tag').textContent = cpPrice > 0
        ? '$' + Math.floor(cpPrice).toLocaleString('es-MX') : '';
    document.getElementById('cp').style.display = 'flex';

    if (cpIsCustom) {
        // Color libre (color1 / color2 / neon / humo de llantas)
        document.getElementById('cp-rgbpicker').style.display = 'flex';
        document.getElementById('cp-palette').style.display = 'none';

        let r = 255, g = 0, b = 0;
        if (Array.isArray(data.defaultValue) && data.defaultValue.length >= 3)
            [r, g, b] = data.defaultValue;
        cpOriginalRGB = { r, g, b };
        const hsv = rgbToHsv(r, g, b);
        cpH = hsv.h; cpS = hsv.s; cpV = hsv.v;
        cpRefresh(false);
    } else {
        // Paleta fija (nacarado / llantas / tablero / interior)
        document.getElementById('cp-rgbpicker').style.display = 'none';
        document.getElementById('cp-palette').style.display = 'flex';

        let idx = parseInt(data.defaultValue, 10);
        if (isNaN(idx) || idx < 0) idx = 0;
        if (idx >= PALETTE_COLORS.length) idx = PALETTE_COLORS.length - 1;
        cpOriginalIndex = idx;
        buildPalette(idx, data.validIndices);
    }
}

function buildPalette(selectedIdx, validIndices) {
    cpPaletteIndex = selectedIdx;
    const cont = document.getElementById('cp-palette');
    
    let html = '';
    if (validIndices && validIndices.length > 0) {
        validIndices.forEach(i => {
            if (!PALETTE_COLORS[i]) return;
            const c = PALETTE_COLORS[i];
            html += `<div class="cp-swatch${i === selectedIdx ? ' sel' : ''}" data-i="${i}" style="background:rgb(${c[0]},${c[1]},${c[2]})"></div>`;
        });
    } else {
        for(let i=0; i<PALETTE_COLORS.length; i++) {
            const c = PALETTE_COLORS[i];
            html += `<div class="cp-swatch${i === selectedIdx ? ' sel' : ''}" data-i="${i}" style="background:rgb(${c[0]},${c[1]},${c[2]})"></div>`;
        }
    }
    cont.innerHTML = html;
    
    cont.querySelectorAll('.cp-swatch').forEach(el => {
        el.addEventListener('click', () => selectPaletteColor(parseInt(el.dataset.i, 10)));
    });
    
    if (validIndices && validIndices.length > 0 && !validIndices.includes(selectedIdx)) {
        selectPaletteColor(validIndices[0]);
    }
}

function selectPaletteColor(idx) {
    cpPaletteIndex = idx;
    document.querySelectorAll('#cp-palette .cp-swatch').forEach(el => {
        el.classList.toggle('sel', parseInt(el.dataset.i, 10) === idx);
    });
    if (cpModType) {
        sendHandle({
            type: 'update', what: 'menu', user: 'hover',
            menuId: 'mod_' + cpModType, menuIndex: 0,
            color: idx
        });
    }
}

function closeCp() {
    document.getElementById('cp').style.display = 'none';
    cpModType = null; cpOriginalRGB = null; cpDragging = null;
    cpIsCustom = true; cpPaletteIndex = 0; cpOriginalIndex = 0;
    cpCategory = null;
}

function cpCancel() {
    if (!cpModType) return;
    if (cpIsCustom) {
        if (cpOriginalRGB) {
            const { r, g, b } = cpOriginalRGB;
            sendHandle({
                type: 'update', what: 'menu', user: 'hover',
                menuId: 'mod_' + cpModType, menuIndex: 0,
                color: [r, g, b]
            });
        }
    } else {
        sendHandle({
            type: 'update', what: 'menu', user: 'hover',
            menuId: 'mod_' + cpModType, menuIndex: 0,
            color: cpOriginalIndex
        });
    }
    sendHandle({ type: 'update', what: 'menu', user: 'backspace', menuId: 'mod_' + cpModType });
    closeCp();
}

// 
// MENSAJES NUI  (Lua  JS)
// 
window.addEventListener('message', ({ data }) => {
    if (!data || !data.type) return;

    switch (data.type) {
        case 'open':
            if (!data.what) {
                showHud();
            } else if (data.what === 'colorPicker') {
                openCp(data);
            }
            break;

        case 'close':
            hideHud();
            break;

        case 'update':
            if (data.what === 'menu') {
                try {
                fetch('https://lls_mechanic/nuiError', { method: 'POST', body: JSON.stringify({ message: 'DEBUG MENU RECEIVED: ' + data.menuId + ' options: ' + (data.options ? data.options.length : 'undefined') }) });
                // Fallback: extraer cpModType del menuId si el picker esta abierto
                const cpEl = document.getElementById('cp');
                if (cpEl.style.display === 'flex' && !cpModType
                        && data.menuId && data.menuId.startsWith('mod_')) {
                    cpModType = data.menuId.slice(4);
                }
                if (cpModType && data.menuId !== 'mod_' + cpModType) closeCp();

                menuId     = data.menuId;
                menuTitle  = data.menuTitle     || '';
                options    = data.options       || [];
                defaultOpt = data.defaultOption || 0;

                // Posicionar el foco en el item activo, en el historial, o en defaultOpt
                const currentIdx = options.findIndex(o => o && o.price === -1);
                if (currentIdx >= 0) {
                    selectedIndex = currentIdx;
                } else if (menuId && menuHistory[menuId] !== undefined) {
                    selectedIndex = menuHistory[menuId];
                } else {
                    selectedIndex = defaultOpt || 0;
                }

                if (selectedIndex < 0 || selectedIndex >= options.length) {
                    selectedIndex = 0;
                }

                renderCarousel();
                } catch(err) {
                    fetch('https://lls_mechanic/nuiError', { method: 'POST', body: JSON.stringify({ message: 'CRITICAL ERROR IN MENU RENDER: ' + err.message + ' ' + err.stack }) });
                }

            } else if (data.what === 'cash') {
                // Balance eliminado del header; ignorar silenciosamente
            } else if (data.what === 'card') {
                const el = document.getElementById('hdr-name');
                if (el && data.vehicleName) el.textContent = data.vehicleName;
            }
            break;

        case 'freecamEnd':
            // Lua restauro el foco  volvemos al menu normal
            freecamOn = false;
            document.body.style.cursor = '';
            break;

        case 'playSound':
            playUISound(data.soundName, data.volume);
            break;
    }
});

// 
// TECLADO
// 
document.addEventListener('keydown', (e) => {
    fetch('https://lls_mechanic/nuiError', { method: 'POST', body: JSON.stringify({ message: 'DEBUG KEY PRESSED: ' + e.key + ' OPTIONS.LENGTH: ' + (options ? options.length : 'null') }) });
    if (!isVisible) return;
    if (e.target.tagName === 'INPUT') {
        fetch('https://lls_mechanic/nuiError', { method: 'POST', body: JSON.stringify({ message: 'DEBUG KEY TRAPPED BY INPUT: ' + e.key }) });
        if (e.key === 'Escape') { e.target.blur(); e.preventDefault(); return; }
        return; // Ignore all other keys
    }

    switch (e.key) {
        case 'ArrowLeft':
            e.preventDefault();
            navPrev();
            break;

        case 'ArrowRight':
            e.preventDefault();
            navNext();
            break;

        case 'ArrowUp':
            e.preventDefault();
            navPrev();
            break;

        case 'ArrowDown':
            e.preventDefault();
            navNext();
            break;

        case 'Enter':
            e.preventDefault();
            if (cpModType) {
                document.getElementById('cp-ok').click();
            } else {
                activateItem(selectedIndex);
            }
            break;

        case 'Backspace':
            e.preventDefault();
            if (cpModType) cpCancel();
            else goBack();
            break;

        case 'Escape':
            e.preventDefault();
            hideHud();
            sendHandle({ type: 'close' });
            break;

        case 'c':
        case 'C':
            e.preventDefault();
            toggleFreecam();
            break;
    }
});

// 
// INIT
// 
document.addEventListener('DOMContentLoaded', () => {

    // Color picker canvas  SV
    const svCanvas  = document.getElementById('cp-sv');
    const hueCanvas = document.getElementById('cp-hue');

    function applyDrag(e) {
        if (cpDragging === 'sv') {
            const r = svCanvas.getBoundingClientRect();
            cpS = Math.max(0, Math.min(100, ((e.clientX - r.left) / r.width) * 100));
            cpV = Math.max(0, Math.min(100, (1 - (e.clientY - r.top) / r.height) * 100));
            cpRefresh(true);
        } else if (cpDragging === 'hue') {
            const r = hueCanvas.getBoundingClientRect();
            cpH = Math.max(0, Math.min(360, ((e.clientX - r.left) / r.width) * 360));
            cpRefresh(true);
        }
    }

    svCanvas.addEventListener('mousedown',  (e) => { cpDragging = 'sv';  applyDrag(e); });
    hueCanvas.addEventListener('mousedown', (e) => { cpDragging = 'hue'; applyDrag(e); });
    document.addEventListener('mousemove', applyDrag);
    document.addEventListener('mouseup',   () => { cpDragging = null; });

    document.getElementById('cp-ok').addEventListener('click', () => {
        if (!cpModType) return;
        
        let realCategory = 'Color';
        if (cpModType === 'color1') realCategory = 'Color Primario';
        else if (cpModType === 'color2') realCategory = 'Color Secundario';
        else if (cpModType === 'pearlescentColor') realCategory = 'Color Nacarado';
        else if (cpModType === 'wheelColor') realCategory = 'Color de Llantas';
        else if (cpModType === 'tyreSmokeColor') realCategory = 'Humo de llantas';
        else if (cpModType === 'neonColor') realCategory = 'Color de neón';
        
        if (cpIsCustom) {
            const { r, g, b } = hsvToRgb(cpH, cpS, cpV);
            addToSummary({
                category: realCategory,
                name: (cpTitle || 'Color') + ' - ' + rgbToHex(r, g, b),
                price: cpPrice || 0,
                img: null,
                colorRGB: [r, g, b]
            });
            sendHandle({
                type: 'update', what: 'menu', user: 'enter',
                menuId: 'mod_' + cpModType, menuIndex: 0,
                color: [r, g, b], colorTitle: cpTitle,
                isCustom: true, priceMult: cpPriceMult, price: cpPrice
            });
            closeCp();
        } else {
            const c = PALETTE_COLORS[cpPaletteIndex] || [255, 255, 255];
            addToSummary({
                category: realCategory,
                name: cpTitle || ('Color ' + cpPaletteIndex),
                price: cpPrice || 0,
                img: null,
                colorRGB: c
            });
            sendHandle({
                type: 'update', what: 'menu', user: 'enter',
                menuId: 'mod_' + cpModType, menuIndex: 0,
                color: cpPaletteIndex, colorTitle: cpTitle,
                isCustom: false, priceMult: cpPriceMult, price: cpPrice,
                category: cpCategory
            });
            closeCp();
        }
    });

    document.getElementById('cp-cancel').addEventListener('click', cpCancel);
    const hexInput = document.getElementById('cp-hex');
    if (hexInput) {
        hexInput.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') {
                e.preventDefault();
                const hex = hexInput.value;
                const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
                if (result) {
                    const r = parseInt(result[1], 16);
                    const g = parseInt(result[2], 16);
                    const b = parseInt(result[3], 16);
                    const hsv = rgbToHsv(r, g, b);
                    cpH = hsv.h; cpS = hsv.s; cpV = hsv.v;
                    updateCpUI();
                    sendHoverColor();
                }
            }
        });
        hexInput.addEventListener('focus', () => hexInput.select());
    }

    document.getElementById('sum-confirm').addEventListener('click', () => {
        if (sessionMods.length > 0) {
            hideHud();
            sendHandle({ type: 'confirm' });
        } else {
            hideHud();
            sendHandle({ type: 'close' });
        }
    });

    document.addEventListener('wheel', (e) => {
        if (!isVisible || cpDragging) return;
        if (e.deltaY < 0) navPrev();
        else if (e.deltaY > 0) navNext();
    });

    document.addEventListener('contextmenu', e => e.preventDefault());

    document.addEventListener('mousedown', (e) => {
        if (!isVisible) return;
        if (e.button === 2 && !freecamOn) toggleFreecam();
    });

    document.addEventListener('mouseup', (e) => {
        if (!isVisible) return;
        if (e.button === 2 && freecamOn) toggleFreecam();
    });

    nuiPost('uiReady', {});
});

















