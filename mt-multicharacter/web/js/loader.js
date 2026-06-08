/**
 * Initialization and event handling for the multicharacter UI.
 */
$(() => {
    /** Initialize country selection for identity creator */
    creator.prepareCountries()

    /** Signal resource readiness and trigger initial NUI setup */
    $.post(`https://${GetParentResourceName()}/music_ready`, JSON.stringify({}))
    $.post(`https://${GetParentResourceName()}/createdUIFrame`, JSON.stringify({}))
    $.post(`https://${GetParentResourceName()}/nuidone`, JSON.stringify({}))

    /** Initialize data tables or common utilities */
    $.datable('init');

    /** Handle music seeking through the progress bar */
    $('.player-progress').click(function (event) {
        let width = $(this).width();
        let pointX = event.pageX - $(this).offset().left;
        let percentage = (pointX / width);
        music.seek(percentage)
    })

    /** 
     * Handle character selection or creation clicks 
     */
    $(document).on('click', '.character', function (e) {
        const char = $(this);
        if (char.hasClass('character-new')) {
            base.createNewCharacter(char.data('key'))
        } else {
            const key = Number(char.data('key'));
            $.post(`https://${GetParentResourceName()}/swapEntity`, JSON.stringify({
                key: key
            }))
            base.updateEntity(base.getCharacterData(key), key);
        }
    })

    /** 
     * Tooltip hover listeners
     */
    $('.tool-tip').on('mouseenter', e => {
        let content = $(e.target).closest('.tool-tip').data('content')
        tooltip.setText(ESX.Translations.ToolTip[content])
        tooltip.show(true)
    })

    $('.tool-tip').on('mouseleave', e => {
        tooltip.show(false)
    })

    /** 
     * Main play/select character button 
     */
    $('.play-button').click(e => {
        base.selectCharacter()
    })

    /** 
     * Identity creator gender selection
     */
    $(document).on('click', '.identity-gender', function() {
        creator.handleGenderClick($(this))
        $('.selected-gender').html($(this).data('type') == 'male' ? 'Male' : 'Female')
    })

    /** 
     * Input focus and blur visual handling
     */
    $(document).on('focus', '.identity-input-text, .identity-input-number', e => {
        $(e.target).closest('.input-text').addClass('active')
    })

    $(document).on('blur', '.identity-input-text, .identity-input-number', e => {
        if ($(e.target).val() != '') {
            return creator.onInput($(e.target).data('type'))
        }
        $(e.target).closest('.input-text').removeClass('active')
    })

    let typingTimer

    /** 
     * Handle progress bar for character name inputs 
     */
    $(document).on('input', '.identity-input-text', e => {
        const inputType = $(e.target).data('type');
        if (inputType === 'firstname' || inputType === 'lastname') {
            const valLen = e.target.value.length;
            const progress = (valLen / 15) * 100;

            anime({
                targets: `#group-${inputType} .input-progress-bar`,
                width: `${progress}%`,
                duration: 400,
                easing: 'easeOutQuad'
            });
        }
    });

    /** 
     * Debounced input handling for identity data 
     */
    $(document).on('keyup', '.identity-input-text', e => {
        const inputType = $(e.target).data('type');
        clearTimeout(typingTimer);
        typingTimer = setTimeout(() => { creator.onInput(inputType) }, 850);
    });

    $(document).on('keyup', '.identity-input-number, .identity-input-date', e => {
        const inputType = $(e.target).data('type');
        clearTimeout(typingTimer);
        typingTimer = setTimeout(() => { creator.onInput(inputType) }, 850);
    });

    $(document).on('keydown', '.identity-input-number, .identity-input-text, .identity-input-date', e => {
        clearTimeout(typingTimer);
    });

    /** 
     * Final identity creation step 
     */
    $(document).on('click', '.identity-create-button', e => {
        if ($(e.target).hasClass('disabled')) return
        creator.finishLogin()
    })

    /** 
     * External Discord link handler with robustness and UI feedback 
     */
    $(document).on('click', '.new-web-content-handler', function () {
        let url = $(this).attr('data-url');

        if (url && url !== "" && url !== "undefined") {
            if (typeof infoText !== 'undefined') {
                infoText.show(true, "ABRIENDO ENLACE...");
                setTimeout(() => infoText.show(false), 3000);
            }

            window.invokeNative('openUrl', url);
            window.open(url, '_blank');

            $.post(`https://${GetParentResourceName()}/openUrl`, JSON.stringify({ url: url }));
        } else {
            if (typeof infoText !== 'undefined') {
                infoText.show(true, "URL NO CONFIGURADA");
                setTimeout(() => infoText.show(false), 3000);
            }
        }
    });

    /** 
     * Nationality search and selection handlers 
     */
    $(document).on('input change', '.identity-nationality-input-text', e => {
        creator.searchCountries($(e.target).val())
    })

    $(document).on('click', '.select-nationality-button', e => {
        creator.switchCountries()
    })

    $(document).on('click', '.nationality-country', function () {
        creator.handleCountryClick($(this).data('name'))
    })

    /** 
     * Character removal confirmation toggle 
     */
    $(document).on('click', '.remove-content-button', e => {
        characterRemove.show(true)
    })

    /** 
     * Final character removal execution 
     */
    $(document).on('click', '.button-remove-character', function (e) {
        let btn = $(this);
        let remove = btn.data('type') == 'remove';
        if (remove) {
            $.post(`https://${GetParentResourceName()}/removeCharacter`, JSON.stringify({
                id: base.currentCharacterId
            }));
        }
        characterRemove.show(false);
    });
})

