const debugLog = (msg) => {
    if (window.debugEnabled) {
        console.log(`%c[esx_multicharacter] DEBUG: %c${msg}`, "color: #ff007f; font-weight: bold;", "color: white;");
    }
};

const base = {
    characters: {},
    hasCharactersAuthority: false,
    currentCharacterId: -1,
    isActive: false,
    isLogout: false,
    filters: {
        index: 0,
        data: {},
        name: 'GAME_FILTERS'
    },
    cameras: {
        index: 0,
        data: {},
        name: 'CAMERA_ANIMATION',
    },
    canUseLocationsOnLogout: null,
    keydownsUsable: true,
    loader: function (state) {
        state ? $('.loader-content').css({ display: 'flex' }).hide().fadeIn() : $('.loader-content').fadeOut()
    },
    show: function (state) {
        if (state == this.isActive) return
        if (!state) {
            this.currentCharacterId = -1;
            $('.play-button').addClass('status-disabled');
            $('.remove-content-button').css({ opacity: 0.2, 'pointer-events': 'none' });
            $('.name-box-user-name').html('...');
            $('.user-job').html('...');
        }

        state ? $('.multicharacter-container').css({ display: 'flex' }).hide().fadeIn(300) : $('.multicharacter-container').fadeOut(300)

        if (state) {
            anime({
                targets: '.base-ghost-text',
                scale: [1.1, 1],
                opacity: [0, 1],
                easing: 'cubicBezier(0.075, 0.82, 0.165, 1)',
                duration: 1000
            })

            if (this.currentCharacterId === -1) {
                $('.play-button').addClass('status-disabled');
                $('.remove-content-button').css({ opacity: 0.2, 'pointer-events': 'none' });
                const charList = Object.values(this.characters);
                if (charList.length > 0) {
                    const firstChar = charList[0];
                    const charId = Number(firstChar.id);
                    $.post(`https://${GetParentResourceName()}/swapEntity`, JSON.stringify({ key: charId }));
                    this.updateEntity(firstChar, charId);
                }
            } else {
                $('.play-button').removeClass('status-disabled');
            }
        }

        anime({
            targets: [".center-name-box", ".user-job", ".x-marks"],
            translateX: state ? ['5vw', '0vw'] : ['0vw', '5vw'],
            easing: 'cubicBezier(0.075, 0.82, 0.165, 1)',
            duration: 1000,
        })

        anime({
            targets: [".bottom-content"],
            translateY: state ? ['5vw', '0vw'] : ['0vw', '5vw'],
            easing: 'cubicBezier(0.075, 0.82, 0.165, 1)',
            duration: 1200,
        })

        this.isActive = state
    },
    setLocationsDisabled: function (state) {
        $('.spawn-location-button').css({ display: state ? 'none' : 'flex' })
    },
    setIsLogout: function (state) {
        this.isLogout = state
    },
    setSlotsAmount: function (amount) {
        $('.character-navs').empty()
        let totalCharacters = amount
        if (totalCharacters == 0) totalCharacters = 1
        for (let charNumbers = 1; charNumbers <= totalCharacters; charNumbers++) {
            const rotation = (Math.random() * 6 - 3).toFixed(1);
            $('.character-navs').append(`
                <div class="character character-new" data-key="${charNumbers}" style="--rot: ${rotation}deg">
                    <div class="inner-photo">
                        <i data-lucide="plus" class="icon"></i>
                    </div>
                    <div class="hand-text">${ESX.Translations.Interface['NEW_CHAR']}</div>
                </div>`)
        }
        if (window.lucide) { lucide.createIcons(); }
    },
    setInitialState: function (state) {
        this.hasCharactersAuthority = state;
        welcomeScreen.dataLoaded = true;
    },
    setData: function (data) {
        this.characters = {}
        this.currentCharacterId = -1;
        $('.play-button').addClass('status-disabled');
        const dataEntries = Object.entries(data);

        for (const [_, char] of dataEntries) {
            let charId = Number(char.id)
            this.characters[charId] = char;

            let characterDiv = $('.character').eq(charId - 1)
            $(characterDiv).data('key', charId)
            $(characterDiv).removeClass('character-new')

            $(characterDiv).find('.inner-photo').html('<i data-lucide="user" class="icon"></i>')
            $(characterDiv).find('.hand-text').html(char.firstname + ' ' + char.lastname)
        }
        if (window.lucide) { lucide.createIcons(); }

        if (this.isActive && this.currentCharacterId === -1) {
            const charList = Object.values(this.characters);
            const realCharacters = charList.filter(c => c && c.firstname);
            if (realCharacters.length > 0) {
                const firstChar = realCharacters[0];
                const charId = Number(firstChar.id);
                $.post(`https://${GetParentResourceName()}/swapEntity`, JSON.stringify({ key: charId }));
                this.updateEntity(firstChar, charId);
            }
        }
    },
    updateEntity: function (data, id) {
        const fullName = data.firstname + ' ' + data.lastname;
        $('.remove-box-user-name').html(fullName)
        const nameElem = document.querySelector('.name-box-user-name');

        if (nameElem) {
            if (!this.nameScrambler) {
                this.nameScrambler = new TextScramble(nameElem)
            }
            this.nameScrambler.setText(fullName)
        }

        $('.character.active').removeClass('active')
        $('.character').each(function () {
            if ($(this).data('key') == id) $(this).addClass('active')
        })

        $('.user-job').html(data.job.name != 'unemployed' ? (data.job.label + ' ' + data.job.grade_label) : data.job.label)

        this.currentCharacterId = id;
        $('.play-button').removeClass('status-disabled');
        $('.remove-content-button').css({ opacity: 1, 'pointer-events': 'auto' });
    },
    createNewCharacter: function (id) {
        $('.play-button').addClass('exit-pop');
        $('.character-navs').addClass('exit-drop-down');
        $('.center-content').addClass('exit-slide-right');
        $('.upper-right-content').addClass('exit-slide-right');
        $('.left-wall-brand').addClass('exit-slide-left');

        $('#slider-black').show().addClass('active');

        setTimeout(() => {
            $.post(`https://${GetParentResourceName()}/createNewCharacter`, JSON.stringify({ id: Number(id) }))
            creator.show(true);
        }, 900);
    },
    selectCharacter: function () {
        if (this.currentCharacterId === -1) return;

        $('.play-button').addClass('exit-pop');
        $('.character-navs').addClass('exit-drop-down');
        $('.center-content').addClass('exit-slide-right');
        $('.upper-right-content').addClass('exit-slide-right');
        $('.left-wall-brand').addClass('exit-slide-left');

        $('#slider-black').show().addClass('active');

        setTimeout(() => {
            $.post(`https://${GetParentResourceName()}/selectedCharacter`, JSON.stringify({
                id: this.currentCharacterId
            }))
        }, 900);
    },
    setSpawnLocationVisibility: function (state) {
    },

    getCurrentCharId: function () { return this.currentCharacterId },

    getCharacterData: function (key) {
        return this.characters[key]
    },
    isConfigSet: function () {
        return this.configSet
    },
    setConfig: function (Config) {
        !Config.UI['discord'] ? $('.discord-content-button').remove() : $('.discord-content-button').attr('data-url', Config.UI['discord'])
        !Config.UI['youtube'] ? $('.youtube-content-button').remove() : $('.youtube-content-button').attr('data-url', Config.UI['youtube'])
        !Config.UI['website'] ? $('.website-content-button').remove() : $('.website-content-button').attr('data-url', Config.UI['website'])
        !Config.UI['delete_character'] && $('.remove-content-button').remove()
        this.canUseLocationsOnLogout = Config.CanSwapLocationOnLogout
        this.dateFormat = Config.DateFormat

        this.useUIV2Music = Config.UseMusicFromUIV2
        this.useIdentityDupeCheck = Config.IdentityDuplicateCheck

        if (this.useUIV2Music) {
            $.post(`https://${GetParentResourceName()}/UIReady`, JSON.stringify({}))
        }
        $('.identity-input-date').attr('placeholder', 'DD / MM / YYYY')
        $('.server-logo').attr('src', Config.ServerLogo)
        this.configSet = true
    },


    canUseKeydowns: function () {
        return this.keydownsUsable
    },
    setKeydownsUsable: function (state) {
        this.keydownsUsable = state
    }
}

