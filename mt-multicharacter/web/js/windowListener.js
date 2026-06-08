window.addEventListener('message', e => {
    var NUI = e.data

    if (NUI.type == 'INIT') base.show(NUI.state)
    if (NUI.type == 'SET_DEBUG') window.debugEnabled = NUI.data
    if (NUI.type == 'ADJUST_MUSIC') music.adjustState(NUI.state)
    if (NUI.type == 'HANDLE_SCREEN') screens.showScreen(NUI.screen, NUI.init)
    if (NUI.type == 'ADD_CHARACTERS') base.setData(NUI.data)
    if (NUI.type == 'AWAITER_INIT') awaiter.show(NUI.state, NUI.noMusic)
    if (NUI.type == 'UPDATE_ENTITY') base.updateEntity(NUI.data, NUI.id)
    if (NUI.type == 'SET_SLOTS') base.setSlotsAmount(NUI.data)
    if (NUI.type == 'WELCOME_SCREEN') welcomeScreen.init(NUI.state, NUI.text, NUI.data)
    if (NUI.type == 'FX_PLAY') music[NUI.data.fx].play()
    if (NUI.type == 'INFO_TEXT') infoText.show(NUI.state, NUI.text)
    if (NUI.type == 'SET_IS_LOGOUT') base.setIsLogout(NUI.state)
    if (NUI.type == 'SEND_DEFAULT_MUSIC') music.setDefaultMusicData(NUI.data)
    if (NUI.type == 'PLAY_SFX') { if (music[NUI.sfx]) music[NUI.sfx].play() }
    if (NUI.type == 'SET_KEYDOWN_ARE_USABLE') base.setKeydownsUsable(NUI.state)
    if (NUI.type == 'CINEMATICS_INIT') cinematics.show(NUI.state)
    if (NUI.type == 'CINEMATICS_TEXT_BOX') welcomeScreen.init(NUI.state, NUI.text)
    if (NUI.type == 'SHOW_IDENTITY') creator.show()
    if (NUI.type == 'INITIAL_SCREEN_INIT') welcomeScreen.init(NUI.state, NUI.text)
    if (NUI.type == 'SET_DELETE_BUTTON') {
        NUI.state ? $('.remove-content-button').show() : $('.remove-content-button').hide()
    }

    if (NUI.type == 'HANDLE_BLACK_SCREEN') {
        NUI.state ? $('.black-screen-override').fadeIn(NUI.slow ? 1000 : 1) : $('.black-screen-override').fadeOut(NUI.slow ? 1000 : 1)
    }

    if (NUI.type == 'SET_COLOR') {
        document.documentElement.style.setProperty('--main-color', `rgb(${NUI.data.color.r}, ${NUI.data.color.g}, ${NUI.data.color.b})`);
    }

    if (NUI.type == 'SET_PACKS') {
        presents.setData(NUI.data);
        if (typeof admin !== 'undefined') admin.setData('packs', NUI.data);
    }
    if (NUI.type == 'SET_GLOBAL_CONFIG') {
        if (typeof admin !== 'undefined') admin.setData('global', NUI.data);
    }
    if (NUI.type == 'VEHICLE_TAG') vehicleTag.show(NUI.state)
    if (NUI.type == 'UPDATE_VEHICLE_TAG') vehicleTag.update(NUI.x, NUI.y, NUI.state)
    if (NUI.type == 'SET_SLIDER_EFFECT') welcomeScreen.slider()
    if (NUI.type == 'SET_INITIAL_STATE') base.setInitialState(NUI.data)

    if (NUI.type == 'SET_DISCORD_URL') {
        $('.discord-content-button').attr('data-url', NUI.data);
    }

    if (NUI.type == 'OPEN_ADMIN') admin.show(true)

    if (NUI.type == 'TRIGGER_TRANSITION') welcomeScreen.arrivalTransition()

    if (NUI.type == 'SHOW_CLAIM_INSTRUCTIONS') {
        if (NUI.state) {
            $('#inst-title').text(NUI.title);
            $('#inst-desc').text(NUI.desc);
            $('#claim-instructions').fadeIn(600);
        } else {
            $('#claim-instructions').fadeOut(600);
        }
    }

    if (NUI.type == 'UPDATE_CLAIM_TAG') {
        if (NUI.state) {
            $('#claim-tag-text').text(NUI.text);
            if (NUI.subtext) {
                $('#claim-tag-sub').text(NUI.subtext).show();
            } else {
                $('#claim-tag-sub').hide();
            }
            $('#claim-tag').css({
                left: NUI.x + '%',
                top: NUI.y + '%'
            }).show();
        } else {
            $('#claim-tag').hide();
        }
    }
})

window.addEventListener('keydown', e => {
    if (!base.canUseKeydowns()) return

    if (e.code == 'Enter') {
        if (typeof admin !== 'undefined' && admin.isActive) return
        if (!screens.current && !creator.isActive) {
            base.selectCharacter()
        }
    }

    if (e.code == 'Escape') {
        if (typeof admin !== 'undefined' && admin.isActive) {
            admin.show(false);
        }
    }
})

document.addEventListener('keydown', function (e) {
    if (e.key === 'Tab') e.preventDefault();
});
