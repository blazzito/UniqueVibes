let idTypesConfig = {};

window.addEventListener('message', function(event) {
    const action = event.data.action;
    const data = event.data.data;

    if (action === 'idcard:requestBaseUrl') {
        const url = `https://nui-img/${data}/${data}?t=${Date.now()}`;
        
        // Update current mugshot if it exists
        const img = document.querySelector('.mugshot-container img');
        if (img) img.src = url;

        fetch(`https://${GetParentResourceName()}/idcard:resolveBaseUrl`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify(url)
        }).catch(err => {
            console.error('Error resolving mugshot:', err);
        });
        return;
    }

    if (action === 'idcard:config') {
        idTypesConfig = data;
    }

    if (action === 'idcard:data') {
        if (data) {
            showCard(data);
        } else {
            hideCard();
        }
    }
});

function showCard(data) {
    const container = document.getElementById('card-container');
    const app = document.getElementById('app');
    
    // Determine card theme and config
    const type = data.idType || 'male_id';
    const config = idTypesConfig[type] || {};
    
    let cardClass = 'card-dni';
    let iconSvg = '';
    let extraInfo = '';
    
    // Map internal types to visual themes
    if (type.includes('driver')) {
        cardClass = 'card-driver';
        iconSvg = `<svg viewBox="0 0 24 24"><path d="M12,2C6.48,2,2,6.48,2,12s4.48,10,10,10s10-4.48,10-10S17.52,2,12,2z M12,20c-4.41,0-8-3.59-8-8s3.59-8,8-8s8,3.59,8,8 S16.41,20,12,20z M12,11c-0.55,0-1,0.45-1,1s0.45,1,1,1s1-0.45,1-1S12.55,11,12,11z M11,7h2v3h-2V7z M11,14h2v3h-2V14z"/></svg>`;
        extraInfo = `
            <div class="info-item">
                <span class="info-label">CLASE</span>
                <span class="info-value">A / B / C</span>
            </div>
            <div class="info-item">
                <span class="info-label">EXPIRA</span>
                <span class="info-value">${getFutureDate(5)}</span>
            </div>
        `;
    } else if (type.includes('weapon')) {
        cardClass = 'card-weapon';
        iconSvg = `<svg viewBox="0 0 24 24"><path d="M21,13.5V11H13.62C13.2,10.42,12.63,9.97,12,9.7V5c0-0.55-0.45-1-1-1H5C4.45,4,4,4.45,4,5v2c0,0.55,0.45,1,1,1h5v1.7 c-0.63,0.27-1.2,0.72-1.62,1.3H1v2.5c0,0.55,0.45,1,1,1h6.38c0.42,0.58,0.99,1.03,1.62,1.3V21c0,0.55,0.45,1,1,1h6c0.55,0,1-0.45,1-1 v-4.7c0.63-0.27,1.2-0.72,1.62-1.3H21C21.55,15,22,14.55,22,14V13.5z M11,14.5c-0.83,0-1.5-0.67-1.5-1.5s0.67-1.5,1.5-1.5 s1.5,0.67,1.5,1.5S11.83,14.5,11,14.5z"/></svg>`;
        extraInfo = `
            <div class="info-item">
                <span class="info-label">CATEGORÍA</span>
                <span class="info-value">DEFENSA</span>
            </div>
            <div class="info-item">
                <span class="info-label">EXPIRA</span>
                <span class="info-value">${getFutureDate(2)}</span>
            </div>
        `;
    } else {
        // DNI / ID
        iconSvg = `<svg viewBox="0 0 24 24"><path d="M12,2C6.48,2,2,6.48,2,12s4.48,10,10,10s10-4.48,10-10S17.52,2,12,2z M12,5c1.66,0,3,1.34,3,3s-1.34,3-3,3s-3-1.34-3-3 S10.34,5,12,5z M12,19.2c-2.5,0-4.71-1.28-6-3.22c0.03-1.99,4-3.08,6-3.08s5.97,1.09,6,3.08C16.71,17.92,14.5,19.2,12,19.2z"/></svg>`;
        extraInfo = `
            <div class="info-item">
                <span class="info-label">FECHA NAC.</span>
                <span class="info-value">${data.dob}</span>
            </div>
            <div class="info-item">
                <span class="info-label">SEXO</span>
                <span class="info-value">${data.sex === 'male' ? 'HOMBRE' : 'MUJER'}</span>
            </div>
            <div class="info-item">
                <span class="info-label">ESTADO</span>
                <span class="info-value">NEW YORK</span>
            </div>
            <div class="info-item">
                <span class="info-label">NACIONALIDAD</span>
                <span class="info-value">${data.nationality || 'ESPAÑOLA'}</span>
            </div>
            <div class="info-item">
                <span class="info-label">CITIZEN ID</span>
                <span class="info-value">${data.id}</span>
            </div>
            <div class="info-item">
                <span class="info-label">EXPIRA</span>
                <span class="info-value">${getFutureDate(10)}</span>
            </div>
        `;
    }

    const imgUrl = (data.imageURL && data.imageURL.length > 10) ? data.imageURL : 
                   (data.sex === 'male' ? 'https://img.icons8.com/color/120/a9a9a9/circled-user-male-skin-type-1-2.png' : 
                                         'https://img.icons8.com/color/120/a9a9a9/circled-user-female-skin-type-1-2.png');

    const html = `
        <div class="id-card ${cardClass}" id="main-card">
            <div class="header">
                <div class="title-container">
                    <span class="state-title">${config.title === 'SAN ANDREAS' ? 'NEW YORK CITY' : (config.title || 'NEW YORK CITY')}</span>
                    <span class="card-label">${config.label || 'IDENTIFICACIÓN'}</span>
                </div>
                <div class="logo-container">
                </div>
            </div>

            <div class="card-body">
                <div class="photo-section">
                    <div class="mugshot-container">
                        <img src="${imgUrl}" alt="Mugshot" onerror="this.src='https://img.icons8.com/ios-filled/100/ffffff/user.png'">
                        ${config.profileStamp ? '<div class="photo-stamp"><svg viewBox="0 0 24 24"><path d="M9,16.17L4.83,12l-1.42,1.41L9,19L21,7l-1.41-1.41L9,16.17z"/></svg></div>' : ''}
                    </div>
                </div>

                <div class="info-section">
                    <div class="info-item full-width">
                        <span class="info-label">APELLIDOS / LAST NAME</span>
                        <span class="info-value name-large">${data.lastName}</span>
                    </div>
                    <div class="info-item full-width">
                        <span class="info-label">NOMBRE / FIRST NAME</span>
                        <span class="info-value name-large">${data.firstName}</span>
                    </div>
                    ${extraInfo}
                </div>
            </div>

            <div class="barcode"></div>
        </div>
    `;

    container.innerHTML = html;
    app.style.display = 'flex';
    
    // Small timeout to ensure transition works
    setTimeout(() => {
        document.getElementById('main-card').classList.add('show');
    }, 50);
}

function hideCard() {
    const card = document.getElementById('main-card');
    if (card) {
        card.classList.remove('show');
        setTimeout(() => {
            document.getElementById('app').style.display = 'none';
            document.getElementById('card-container').innerHTML = '';
        }, 600);
    }
}

function getFutureDate(years) {
    const d = new Date();
    d.setFullYear(d.getFullYear() + years);
    return d.toLocaleDateString('es-ES', { day: '2-digit', month: '2-digit', year: 'numeric' });
}

// Notify client that NUI is ready
fetch(`https://${GetParentResourceName()}/idcard:loaded`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({})
});