const storage = {
    videoId: false,
    dropTick: 0,
    darkMode: false,
    userSettings: {},
    storageSet: false,
    isStorageSet: function () {
        return this.storageSet
    },
    prepare: async function () {
        $.post(`https://${GetParentResourceName()}/gatherStorage`, JSON.stringify({}))
    },

}

const infoText = {
    isActive: false,
    show: function (state, text) {
        $('.loading-information').stop().animate({ opacity: state ? 1 : 0 })
        if (!text) {
            $('.loading-information .text').addClass('no-text')
        } else {
            $('.loading-information .text').html(text)
            $('.loading-information .text').removeClass('no-text')
        }
    }
}

const awaiter = {
    isActive: false,
    show: function (state, nomusic) {
        if (state == this.isActive) return
        state ? $('.loader-container').css({ display: 'flex' }).hide().fadeIn(250) : $('.loader-container').fadeOut()
        this.isActive = state
        if (nomusic) return
        state ? music.fade(15, 1000) : music.fade(30, 1000)
    }
}



const welcomeScreen = {
    isActive: false,
    queue: false,
    loadingMessages: [
        "MEZCLANDO PINTURA...",
        "AJUSTANDO VÁLVULAS...",
        "PREPARANDO MUROS...",
        "AFILANDO TRAZOS...",
        "CARGANDO ESTILO..."
    ],

    isInitializing: false,
    sessionInitialized: false,
    dataLoaded: false,

    init: function (state, text, data) {
        if (state && (this.isActive || this.isInitializing || this.sessionInitialized || creator.isFinishing)) return
        if (!state) {
            this.sessionInitialized = false;
            this.dataLoaded = false;
            music.adjustState('STOP');
        } else {
            music.adjustState('START', data);
        }
        this.slideBars(state, text)
    },

    triggerTransition: function () {
        if (!this.dataLoaded) {
            setTimeout(() => this.triggerTransition(), 500);
            return;
        }
        $('#slider-black').show().addClass('active');

        setTimeout(() => {
            $('.welcome-screen').hide();
            this.isActive = false;
            this.isInitializing = false;
            this.sessionInitialized = true;

            if (base.hasCharactersAuthority) {
                base.show(true);
            } else {
                creator.show();
            }

            anime({
                targets: '.base-ghost-text',
                opacity: [0, 1],
                scale: [1.1, 1],
                duration: 1500,
                easing: 'cubicBezier(0.075, 0.82, 0.165, 1)'
            })

            $.post(`https://${GetParentResourceName()}/activateFocus`, JSON.stringify({}));
            this.queue = false;
        }, 900);

        setTimeout(() => {
            $('#slider-black').removeClass('active').hide();
        }, 3000);
    },

    arrivalTransition: function () {
        const slider = $('#slider-black');
        if (slider.length > 0) {
            slider.show().addClass('active');
        }

        setTimeout(() => {
            $('.welcome-screen').fadeOut(500);
            $('.multicharacter-container').fadeOut(500);
            $('.identity-container').fadeOut(500);
            $('.packs-container').fadeOut(500);
            this.isActive = false;
        }, 900);

        setTimeout(() => {
            if (slider.length > 0) {
                slider.fadeOut(1000, function () {
                    $(this).removeClass('active').hide().css('display', '');
                });
            }
        }, 3000);
    },

    slider: function () {
        this.arrivalTransition();
    },

    slideBars: async function (state, text) {
        if (state == this.isActive || (state && creator.isFinishing)) return
        this.isActive = state
        if (state) this.isInitializing = true

        if (state) {
            this.queue = true
            $('.welcome-screen').css({ display: 'flex' })

            $.post(`https://${GetParentResourceName()}/UIReady`, JSON.stringify({}))

            $('#loader-fill').css({ width: '0%' })
            $('#loader-street').removeClass('visible')
            $('#welcome-ghost').removeClass('visible')
            $('#welcome-user').removeClass('visible')

            if (text) {
                $('#welcome-user').html(text)
            } else {
                $('#welcome-user').html("BIENVENIDO")
            }

            setTimeout(() => {
                $('#welcome-ghost').addClass('visible')
                $('#welcome-user').addClass('visible')
                $('#loader-street').addClass('visible')

                let progress = 0;
                let msgIndex = 0;

                const interval = setInterval(() => {
                    progress += 2;
                    $('#loader-fill').css({ width: progress + '%' })

                    if (progress % 20 === 0 && msgIndex < this.loadingMessages.length) {
                        $('#loader-text').html(this.loadingMessages[msgIndex])
                        msgIndex++
                    }

                    if (progress >= 100) {
                        clearInterval(interval)
                        $('#loader-text').html("¡LISTO!")

                        setTimeout(() => this.triggerTransition(), 800);
                    }
                }, 60)
            }, 500)

        } else if (!state) {
            if (this.queue) {
                await new Promise(r => { const c = () => !this.queue ? r() : setTimeout(c, 100); c(); });
            }
            music.sfx.play()
        }
    }
}

const tooltip = {
    isActive: false,
    show: function (state) {
        if (state == this.isActive) return
        state ? $('.tool-tip-content').css({ opacity: 1 }) : $('.tool-tip-content').css({ opacity: 0 })
        this.isActive = state
    },
    setText: function (data) {
        if (!data) return
        $('.tool-tip-content').find('.header').html('TOOLTIP / ' + data.header)
        $('.tool-tip-content').find('.text').html(data.text)
    }
}

const music = {
    state: 'STOPPED',
    currentVolume: 0.2,
    fadeInterval: false,

    sfx: new Howl({
        src: ['./metadata/sfx.wav'],
        html5: false,
        loop: false,
        autoplay: false,
        volume: .3,
    }),
    FX_ENTRANCE: new Howl({
        src: ['./metadata/FX_ENTRANCE.wav'],
        html5: false,
        loop: false,
        autoplay: false,
        volume: .3,
    }),
    FX_WIND_1: new Howl({
        src: ['./metadata/fx_wind_stage_1.mp3'],
        html5: false,
        loop: false,
        autoplay: false,
        volume: .9,
    }),
    FX_WIND_2: new Howl({
        src: ['./metadata/fx_wind_stage_2.mp3'],
        html5: false,
        loop: false,
        autoplay: false,
        volume: .9,
    }),

    syncPlay: function (startTime) {
        // Music disabled
    },

    fade: function (targetVolume, duration) {
        // Music disabled
    },

    adjustState: async function (state, extra) {
        if (state == 'STOP') {
            this.state = 'STOPPED';
        } else if (state == 'START') {
            $.post(`https://${GetParentResourceName()}/UIReady`, JSON.stringify({}))
        } else if (state == 'VOLUME_DOWN') {
            // Music disabled
        } else if (state == 'VOLUME_UP') {
            // Music disabled
        }
    }
}

