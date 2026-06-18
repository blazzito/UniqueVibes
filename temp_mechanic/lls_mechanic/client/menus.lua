--[[


    Do NOT CHANGE any of the code in this file,
    
    if you do so, do it on your own risk and no support will be given


]]

Config = Config or {}

Config.Menus = {
    ['empty'] = {
        title = '',
        options = {},
    },
    ['main'] = {
        title = '',
        options = {
            {label = 'Reparar', img = 'img/icons/repair.png', price = Config.VehicleRepairPrice, onSelect = function() repairtVehicle(customVehicle) end},
            {label = 'Visual', img = 'img/icons/visual.png', openSubMenu = 'visual'},
            {label = 'Mejoras', img = 'img/icons/upgrade.png', openSubMenu = 'upgrade'},
            {label = 'Confirmar Tuneo', img = 'img/icons/check.png', onSelect = function() confirmUI() end}
        },
        onBack = function() closeUI(1, 1) end,
        defaultOption = 1
    },
        ['upgrade'] = {
            title = 'MEJORAS',
            options = {
                {label = 'Motor', img = 'img/icons/engine.png', modType = 11, priceMult = Config.VehicleCustomisePriceMultiplier['engine']},
                {label = 'Frenos', img = 'img/icons/brakes.png', modType = 12, priceMult = Config.VehicleCustomisePriceMultiplier['brakes']},
                {label = 'Transmisión', img = 'img/icons/transmission.png', modType = 13, priceMult = Config.VehicleCustomisePriceMultiplier['transmission']},
                {label = 'Suspensión', img = 'img/icons/suspension.png', modType = 15, priceMult = Config.VehicleCustomisePriceMultiplier['suspension']},
                {label = 'Armadura', img = 'img/icons/armor.png', modType = 16, priceMult = Config.VehicleCustomisePriceMultiplier['armor']},
                {label = 'Turbo', img = 'img/icons/engine.png', modType = 18, priceMult = Config.VehicleCustomisePriceMultiplier['turbo']},
            },
            onBack = function() updateMenu('main') end
        },
        ['visual'] = {
            title = 'VISUALES',
            options = {
                {label = 'Parte del cuerpo', img = 'img/icons/body.png', openSubMenu = 'body_parts'},
                {label = 'Parte interior', img = 'img/icons/body.png', openSubMenu = 'inside_parts'},
                {label = 'Pintura', img = 'img/icons/respray.png', openSubMenu = 'respray'},
                {label = 'LLantas', img = 'img/icons/wheel.png', openSubMenu = 'wheels', onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'wheel_lf', {x = -1.8, y = 0.0, z = 0.0}, {x = 0.0, y = 0.0, z = -20.0})
                end},
                {label = 'Placa', img = 'img/icons/plate.png', openSubMenu = 'plate'},
                {label = 'Luces', img = 'img/icons/headlights.png', openSubMenu = 'lights'},
                {label = 'Sticker', img = 'img/icons/respray.png', openSubMenu = 'stickers'},
                {label = 'Extra', img = 'img/icons/plus.png', modType = 'extras', priceMult = Config.VehicleCustomisePriceMultiplier['extras']},
                {label = 'Vidrios polarizados', img = 'img/icons/door.png', modType = 'windowTint', priceMult = Config.VehicleCustomisePriceMultiplier['windowTint'], onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'window_lf', {x = -2.0, y = 0.0, z = 0.0}, {x = 0.0, y = 0.0, z = -10.0})
                end, onSubBack = function()
                    SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                end},
                {label = 'Bocina', img = 'img/icons/horn.png', modType = 14, priceMult = Config.VehicleCustomisePriceMultiplier['horn']},
                {label = 'Altavoces', img = 'img/icons/speaker.png', modType = 36, priceMult = Config.VehicleCustomisePriceMultiplier['speakers']},
                {label = 'Baúl', img = 'img/icons/trunk.png', modType = 37, priceMult = Config.VehicleCustomisePriceMultiplier['trunk'], onSelect = function() openDoors(customVehicle, {0,0,0,0,0,1,1}) end},
                {label = 'Hidráulica', img = 'img/icons/hydrulics.png', modType = 38, priceMult = Config.VehicleCustomisePriceMultiplier['hydrulics']},
                {label = 'Bloque de motor', img = 'img/icons/engine_block.png', modType = 39, priceMult = Config.VehicleCustomisePriceMultiplier['engine_block'], onSelect = function() openDoors(customVehicle, {0,0,0,0,1,0,0}) end},
                {label = 'Filtro de aire', img = 'img/icons/air_filter.png', modType = 40, priceMult = Config.VehicleCustomisePriceMultiplier['air_filter']},
                {label = 'Riostra', img = 'img/icons/suspension.png', modType = 41, priceMult = Config.VehicleCustomisePriceMultiplier['struts']},
                {label = 'Tanque', img = 'img/icons/gas_tank.png', modType = 45, priceMult = Config.VehicleCustomisePriceMultiplier['tank']},
            },
            onBack = function() updateMenu('main') end
        },
            ['body_parts'] = {
                title = 'PARTES DEL CUERPO',
                options = {
                    {label = 'Spoilers', img = 'img/icons/spoiler.png', modType = 0, priceMult = Config.VehicleCustomisePriceMultiplier['spoilers']},
                    {label = 'Parachoques delantero', img = 'img/icons/bumper.png', modType = 1, priceMult = Config.VehicleCustomisePriceMultiplier['front_bumper']},
                    {label = 'Parachoques trasero', img = 'img/icons/bumper.png', modType = 2, priceMult = Config.VehicleCustomisePriceMultiplier['rear_bumper'], onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r', {x = 0.0, y = -4.0, z = 1.5}, {x = -30.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Faldones laterales', img = 'img/icons/bumper.png', modType = 3, priceMult = Config.VehicleCustomisePriceMultiplier['side_skirts'], onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'wheel_lf', {x = -2.5, y = 0.0, z = 0.0}, {x = 0.0, y = 0.0, z = -20.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Escape', img = 'img/icons/exhaust.png', modType = 4, priceMult = Config.VehicleCustomisePriceMultiplier['exhaust'], onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r', {x = 0.0, y = -4.0, z = 1.5}, {x = -30.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Jaula', img = 'img/icons/body.png', modType = 5, priceMult = Config.VehicleCustomisePriceMultiplier['cage'], onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'interiorlight', {x = 0.0, y = 1.0, z = -0.1}, {x = 0.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Reja', img = 'img/icons/grille.png', modType = 6, priceMult = Config.VehicleCustomisePriceMultiplier['grille']},
                    {label = 'Capucha', img = 'img/icons/hood.png', modType = 7, priceMult = Config.VehicleCustomisePriceMultiplier['hood']},
                    {label = 'Guardabarros izquierdo', img = 'img/icons/bumper.png', modType = 8, priceMult = Config.VehicleCustomisePriceMultiplier['left_fender']},
                    {label = 'Guardabarros Derecho', img = 'img/icons/bumper.png', modType = 9, priceMult = Config.VehicleCustomisePriceMultiplier['right_fender']},
                    {label = 'Techo', img = 'img/icons/roof.png', modType = 10, priceMult = Config.VehicleCustomisePriceMultiplier['roof']},
                    {label = 'Cubierta de arco', img = 'img/icons/bumper.png', modType = 42, priceMult = Config.VehicleCustomisePriceMultiplier['arch_cover']},
                    {label = 'Antenas', img = 'img/icons/aerials.png', modType = 43, priceMult = Config.VehicleCustomisePriceMultiplier['aerials']},
                    {label = 'Alas', img = 'img/icons/bumper.png', modType = 44, priceMult = Config.VehicleCustomisePriceMultiplier['wings']},
                    {label = 'Ventanas', img = 'img/icons/door.png', modType = 46, priceMult = Config.VehicleCustomisePriceMultiplier['windows']},
                },
                onBack = function() updateMenu('visual') end
            },
            ['inside_parts'] = {
                title = 'PIEZAS INTERNAS',
                options = {
                    {label = 'Tablero', img = 'img/icons/dashboard.png', modType = 29, priceMult = Config.VehicleCustomisePriceMultiplier['dashboard'], onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'interiorlight', {x = 0.0, y = -1.0, z = -0.1}, {x = 0.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Color del tablero', img = 'img/icons/dashboardColor.png', modType = 'dashboardColor', customType = 'color', priceMult = Config.VehicleCustomisePriceMultiplier['dashboard_color'], onSelect = function()
                        openColorPicker('Color del tablero', 'dashboardColor', false, Config.VehicleCustomisePriceMultiplier['dashboard_color'])
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'interiorlight', {x = 0.0, y = -1.0, z = -0.1}, {x = 0.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Dial', img = 'img/icons/dashboard.png', modType = 30, priceMult = Config.VehicleCustomisePriceMultiplier['dial'], onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'interiorlight', {x = 0.0, y = 1.0, z = -0.1}, {x = 0.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Altavoz de puerta', img = 'img/icons/speaker.png', modType = 31, priceMult = Config.VehicleCustomisePriceMultiplier['door_speaker'], onSelect = function() openDoors(customVehicle, {1,1,1,1,0,0,0}) end},
                    {label = 'Asiento', img = 'img/icons/seat.png', modType = 32, priceMult = Config.VehicleCustomisePriceMultiplier['seat']},
                    {label = 'Volante', img = 'img/icons/steering_wheel.png', modType = 33, priceMult = Config.VehicleCustomisePriceMultiplier['steering_wheel']},
                    {label = 'Palanca de cambios', img = 'img/icons/shifter_leaver.png', modType = 34, priceMult = Config.VehicleCustomisePriceMultiplier['shifter_leaver']},
                    {label = 'Adornos', img = 'img/icons/ornaments.png', modType = 28, priceMult = Config.VehicleCustomisePriceMultiplier['ornaments']},
                    {label = 'placas', img = 'img/icons/plaques.png', modType = 35, priceMult = Config.VehicleCustomisePriceMultiplier['plaques']},
                    {label = 'Interior', img = 'img/icons/body.png', modType = 27, priceMult = Config.VehicleCustomisePriceMultiplier['interior'], onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'interiorlight', {x = 0.0, y = 1.0, z = -0.1}, {x = 0.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Color Interior', img = 'img/icons/interiorColor.png', modType = 'interiorColor', customType = 'color', priceMult = Config.VehicleCustomisePriceMultiplier['interior_color'], onSelect = function()
                        openColorPicker('Color Interior', 'interiorColor', false, Config.VehicleCustomisePriceMultiplier['interior_color'])
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'interiorlight', {x = 0.0, y = 1.5, z = -0.1}, {x = 0.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                },
                onBack = function() updateMenu('visual') end
            },
            ['respray'] = {
                title = 'PINTURA',
                options = {
                    {label = 'Primario', img = 'img/icons/respray.png', modType = 'color1', customType = 'customColor', priceMult = Config.VehicleCustomisePriceMultiplier['primary_paint'], onSelect = function() openColorPicker('Color Primario', 'color1', true, Config.VehicleCustomisePriceMultiplier['primary_paint']) end},
                    {label = 'Secundario', img = 'img/icons/respray.png', modType = 'color2', customType = 'customColor', priceMult = Config.VehicleCustomisePriceMultiplier['secondary_paint'], onSelect = function() openColorPicker('Color Secundario', 'color2', true, Config.VehicleCustomisePriceMultiplier['secondary_paint']) end},
                    {label = 'Tipo de pintura primaria', img = 'img/icons/respray.png', modType = 'paintType1', priceMult = Config.VehicleCustomisePriceMultiplier['primary_paint_type']},
                    {label = 'Tipo de pintura secundaria', img = 'img/icons/respray.png', modType = 'paintType2', priceMult = Config.VehicleCustomisePriceMultiplier['secondary_paint_type']},
                    {label = 'Nacarado', img = 'img/icons/respray.png', modType = 'pearlescentColor', customType = 'color', priceMult = Config.VehicleCustomisePriceMultiplier['pearlescent'], onSelect = function() openColorPicker('Color Nacarado', 'pearlescentColor', false, Config.VehicleCustomisePriceMultiplier['pearlescent']) end},
                },
                onBack = function() updateMenu('visual') end
            },
            ['wheels'] = {
                title = 'LLANTAS',
                options = {
                    {label = 'Tipo de ruedas', img = 'img/icons/wheel.png', onSelect = function() updateMenu('wheels_type') end},
                    {label = 'Color de las ruedas', img = 'img/icons/respray.png', modType = 'wheelColor', customType = 'color', priceMult = Config.VehicleCustomisePriceMultiplier['wheels_color'], onSelect = function() openColorPicker('Color de llantas', 'wheelColor', false, Config.VehicleCustomisePriceMultiplier['wheels_color']) end},
                    {label = 'Color humo', img = 'img/icons/respray.png', modType = 'tyreSmokeColor', customType = 'customColor', priceMult = Config.VehicleCustomisePriceMultiplier['smoke_color'], onSelect = function() openColorPicker('Color humo de neumáticos', 'tyreSmokeColor', true, Config.VehicleCustomisePriceMultiplier['smoke_color']) end},
                },
                onBack = function() updateMenu('visual') SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true) end
            },
                ['wheels_type'] = {
                    title = 'TIPO DE RUEDAS',
                    options = {
                        {label = 'Deportivas', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['sport'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 0) end},
                        {label = 'Muscle', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['muscle'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 1) end},
                        {label = 'Lowrider', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['lowrider'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 2) end},
                        {label = 'Todoterreno', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['suv'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 3) end},
                        {label = 'Offroad', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['offroad'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 4) end},
                        {label = 'Tuner', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['tuner'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 5) end},
                        {label = 'Ruedas de bicicleta', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['bike_wheels'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 6) end},
                        {label = 'Gama alta', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['high_end'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 7) end},
                        {label = 'Benny\'s Original', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['bennys_original'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 8) end},
                        {label = 'Benny\'s Bespoke', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['bennys_bespoke'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 9) end},
                        {label = 'Rueda abierta', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['open_wheel'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 10) end},
                        {label = 'Callejeros', img = 'img/icons/wheel.png', modType = 23, priceMult = Config.VehicleCustomisePriceMultiplier['street'], onSelect = function() SetVehicleModData(customVehicle, 'wheels', 11) end}
                    },
                    onBack = function() updateMenu('wheels') end
                },
            ['plate'] = {
                title = 'PLACA',
                options = {
                    {label = 'Tipo', img = 'img/icons/plate.png', modType = 25, priceMult = Config.VehicleCustomisePriceMultiplier['plate_type']},
                    {label = 'Color', img = 'img/icons/respray.png', modType = 'plateIndex', priceMult = Config.VehicleCustomisePriceMultiplier['plate_color'], onSelect = function()
                        moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r', {x = -2.0, y = -2.0, z = 1.5}, {x = -30.0, y = 0.0, z = 0.0})
                    end, onSubBack = function()
                        SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                    end},
                    {label = 'Holder', img = 'img/icons/bumper.png', modType = 26, priceMult = Config.VehicleCustomisePriceMultiplier['plate_holder']},
                },
                onBack = function() updateMenu('visual') end
            },
            ['lights'] = {
                title = 'LUCES',
                options = {
                    {label = 'Xenon', img = 'img/icons/headlights.png', modType = 'modXenon', priceMult = Config.VehicleCustomisePriceMultiplier['xenon'], onSelect = function() SetVehicleEngineOn(customVehicle, true, false, false) end},
                    {label = 'Neon', img = 'img/icons/headlights.png', modType = 'neonColor', customType = 'customColor', priceMult = Config.VehicleCustomisePriceMultiplier['neon'], onSelect = function() SetVehicleEngineOn(customVehicle, true, false, false); openColorPicker('Neon Color', 'neonColor', true, Config.VehicleCustomisePriceMultiplier['neon']) end},
                },
                onBack = function() updateMenu('visual') end
            },
            ['stickers'] = {
                title = 'STICKERS',
                options = {
                    {label = 'Stickers', img = 'img/icons/respray.png', modType = 48, priceMult = Config.VehicleCustomisePriceMultiplier['stickers']},
                    {label = 'Livery', img = 'img/icons/respray.png', modType = 'livery', priceMult = Config.VehicleCustomisePriceMultiplier['livery']},
                },
                onBack = function() updateMenu('visual') end
            },
}