const screens = {
    canUse: true,
    current: false,
    transitions: {
        ['char-creator-container']: {
            init: {
                alignment: 'top',
                data: ['100%', '0%']
            },
            final: {
                alignment: 'top',
                data: ['0%', '-100%'],
            },
        },
    },
    showScreen: function (screen, init) {
        if (!this.canUse) return
        this.canUse = false
        if (init) null
        base.setKeydownsUsable(false)
        this.transitions[screen][init ? 'init' : 'final'].alignment == 'left' ? anime({
            targets: '.' + screen,
            left: this.transitions[screen][init ? 'init' : 'final'].data,
            easing: 'cubicBezier(1, 0, 0, 1)',
            duration: 700,
            complete: () => {
                base.setKeydownsUsable(true)
                this.canUse = true
                this.current = init ? screen : false
            }
        }) : anime({
            targets: '.' + screen,
            top: this.transitions[screen][init ? 'init' : 'final'].data,
            easing: 'cubicBezier(1, 0, 0, 1)',
            duration: 700,
            complete: () => {
                this.canUse = true
                this.current = init ? screen : false
            }
        })

        this.transitions[screen][init ? 'init' : 'final'].alignment == 'left' ? anime({
            targets: '.multicharacter-container',
            left: init ? ['0%', '-100%'] : ['-100%', '0%'],
            easing: 'cubicBezier(1, 0, 0, 1)',
            duration: 700,
        }) : anime({
            targets: '.multicharacter-container',
            top: init ? ['0%', '-100%'] : ['-100%', '0%'],
            easing: 'cubicBezier(1, 0, 0, 1)',
            duration: 700,
        })
    },
    updateScreen: function (screen) {
        this.current = screen
    },
}



const cinematics = {
    show: function (state) {
        if (state) {
            $('.cinematic-bar').addClass('active')
        } else {
            $('.cinematic-bar').removeClass('active')
        }
    },
    setText: function (state, text) {
        if (state) {
            const cinematicText = new TextScramble(document.querySelector('.cinematic-user-name'))
            cinematicText.setText(text)
        }
        state ? $('.cinematic-text-box').css({ display: 'flex' }).hide().fadeIn(1200) : $('.cinematic-text-box').fadeOut(2000)
    }
}

const initial = {
    active: false,
    init: function (state, text) {
        if (this.active == state) return
        state && $('.initial-discord-user-name').html(text)
        state ? $('.initial-screen').css({ display: 'flex' }).hide().fadeIn(3000) : $('.initial-screen').fadeOut(3000)
        this.active = state
    },
}

const disconnect = {
    show: function () {
        $('.disconnect-user-screen').css({ display: 'flex' }).hide().fadeIn(300);
    },
    hide: function () {
        $('.disconnect-user-screen').fadeOut(300);
    },
    confirm: function () {
        this.hide();
        this.hide();
        $('#slider-black').show().addClass('active');

        setTimeout(() => {
            $.post(`https://${GetParentResourceName()}/disconnectGame`, JSON.stringify({}));
        }, 900);
    }
}


const creator = {
    isActive: false,
    errorsCount: 5,
    currentYear: Number(new Date().getFullYear()),
    isCheckingNames: false,
    formErrors: {
        firstname: false,
        lastname: false,
        date: false,
        height: false,
        nationality: false,
        gender: false,
    },
    formData: {
        firstname: '',
        lastname: '',
        date: '',
        nationality: false,
        height: 0,
        gender: false,
    },
    isCountriesShown: false,
    show: function (skipTransition) {
        if (this.isActive) return
        this.isActive = true

        base.show(false)

        if (skipTransition) {
            this.prepareCountries()
            $('.identity-container').css({ display: 'flex', opacity: 1 })
            if (window.lucide) { lucide.createIcons(); }
            anime({
                targets: '.form-container',
                translateX: [-50, 0],
                opacity: [0, 1],
                easing: 'easeOutExpo',
                duration: 800
            })
            return;
        }

        $('#slider-black').show().addClass('active');

        setTimeout(() => {
            this.prepareCountries()
            $('.identity-container').css({ display: 'flex', opacity: 1 })
            if (window.lucide) { lucide.createIcons(); }

            anime({
                targets: '.form-container',
                translateX: [-50, 0],
                opacity: [0, 1],
                easing: 'easeOutExpo',
                duration: 800
            })

            anime({
                targets: '.palm-icon',
                scale: [0, 1],
                opacity: [0, 1],
                easing: 'easeOutBack',
                duration: 1000,
                delay: 400
            })

            setTimeout(() => {
                $('#slider-black').removeClass('active').hide();
            }, 2100);
        }, 900);
    },
    hide: function () {
        if (!this.isActive) return
        this.isActive = false

        $('#slider-black').show().addClass('active');

        setTimeout(() => {
            this.isActive = false
            $('.identity-container').hide()

            presents.show(true, this.formData);

            setTimeout(() => {
                $('#slider-black').removeClass('active').hide();
            }, 1200);
        }, 900);
    },
    switchCountries: function () {
        this.isCountriesShown = !this.isCountriesShown
        if (this.isCountriesShown) {
            $('#modal-container').removeClass('hidden').css('display', 'flex')
        } else {
            $('#modal-container').addClass('hidden')
        }
    },
    prepareCountries: function () {
        const list = $('.nationality-countries-list');
        list.empty();
        let countries = ESX.Translations.Countries;
        countries.forEach((country, index) => {
            const isSelected = this.formData['nationality'] === country;

            list.append(`
                <button class="country-btn nationality-country ${isSelected ? 'selected' : ''}" 
                        data-name="${country}">
                    <span class="country-name">${country}</span>
                    ${isSelected ? '<div class="ok-sticker">OK</div>' : ''}
                </button>
            `);
        });
    },
    searchCountries: function (value) {
        let val = value.toLowerCase()
        let elements = $('.nationality-country')
        elements.each(function () {
            var countryText = $(this).text().toLowerCase();
            if (countryText.includes(val)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    },
    handleCountryClick: function (val) {
        const display = $('.selected-country');
        display.html(val).addClass('selected');
        this.formData['nationality'] = val
        this.formErrors['nationality'] = true
        this.updateCreateButtonState()
        this.switchCountries()
        this.prepareCountries()
    },
    handleGenderClick: function (target) {
        if (!target.hasClass('identity-gender')) {
            target = target.closest('.identity-gender');
        }
        this.updateGender($(target).data('type') == 'male')
    },
    clearForm: function () {
        $('.identity-input-text').val('')
        $('.identity-input-date').val('')
        $('.identity-input-number').val('')
        $('.input-progress-bar').css('width', '0%')
        $('.tape-body').removeClass('tape-error')
        $('.tape-end').removeClass('tape-end-error')
        $('.input-label').removeClass('label-error label-focus')
        $('.error-icon').removeClass('flex')
        $('.selected-country').html('SELECCIONAR...').removeClass('selected')
        $('.identity-gender.active').removeClass('active')
        this.formErrors = {
            firstname: false,
            lastname: false,
            date: false,
            height: false,
            nationality: false,
            gender: false
        }
        this.formData = {
            firstname: '',
            lastname: '',
            date: '',
            height: 0,
            gender: false,
            nationality: ''
        }
        this.updateCreateButtonState()
    },
    addNotification: function (text) {
        if (this.notificationAnimeObjIn) this.notificationAnimeObjIn.stop()
        if (this.notificationAnimeObjOut) this.notificationAnimeObjOut.stop()
        $('.identity-notification').html(text)
        this.notificationAnimeObjIn = anime({
            targets: '.identity-notification',
            top: '3vw',
            easing: 'cubicBezier(0.075, 0.82, 0.165, 1)',
            opacity: 1,
            complete: () => {
                this.notificationAnimeObjIn = false
                this.notificationAnimeObjOut = anime({
                    targets: '.identity-notification',
                    top: '-2vw',
                    opacity: 0,
                    easing: 'cubicBezier(0.075, 0.82, 0.165, 1)',
                    delay: 2000,
                    complete: () => { this.notificationAnimeObjOut = false }
                })
            }
        })
    },
    onInput: function (type) {
        var error = false
        if (type == 'firstname' || type == 'lastname') {
            let value = $(`.identity-input-text[data-type="${type}"]`).val()
            let stringArray = value.split('')
            let containsNumber = /\d/.test(value);
            this.formData[type] = value

            error = stringArray.length < 1 || stringArray.length > 15 || containsNumber;

            this.updateValidationUI(type, error)

            if (base.useIdentityDupeCheck && !error) {
                this.checkFullNameWhenReady()
            }
            return
        } else if (type == 'date') {
            let value = $(`.identity-input-date`).val()
            this.formData[type] = value
            let stringArray = value.split('')
            let day, month, year;

            day = Number(stringArray[0] + stringArray[1]);
            month = Number(stringArray[3] + stringArray[4]);
            year = Number(stringArray[6] + stringArray[7] + stringArray[8] + stringArray[9]);

            error = stringArray.length < 10 || (month < 1 || month > 12) || (day < 1 || day > 31) || (year > this.currentYear || year < this.currentYear - 100)
        } else if (type == 'height') {
            let value = $(`.identity-input-number[data-type="height"]`).val()
            let numValue = Number(value)
            this.formData[type] = numValue
            error = value === '' || isNaN(numValue) || numValue < 120 || numValue > 220
        }

        this.updateValidationUI(type, error)
    },

    checkFullNameWhenReady: function () {
        let firstName = this.formData.firstname
        let lastName = this.formData.lastname

        if (firstName && lastName && firstName.length >= 1 && lastName.length >= 1 &&
            firstName.length <= 15 && lastName.length <= 15 &&
            !/\d/.test(firstName) && !/\d/.test(lastName)) {

            this.checkFullNameAvailability(firstName, lastName)
        }
    },

    nameCheckTimeout: null,
    checkFullNameAvailability: function (firstName, lastName) {
        if (this.isCheckingNames) return
        if (this.nameCheckTimeout) {
            clearTimeout(this.nameCheckTimeout)
        }

        this.isCheckingNames = true
        this.updateCreateButtonState()

        this.nameCheckTimeout = setTimeout(() => {
            $(`#group-firstname .tape-body`).css({ opacity: 0.5 })
            $(`#group-lastname .tape-body`).css({ opacity: 0.5 })

            $.post(`https://${GetParentResourceName()}/checkNameAvailability`, JSON.stringify({
                firstName: firstName,
                lastName: lastName
            }), (isAvailable) => {
                setTimeout(() => {
                    $(`#group-firstname .tape-body`).css({ opacity: 1 })
                    $(`#group-lastname .tape-body`).css({ opacity: 1 })

                    this.isCheckingNames = false
                    let hasError = !isAvailable

                    this.formErrors['firstname'] = !hasError
                    this.formErrors['lastname'] = !hasError

                    this.updateValidationUI('firstname', hasError)
                    this.updateValidationUI('lastname', hasError)

                    if (!isAvailable) {
                        this.addNotification('Character name is already taken.')
                    }
                }, 200)
            }).fail(() => {
                this.isCheckingNames = false
                this.formErrors['firstname'] = false
                this.formErrors['lastname'] = false
                this.updateCreateButtonState()
            })
        }, 100)
    },

    updateValidationUI: function (type, error) {
        const htmlId = type == 'date' ? 'birthdate' : type;
        const group = $(`#group-${htmlId}`);
        const label = $(`#label-${htmlId}`);
        const tape = group.find('.tape-body');
        const tapeEnds = group.find('.tape-end');
        const errorIcon = group.find('.error-icon');

        if (error) {
            label.addClass('label-error');
            tape.addClass('tape-error');
            tapeEnds.addClass('tape-end-error');
            errorIcon.addClass('flex');
        } else {
            label.removeClass('label-error');
            tape.removeClass('tape-error');
            tapeEnds.removeClass('tape-end-error');
            errorIcon.removeClass('flex');
        }

        this.formErrors[type] = !error
        this.updateCreateButtonState()
    },

    updateCreateButtonState: function () {
        let haveAllValid = Object.values(this.formErrors).every(value => value === true)
        let shouldEnable = haveAllValid && !this.isCheckingNames

        const btn = $('.identity-create-button');
        if (shouldEnable) {
            btn.prop('disabled', false).addClass('is-active').removeClass('disabled');
            $('#btn-drips, #btn-arrow').removeClass('hidden');
            $('#btn-text').html('CONFIRMAR');
        } else {
            btn.prop('disabled', true).removeClass('is-active').addClass('disabled');
            $('#btn-drips, #btn-arrow').addClass('hidden');
        }
    },
    updateGender: function (male) {
        this.formData['gender'] = male ? 'male' : 'female'

        $('#gender-male, #gender-female').removeClass('active gender-active-male gender-active-female');

        if (male) {
            $('#gender-male').addClass('active gender-active-male');
        } else {
            $('#gender-female').addClass('active gender-active-female');
        }

        this.formErrors['gender'] = true
        this.updateCreateButtonState()

        $.post(`https://${GetParentResourceName()}/updateCharacterGender`, JSON.stringify({
            gender: this.formData['gender']
        }));
    },
    isFinishing: false,
    finishLogin: function () {
        if (this.isFinishing || this.isCheckingNames) return

        let haveAllValid = Object.values(this.formErrors).every(value => value === true)
        if (!haveAllValid) return

        this.isFinishing = true
        this.isActive = false

        let prevFormData = this.formData
        this.formData = {
            firstname: $('.identity-input-text[data-type="firstname"]').val(),
            lastname: $('.identity-input-text[data-type="lastname"]').val(),
            date: ($('.identity-input-date').val()).split(' ').join('').replace(/\//g, ''),
            height: Number($('.identity-input-number[data-type="height"]').val()),
            gender: prevFormData['gender'],
            nationality: prevFormData['nationality'],
        }

        music.sfx.play()

        $('.btn-box').css({
            'border-color': 'var(--color-cyan)',
            'box-shadow': '0 0 30px rgba(0, 243, 255, 0.4), 10px 10px 0px black'
        });
        $('.btn-label').html("GUARDADO").css('color', 'white');
        $('.btn-sub').css('opacity', '0');
        $('.btn-arrow').addClass('hidden');

        $('#slider-black').show().addClass('active');

        setTimeout(() => {
            presents.show(true, this.formData);

            $('.identity-container').hide();

            this.isFinishing = true;
            this.isActive = false;

            this.clearForm();

            $('.btn-box').css({ 'border-color': '', 'box-shadow': '' });
            $('.btn-label').html("CONFIRMAR").css('color', '');
            $('.btn-sub').css('opacity', '');

            setTimeout(() => {
                $('#slider-black').removeClass('active').hide();
            }, 1500);
        }, 900);
    }
}


const characterRemove = {
    isVisible: false,
    show: function (state) {
        if (this.isVisible == state) return
        state ? $('.remove-user-screen').css({ display: 'flex' }).hide().fadeIn() : $('.remove-user-screen').fadeOut()
        this.isVisible = state

        if (!state && Object.values(base.characters).length === 0) {
            base.show(false);
        }
    }
}

$(document).on('focus', '.identity-input-text, .identity-input-date, .identity-input-number', function () {
    const type = $(this).data('type') || (this.id === 'birthdate' ? 'birthdate' : '');
    const htmlId = type == 'birthdate' || type == 'date' ? 'birthdate' : type;
    const label = $(`#label-${htmlId}`);
    if (!label.hasClass('label-error')) {
        label.addClass('label-focus');
    }
});

$(document).on('blur', '.identity-input-text, .identity-input-date, .identity-input-number', function () {
    const type = $(this).data('type') || (this.id === 'birthdate' ? 'birthdate' : '');
    const htmlId = type == 'birthdate' || type == 'date' ? 'birthdate' : type;
    $(`#label-${htmlId}`).removeClass('label-focus');
});

$(document).on('input', '.identity-input-number', function (e) {
    const val = e.target.value.replace(/\D/g, '');
    e.target.value = val;
    if ($(this).attr('id') === 'height' || $(this).data('type') === 'height') {
        creator.onInput('height');
    }
});

$(document).on('input', '#birthdate', function (e) {
    let val = e.target.value.replace(/\D/g, '');
    if (val.length > 8) val = val.slice(0, 8);

    let formatted = '';
    if (val.length > 0) formatted += val.substring(0, 2);
    if (val.length > 2) formatted += '/' + val.substring(2, 4);
    if (val.length > 4) formatted += '/' + val.substring(4, 8);

    e.target.value = formatted;

    if (formatted.length >= 10 || val.length >= 8) {
        creator.onInput('date');
    }
});

$(document).on('click', '.identity-create-button', function () {
    creator.finishLogin();
});
const presents = {
    active: false,
    packs: [],
    identityData: {},

    show: function (state, identity) {
        if (this.active == state) return;
        this.active = state;
        this.identityData = identity || {};

        if (state) {
            $('.packs-container').css({ display: 'flex', opacity: 1 }).show();
            this.render();
            if (window.lucide) { lucide.createIcons(); }
        } else {
            $('.packs-container').fadeOut(500);
        }
    },

    setData: function (data) {
        this.packs = data;
    },

    render: function () {
        const list = $('.packs-list');
        list.empty();

        let hoverTimeout = null;
        let isSelectingPack = false;

        this.packs.forEach((pack, index) => {
            let itemsHtml = '';
            pack.items.forEach(item => {
                itemsHtml += `
                    <div class="pack-item">
                        ${item.label} <span>x${item.amount}</span>
                    </div>
                `;
            });

            list.append(`
                <div class="pack-card" data-id="${pack.id}" style="animation: slideDown 0.5s var(--ease-out-expo) forwards; animation-delay: ${index * 0.1}s">
                    <div class="card-noise bg-noise"></div>
                    <div class="pack-icon-wrapper">
                        <i data-lucide="${pack.icon}" width="40" height="40"></i>
                    </div>
                    <div class="pack-name">${pack.name}</div>
                    <div class="pack-description">${pack.description}</div>
                    <div class="pack-items-list">
                        ${itemsHtml}
                    </div>
                    <div class="pack-money">
                        <i data-lucide="circle-dollar-sign"></i>
                        $${pack.money.toLocaleString()}
                    </div>
                </div>
            `);
        });

        $('.pack-card').off('mouseenter').on('mouseenter', function () {
            if (isSelectingPack) return;
            const packId = $(this).data('id');
            const pack = presents.packs.find(p => p.id === packId);

            if (pack && pack.vehicle) {
                if (hoverTimeout) clearTimeout(hoverTimeout);

                hoverTimeout = setTimeout(() => {
                    $.post(`https://${GetParentResourceName()}/previewVehicle`, JSON.stringify({
                        model: pack.vehicle,
                        isFinal: false
                    }));
                    $('#vehicle-tag .tag-text').text(`TU ${pack.vehicle.toUpperCase()}`);
                }, 400);
            }
        });

        $('.pack-card').off('mouseleave').on('mouseleave', function () {
            if (isSelectingPack) return;
            if (hoverTimeout) clearTimeout(hoverTimeout);

            $.post(`https://${GetParentResourceName()}/previewVehicle`, JSON.stringify({
                model: null,
                isFinal: false
            }));
        });

        $('.pack-card').off('click').on('click', function () {
            if (isSelectingPack) return;
            isSelectingPack = true;

            const packId = $(this).data('id');
            music.sfx.play();

            $('.pack-card').removeClass('active');
            $(this).addClass('active');

            const pack = presents.packs.find(p => p.id === packId);
            if (pack && pack.vehicle) {
                if (hoverTimeout) clearTimeout(hoverTimeout);

                $.post(`https://${GetParentResourceName()}/previewVehicle`, JSON.stringify({
                    model: pack.vehicle,
                    isFinal: true
                }));
                $('#vehicle-tag .tag-text').text(`ESTE ES TU ${pack.vehicle.toUpperCase()}`);
            }

            setTimeout(() => {
                $('#slider-black').show().addClass('active');

                setTimeout(() => {
                    const identityToSend = presents.identityData;
                    presents.show(false);
                    if (typeof base !== 'undefined') base.show(false);

                    $.post(`https://${GetParentResourceName()}/selectedPack`, JSON.stringify({
                        identity: identityToSend,
                        packId: packId
                    }));
                }, 900);

                setTimeout(() => {
                    $('#slider-black').removeClass('active').hide();
                }, 3000);
            }, 300);
        });

        if (window.lucide) { lucide.createIcons(); }
    }
}

const vehicleTag = {
    show: function (state) {
        state ? $('.vehicle-tag-container').fadeIn(300) : $('.vehicle-tag-container').fadeOut(300);
    },
    update: function (x, y, state) {
        if (state) {
            $('#vehicle-tag').css({
                left: x + '%',
                top: y + '%',
                display: 'flex'
            });
        } else {
            $('#vehicle-tag').hide();
        }
    }
}


const admin = {
    isActive: false,
    selectedUser: null,
    currentTab: 'users',
    packs: [],
    globalSettings: {},
    searchTimeout: null,
    icons: [
        'package', 'car', 'briefcase', 'gift', 'heart', 'star', 'shield', 'sword',
        'container', 'shopping-cart', 'credit-card', 'dollar-sign', 'user', 'map-pin',
        'key', 'pen-tool', 'wrench', 'gem', 'camera', 'phone', 'music', 'coffee', 'pizza',
        'apple', 'beer', 'glass-water', 'pill', 'bandage', 'syringe', 'dna',
        'hammer', 'axe', 'pickaxe', 'shovel', 'flame', 'tent', 'compass',
        'box', 'move', 'layers', 'maximize', 'layout', 'grid', 'list',
        'zap', 'flame', 'droplet', 'wind', 'snowflake', 'sun', 'moon', 'cloud',
        'fish', 'bone', 'dog', 'cat', 'bird', 'bug', 'leaf', 'tree-pine'
    ],

    show: function (state) {
        if (state) {
            $('.admin-panel-container').css({ display: 'flex' }).hide().fadeIn(300);
            $('.bg-layer').show();
            this.switchTab('users');
            this.fetchConfig();
            this.search();
        } else {
            $('.admin-panel-container').fadeOut(300, function () {
                $('.bg-layer').hide();
            });
            $.post(`https://${GetParentResourceName()}/closeAdmin`, JSON.stringify({}));
        }
        this.isActive = state;
    },

    switchTab: function (tab) {
        this.currentTab = tab;
        $('.nav-item').removeClass('active');
        $(`.nav-item[data-tab="${tab}"]`).addClass('active');

        $('.admin-tab-content').removeClass('active').hide();
        $(`#tab-${tab}`).addClass('active').show();

        // Header title updates
        const titles = {
            users: ['GESTIÓN DE CUENTAS', 'ADMINISTRACIÓN', 'DE USUARIOS'],
            packs: ['KITS INICIALES', 'PAQUETES', 'BIENVENIDA'],
            global: ['SISTEMA INTERNO', 'AJUSTES', 'GLOBALES']
        };

        $('.admin-sub').text(titles[tab][0]);
        $('.admin-title').html(`${titles[tab][1]} <br /><span>${titles[tab][2]}</span>`);

        // Search bar visibility
        if (tab === 'users') {
            $('#admin-search-wrapper').css({ opacity: 1, pointerEvents: 'all' });
        } else {
            $('#admin-search-wrapper').css({ opacity: 0, pointerEvents: 'none' });
        }

        if (tab === 'packs') this.renderPacks();
        if (tab === 'global') this.renderGlobalSettings();
    },

    fetchConfig: function () {
        $.post(`https://${GetParentResourceName()}/getAdminConfig`, JSON.stringify({}), (data) => {
            this.packs = data.packs;
            this.globalSettings = data.global;
        });
    },

    search: function () {
        const query = $('#admin-search-input').val();
        if (query.length > 0 && query.length < 2) return;

        $.post(`https://${GetParentResourceName()}/searchUsers`, JSON.stringify({ query: query }), (results) => {
            this.populateUsers(results);
        });
    },

    // ... (populateUsers, selectUser, fetchCharacters, updateSlots remain similar but adjusted if needed)
    // For brevity, I'll keep the existing ones and add the new ones below.
    // I will use replace_file_content to insert the new methods.

    setData: function (type, data) {
        if (type === 'packs') {
            this.packs = data;
            if (this.isActive && this.currentTab === 'packs') {
                // If we are not editing a pack detail, or if we want to force refresh the list
                this.renderPacks();
            }
        } else if (type === 'global') {
            this.globalSettings = data;
            if (this.isActive && this.currentTab === 'global') {
                this.renderGlobalSettings();
            }
        }
    },

    renderPacks: function () {
        const list = $('.admin-packs-list-panel');
        list.empty();

        this.packs.forEach((p, index) => {
            const el = $(`
                <div class="user-item pack-item" data-index="${index}">
                    <div class="user-item-info">
                        <span class="u-name">${p.name}</span>
                        <span class="u-license">${p.vehicle.toUpperCase()} - ${p.items.length} OBJETOS</span>
                    </div>
                    <div class="user-item-status">
                         <i data-lucide="${p.icon || 'package'}" style="width:24px; color:var(--midnight-accent)"></i>
                    </div>
                </div>
            `);

            el.click(() => {
                $('.pack-item').removeClass('active');
                el.addClass('active');
                this.renderPackEditor(index);
            });

            list.append(el);
        });
        if (window.lucide) lucide.createIcons();
    },

    renderPackEditor: function (index) {
        const pack = this.packs[index];
        const container = $('.pack-editor-content');
        $('.admin-pack-editor-panel .details-placeholders').hide();
        container.empty().show();

        container.append(`
            <div class="editor-row">
                <div class="editor-group">
                    <label class="editor-label">NOMBRE DEL PAQUETE</label>
                    <input type="text" class="editor-input" id="edit-pack-name" value="${pack.name}">
                </div>
                <div class="editor-group">
                    <label class="editor-label">ICONO (LUCIDE)</label>
                    <div class="input-with-action">
                        <input type="text" class="editor-input" id="edit-pack-icon" value="${pack.icon}">
                        <button class="btn-picker-trigger" id="btn-pick-icon"><i data-lucide="search"></i></button>
                    </div>
                </div>
            </div>
            
            <div class="editor-group">
                <label class="editor-label">DESCRIPCIÓN</label>
                <textarea class="editor-input" id="edit-pack-desc" style="height: 80px; resize: none;">${pack.description}</textarea>
            </div>

            <div class="editor-row">
                <div class="editor-group">
                    <label class="editor-label">MODELO VEHÍCULO</label>
                    <input type="text" class="editor-input" id="edit-pack-vehicle" value="${pack.vehicle}">
                </div>
                <div class="editor-group">
                    <label class="editor-label">DINERO INICIAL ($)</label>
                    <input type="number" class="editor-input" id="edit-pack-money" value="${pack.money}">
                </div>
            </div>

            <label class="editor-label">OBJETOS INICIALES (MÁX 3 VISIBLES, LUEGO SCROLL)</label>
            <div class="pack-items-editor custom-scrollbar">
                <!-- Items list dynamic -->
            </div>
            <button class="btn-add-item" id="btn-add-item-pack"><i data-lucide="plus" style="width:14px; vertical-align:middle; margin-right:5px"></i> AÑADIR OBJETO</button>

            <button class="btn-admin-save-large" id="btn-save-pack" style="width:100%; margin-top:2rem">GUARDAR CAMBIOS EN PAQUETE</button>
        `);

        // Render items
        const itemsList = container.find('.pack-items-editor');
        const renderItems = () => {
            itemsList.empty();
            pack.items.forEach((item, i) => {
                const row = $(`
                    <div class="pack-item-row" data-index="${i}">
                        <input type="text" class="editor-input item-name" style="flex:2" placeholder="Item Name" value="${item.name}">
                        <input type="text" class="editor-input item-label" style="flex:2" placeholder="Label" value="${item.label}">
                        <input type="number" class="editor-input item-amount" style="flex:1" value="${item.amount}">
                        <button class="btn-remove-item"><i data-lucide="trash-2"></i></button>
                    </div>
                `);

                row.find('input').on('input', function () {
                    const idx = $(this).closest('.pack-item-row').data('index');
                    if ($(this).hasClass('item-name')) pack.items[idx].name = $(this).val();
                    if ($(this).hasClass('item-label')) pack.items[idx].label = $(this).val();
                    if ($(this).hasClass('item-amount')) pack.items[idx].amount = parseInt($(this).val()) || 0;
                });

                row.find('.btn-remove-item').click(function () {
                    pack.items.splice(i, 1);
                    renderItems();
                });

                itemsList.append(row);
            });
            if (window.lucide) lucide.createIcons();
        };

        renderItems();

        $('#btn-add-item-pack').click(() => {
            pack.items.push({ name: 'bread', label: 'Pan', amount: 1 });
            renderItems();
            // Auto scroll to bottom
            itemsList.animate({ scrollTop: itemsList[0].scrollHeight }, 300);
        });

        $('#btn-pick-icon').click(function (e) {
            e.stopPropagation();
            admin.renderIconPicker($(this));
        });

        $('#btn-save-pack').click(() => this.savePack(index));
    },

    renderIconPicker: function (trigger) {
        const picker = $('#admin-icon-picker');
        const grid = $('#icons-grid');
        const search = $('#icon-search-input');

        grid.empty();
        search.val('');

        const renderIcons = (filter = '') => {
            grid.empty();
            const filtered = this.icons.filter(i => i.includes(filter.toLowerCase()));

            filtered.forEach(iconName => {
                const item = $(`
                    <div class="icon-grid-item" title="${iconName}">
                        <i data-lucide="${iconName}"></i>
                    </div>
                `);

                item.click(() => {
                    $('#edit-pack-icon').val(iconName);
                    picker.addClass('hidden');
                    if (window.lucide) lucide.createIcons();
                });

                grid.append(item);
            });
            if (window.lucide) lucide.createIcons();
        };

        renderIcons();

        // Position picker
        const offset = trigger.offset();
        picker.css({
            top: offset.top - picker.outerHeight() - 10,
            left: offset.left - picker.outerWidth() + trigger.outerWidth()
        }).removeClass('hidden');

        search.off('input').on('input', function () {
            renderIcons($(this).val());
        });

        // Close on outside click
        $(document).one('click', function (e) {
            if (!$(e.target).closest('#admin-icon-picker').length) {
                picker.addClass('hidden');
            }
        });
    },

    savePack: function (index) {
        const pack = this.packs[index];
        pack.name = $('#edit-pack-name').val();
        pack.icon = $('#edit-pack-icon').val();
        pack.description = $('#edit-pack-desc').val();
        pack.vehicle = $('#edit-pack-vehicle').val();
        pack.money = parseInt($('#edit-pack-money').val()) || 0;

        $.post(`https://${GetParentResourceName()}/saveAdminPacks`, JSON.stringify({ packs: this.packs }), (status) => {
            $('#btn-save-pack').addClass('saved');
            setTimeout(() => $('#btn-save-pack').removeClass('saved'), 1500);
        });
        this.renderPacks();
    },

    renderGlobalSettings: function () {
        const grid = $('.global-settings-grid');
        grid.empty();
        const s = this.globalSettings;

        grid.append(`
            <div class="settings-card">
                <h3><i data-lucide="map-pin"></i> RECLAMO VEHÍCULO</h3>
                
                <div class="coord-group">
                    <div class="coord-header">
                        <label>PUNTO DE RECLAMO (INTERACCIÓN)</label>
                        <button class="btn-get-coords" data-target="claim"><i data-lucide="map-pin"></i> MI POSICIÓN</button>
                    </div>
                    <div class="coord-inputs">
                        <div class="coord-input-wrapper">
                            <span class="coord-input-label">EJE X</span>
                            <input type="number" step="0.01" class="editor-input coord-x" placeholder="0.00" value="${s.claimPoint[0]}">
                        </div>
                        <div class="coord-input-wrapper">
                            <span class="coord-input-label">EJE Y</span>
                            <input type="number" step="0.01" class="editor-input coord-y" placeholder="0.00" value="${s.claimPoint[1]}">
                        </div>
                        <div class="coord-input-wrapper">
                            <span class="coord-input-label">EJE Z</span>
                            <input type="number" step="0.01" class="editor-input coord-z" placeholder="0.00" value="${s.claimPoint[2]}">
                        </div>
                    </div>
                </div>

                <div class="coord-group">
                    <div class="coord-header">
                        <label>APARICIÓN VEHÍCULO (SPAWN)</label>
                        <button class="btn-get-coords" data-target="spawn"><i data-lucide="map-pin"></i> MI POSICIÓN</button>
                    </div>
                    <div class="coord-inputs">
                        <div class="coord-input-wrapper">
                            <span class="coord-input-label">X</span>
                            <input type="number" step="0.01" class="editor-input spawn-x" placeholder="X" value="${s.spawnPoint[0]}">
                        </div>
                        <div class="coord-input-wrapper">
                            <span class="coord-input-label">Y</span>
                            <input type="number" step="0.01" class="editor-input spawn-y" placeholder="Y" value="${s.spawnPoint[1]}">
                        </div>
                        <div class="coord-input-wrapper">
                            <span class="coord-input-label">Z</span>
                            <input type="number" step="0.01" class="editor-input spawn-z" placeholder="Z" value="${s.spawnPoint[2]}">
                        </div>
                        <div class="coord-input-wrapper">
                            <span class="coord-input-label">H</span>
                            <input type="number" step="0.01" class="editor-input spawn-h" placeholder="H" value="${s.spawnPoint[3]}">
                        </div>
                    </div>
                </div>

                <button class="btn-admin-save-large" id="btn-save-global" style="margin-top:auto">GUARDAR AJUSTES</button>
            </div>

            <div class="settings-card">
                 <h3><i data-lucide="languages"></i> TEXTOS E IDIOMA</h3>
                 <div class="editor-group">
                    <label class="editor-label">ETIQUETA RECLAMO (Holograma)</label>
                    <input type="text" class="editor-input" id="set-label-claim" value="${s.labelClaim}">
                 </div>
                 <div class="editor-group">
                    <label class="editor-label">ETIQUETA CONFIRMAR [E]</label>
                    <input type="text" class="editor-input" id="set-label-confirm" value="${s.labelConfirm}">
                 </div>
                 <div class="coord-group" style="margin-top: auto;">
                    <label>MENSAJE BIENVENIDA (MODAL)</label>
                     <input type="text" class="editor-input" id="set-inst-title" style="margin-bottom:0.8rem" value="${s.instructions.title}">
                     <textarea class="editor-input" id="set-inst-desc" style="height:100px; resize:none">${s.instructions.desc}</textarea>
                 </div>
            </div>
        `);

        if (window.lucide) lucide.createIcons();

        $('.btn-get-coords').click(function () {
            const target = $(this).data('target');
            const card = $(this).closest('.settings-card');

            $.post(`https://${GetParentResourceName()}/getCurrentCoords`, JSON.stringify({}), (c) => {
                if (target === 'claim') {
                    card.find('.coord-x').val(c.x.toFixed(4));
                    card.find('.coord-y').val(c.y.toFixed(4));
                    card.find('.coord-z').val(c.z.toFixed(4));
                } else {
                    card.find('.spawn-x').val(c.x.toFixed(4));
                    card.find('.spawn-y').val(c.y.toFixed(4));
                    card.find('.spawn-z').val(c.z.toFixed(4));
                    card.find('.spawn-h').val(c.h.toFixed(2));
                }
            });
        });

        $('#btn-save-global').click(() => {
            const cardPacks = $('.settings-card').eq(0);
            const cardText = $('.settings-card').eq(1);

            const updatedSettings = {
                claimPoint: [
                    parseFloat(cardPacks.find('.coord-x').val()) || 0,
                    parseFloat(cardPacks.find('.coord-y').val()) || 0,
                    parseFloat(cardPacks.find('.coord-z').val()) || 0
                ],
                spawnPoint: [
                    parseFloat(cardPacks.find('.spawn-x').val()) || 0,
                    parseFloat(cardPacks.find('.spawn-y').val()) || 0,
                    parseFloat(cardPacks.find('.spawn-z').val()) || 0,
                    parseFloat(cardPacks.find('.spawn-h').val()) || 0
                ],
                labelClaim: cardText.find('#set-label-claim').val() || "RECLAMA TU VEHÍCULO AQUÍ",
                labelConfirm: cardText.find('#set-label-confirm').val() || "PRESIONA [E] PARA RECLAMAR VEHÍCULO",
                labelOwned: this.globalSettings.labelOwned || "ESTE ES TU VEHÍCULO",
                instructions: {
                    title: cardText.find('#set-inst-title').val() || "BIENVENIDO A MIDNIGHT",
                    desc: cardText.find('#set-inst-desc').val() || ""
                }
            };

            this.globalSettings = updatedSettings;
            $.post(`https://${GetParentResourceName()}/saveAdminGlobal`, JSON.stringify({ global: updatedSettings }), (status) => {
                // If the user wants feedback, we could add a temporary glow to the button
                $('#btn-save-global').addClass('saved');
                setTimeout(() => $('#btn-save-global').removeClass('saved'), 1500);
            });
        });
    },

    populateUsers: function (users) {
        const list = $('.admin-users-list');
        list.empty();

        if (!users || users.length === 0) {
            list.html('<div style="padding:1rem; color:rgba(255,255,255,0.5); text-align:center;">NO SE ENCONTRARON USUARIOS<br><br><span style="font-size:0.8rem">Busca por nombre o licencia para encontrar usuarios OFFLINE.</span></div>');
            return;
        }

        users.forEach(u => {
            const statusClass = u.online ? 'temp-online' : 'temp-offline';
            const statusText = u.online ? 'ONLINE' : 'OFFLINE';

            let subInfo = u.identifier;
            if (u.discord_name) subInfo = `<i data-lucide="disc" style="width:12px; vertical-align:middle"></i> ${u.discord_name}`;
            else if (u.steam_name) subInfo = `<i data-lucide="gamepad-2" style="width:12px; vertical-align:middle"></i> ${u.steam_name}`;
            else if (u.discord_id) subInfo = `<i data-lucide="disc" style="width:12px; vertical-align:middle"></i> ${u.discord_id}`;

            const el = $(`
                <div class="user-item" data-identifier="${u.identifier}">
                    <div class="user-item-info">
                        <span class="u-name">${u.firstname} ${u.lastname}</span>
                        <span class="u-license" style="font-size:0.75rem; opacity:0.7">${subInfo}</span>
                    </div>
                    <div class="user-item-status">
                        <span class="u-status ${statusClass}">${statusText}</span>
                    </div>
                </div>
            `);

            el.click(() => {
                $('.user-item').removeClass('active');
                el.addClass('active');
                this.selectUser(u);
            });

            list.append(el);
        });
        if (window.lucide) lucide.createIcons();
    },

    selectUser: function (user) {
        this.selectedUser = user;
        $('.admin-details-panel .details-placeholders').hide();
        $('.details-content').fadeIn(200);

        $('.user-name-display').text(`${user.firstname} ${user.lastname}`);

        let detailInfo = `ID: ${user.identifier}`;
        if (user.discord_name) detailInfo += `<br><i data-lucide="disc" style="width:14px"></i> ${user.discord_name}`;
        if (user.steam_name) detailInfo += `<br><i data-lucide="gamepad-2" style="width:14px"></i> ${user.steam_name}`;
        if (user.discord_id && !user.discord_name) detailInfo += `<br><i data-lucide="disc" style="width:14px"></i> ${user.discord_id}`;

        $('.user-identifier-display').html(detailInfo);
        $('.user-status-display').text(user.online ? 'ONLINE' : 'OFFLINE').css('color', user.online ? '#2ed573' : '#a4b0be');

        $('#admin-slots-input').val(user.slots);

        if (window.lucide) lucide.createIcons();
        this.fetchCharacters(user.identifier);
    },

    fetchCharacters: function (identifier) {
        $.post(`https://${GetParentResourceName()}/getUserCharacters`, JSON.stringify({ identifier: identifier }), (chars) => {
            const list = $('.user-characters-list');
            list.empty();

            if (!chars || chars.length === 0) {
                list.html('<div style="opacity:0.5; padding:0.5rem;">SIN PERSONAJES CREADOS</div>');
                return;
            }

            chars.forEach(c => {
                const charEl = $(`
                    <div class="admin-char-item">
                        <div class="char-info-block">
                            <span class="char-slot-pill">SLOT ${c.id}</span>
                            <span class="char-main-name">${c.firstname} ${c.lastname}</span>
                            <span class="char-job-info">${c.job} - ${c.grade}</span>
                        </div>
                        <button class="delete-char-btn" title="Borrar Personaje"><i data-lucide="trash-2"></i></button>
                    </div>
                `);

                charEl.find('.delete-char-btn').click((e) => {
                    e.stopPropagation();
                    $.post(`https://${GetParentResourceName()}/deleteCharAdmin`, JSON.stringify({ charId: c.identifier }));
                    charEl.fadeOut(500, function () { $(this).remove(); });
                });

                list.append(charEl);
            });

            if (window.lucide) lucide.createIcons();
        });
    },

    updateSlots: function () {
        if (!this.selectedUser) return;
        const slots = $('#admin-slots-input').val();
        $.post(`https://${GetParentResourceName()}/updateSlots`, JSON.stringify({
            identifier: this.selectedUser.identifier,
            slots: slots
        }));
    },

    initListeners: function () {
        // Tab switching
        $('.nav-item').click(function () {
            const tab = $(this).data('tab');
            admin.switchTab(tab);
        });

        $('#admin-search-btn').click(() => this.search());
        $('#admin-search-input').on('tab', (e) => e.preventDefault());
        $('#admin-search-input').on('input', () => {
            if (this.searchTimeout) clearTimeout(this.searchTimeout);
            this.searchTimeout = setTimeout(() => {
                this.search();
            }, 500);
        });

        $('#admin-close-btn').off('click').on('click', () => this.show(false));

        $('.slot-btn-minus').off('click').on('click', () => {
            let v = parseInt($('#admin-slots-input').val()) || 1;
            if (v > 1) $('#admin-slots-input').val(v - 1);
        });

        $('.slot-btn-plus').off('click').on('click', () => {
            let v = parseInt($('#admin-slots-input').val()) || 1;
            if (v < 10) $('#admin-slots-input').val(v + 1);
        });

        $('.slot-btn-save').off('click').on('click', () => this.updateSlots());
    }
}

$(document).ready(function () {
    admin.initListeners();
});
