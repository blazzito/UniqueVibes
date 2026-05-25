


----------------------------------------------------------------------------------------------
-----------------------------------| MT GYM SYSTEM :) |-----------------------------------
----------------------------------------------------------------------------------------------

-- MT GYM REPLICATION

-- You can add your own notify here >> [gym-cl_utils.lua]

Config = {
    DeveloperMode = false, -- Developer mode (for support)

    Core = 'ESX',  -- ESX / QBCORE  | Other core setting on the 'core' folder
    TextUI = 'mt-notify', -- 'false' / 'mt_3dtextui' / 'mt_textui' / 'ox_lib' / 'okokTextUI' / 'ESXTextUI' / 'QBDrawText' / 'DrawText3D' // Custom can be add in the gym-cl_utils.lua!!!
    Target = false, -- 'oxtarget' / 'qb-target' // if the TextUI is set to false target will step its place. 
    ProgressBar = 'ox_lib', -- 'progressBars' / 'pogressBar' / 'mythic_progbar' // Custom can be add in the gym-cl_utils.lua!!!
    MINIGAME = false,  -- Download here: https://github.com/firestix77/taskbarskill   (You can edit in the [gym-cl_utils.lua])
    GYMDistance = 60,  -- This is the distance from which membership is broken
    PressKey = 38,  -- If you want to change: https://docs.fivem.net/docs/game-references/controls/

    DisableControls = {}, -- These controls will blocked during the exercises
    ShootWeponsBlackList = {'WEAPON_PETROLCAN'},

    GYMResting = {
        Use = false, -- Enable resting between workouts.
        RestDuration = 60, -- Rest duration in seconds. 
    },

    Skills = {
        SkillMenu = {Label = 'Menú de Habilidades', Command = 'skillmenu', Control = 'DELETE'},  -- SETTINGS > KEYBINDINGS
        SkillNotifyTime = 5000, -- in milisec | 1000 = 1 sec
        SaveFrequency = 5, -- in minutes | Save in the SQL after that time
        RemoveTime = 10,  -- in munites | Remove one skill from player after that time

        SprintSpeedIncrease = 'MEDIUM', -- ('FAST', 'MEDIUM', 'SLOWLY') At what rate should you increase the run speed?
        SwimSpeedIncrease = 'MEDIUM', -- ('FAST', 'MEDIUM', 'SLOWLY') At what rate should you increase the swimming speed?
        StrengthIncrease = 'MEDIUM', -- ('HIGH', 'MEDIUM', 'LOW') At what rate should you increase strength?

        AllowOutsideTraining = false, -- If true, players can earn Stamina and Running points even when not in the gym.

        SkillTypes = {
            -- ⬇️ DO not edit this FIRST element! [You can edit the Skill Name with the Label]
            ['Stamina']  = {Use = true, Label = 'Resistencia', Color = 'rgba(0, 168, 204, 0.8)', Description = 'Afecta la capacidad de correr, andar en bicicleta y nadar. La resistencia máxima es resistencia ilimitada.'},
            ['Running']  = {Use = true, Label = 'Correr', Color = 'rgba(0, 168, 204, 0.6)', Description = 'Aumenta la velocidad al correr. Esto trae varios beneficios.'},
            ['Driving']  = {Use = false, Label = 'Conducir', Color = 'rgba(0, 168, 204, 0.4)', Description = 'Aumenta el manejo del vehículo, permite hacer mejores caballitos y aumenta el control del vehículo en el aire.'},
            ['Strength'] = {Use = true, Label = 'Fuerza', Color = 'rgba(255, 107, 0, 0.8)', Description = 'Aumenta la habilidad cuerpo a cuerpo, la velocidad en escaleras/trepado, la competencia en deportes y reduce el daño recibido.'},
            ['Swimming'] = {Use = true, Label = 'Nadar', Color = 'rgba(0, 168, 204, 0.4)', Description = 'Aumenta la capacidad pulmonar, puedes permanecer bajo el agua por más tiempo.'},
            ['Shooting'] = {Use = true, Label = 'Tiro', Color = 'rgba(255, 107, 0, 0.6)', Description = 'Aumenta la precisión, reduce el retroceso de las armas y aumenta la capacidad de munición.'},
        }
    },

    Exersices = {
        ['running'] = {
            label = "Correr", 
            time = 30, 
            skill = 'Running',
            anim_sequence = {
                training = {dict = 'move_m@brave@a', clip = 'run', duration = 4000, loop = true}
            }
        },
        ['situps'] = {label = "Abdominales", anim = "situps", time = 30, skill = 'Stamina'},
        ['yoga'] = {label = "Yoga", anim = "world_human_yoga", time = 30, skill = 'Stamina'},
        
        ['pushups'] = {
            label = "Flexiones", 
            time = 30, 
            skill = 'Strength',
            anim_sequence = {
                enter = {dict = 'amb@world_human_push_ups@male@enter', clip = 'enter', duration = 3500},
                training = {dict = 'amb@world_human_push_ups@male@base', clip = 'base', duration = 1100, loop = true},
                exit = {dict = 'amb@world_human_push_ups@male@exit', clip = 'exit', duration = 4050}
            }
        },
        ['weightlifting'] = {
            label = "Levantamiento de Pesas", 
            time = 30, 
            skill = 'Strength',
            anim_sequence = {
                idle = {dict = 'amb@world_human_muscle_free_weights@male@barbell@idle_a', clip = 'idle_a', duration = -1},
                training = {dict = 'amb@world_human_muscle_free_weights@male@barbell@base', clip = 'base', duration = 4500, loop = true}
            }
        },
        ['pullup'] = {
            label = "Dominadas", 
            time = 30, 
            skill = 'Strength',
            anim_sequence = {
                enter = {dict = 'amb@prop_human_muscle_chin_ups@male@enter', clip = 'enter', duration = 1800},
                training = {dict = 'amb@prop_human_muscle_chin_ups@male@base', clip = 'base', duration = 2900, loop = true},
                exit = {dict = 'amb@prop_human_muscle_chin_ups@male@exit', clip = 'exit', duration = 2000}
            }
        },
        ['bench'] = {
            label = "Press de Banca", 
            time = 30, 
            skill = 'Strength',
            anim_sequence = {
                enter = {dict = 'amb@prop_human_seat_muscle_bench_press@enter', clip = 'enter', duration = 1800},
                training = {dict = 'amb@prop_human_seat_muscle_bench_press@idle_a', clip = 'idle_a', duration = 2350, loop = true},
                exit = {dict = 'amb@prop_human_seat_muscle_bench_press@exit', clip = 'exit', duration = 2500}
            }
        },
        ['dumbbells'] = {
            label = "Mancuernas", 
            time = 30, 
            skill = 'Strength',
            anim_sequence = {
                idle = {dict = 'amb@world_human_muscle_free_weights@male@barbell@idle_a', clip = 'idle_a', duration = -1},
                training = {dict = 'amb@world_human_muscle_free_weights@male@barbell@base', clip = 'base', duration = 4500, loop = true}
            }
        },
    },
    
    Gyms = {

        ['Gimnasio VIP'] = {
            ItemRequired = {Use = false, Item = 'gym_membership', Time = 15, RemoveItem = true},
            Distances = {Marker = 5.0, Text = 1.5},
            GYMCoords = { x = 4553.7598, y = -3012.2473, z = 10.6290},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 260, g = 40, b = 40, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = true, colour = 1, size = 0.8, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = 4553.7598, y = -3012.2473, z = 10.6290, heading = 253.1053},
                [2]  = { type = 'weightlifting', x = 4558.4497, y = -3026.8499, z = 10.6290, heading = 45.4447},
                [3]  = { type = 'weightlifting', x = 4565.3560, y = -3026.2727, z = 10.6290, heading = 355.6703},
                [4]  = { type = 'weightlifting', x = 4568.1997, y = -3026.5950, z = 10.6290, heading = 2.6705},
                [5]  = { type = 'weightlifting', x = 4569.9233, y = -3025.5549, z = 10.6290, heading = 92.7982},
                [6]  = { type = 'weightlifting', x = 4569.7393, y = -3022.5867, z = 10.6290, heading = 91.7357},

                [7]  = { type = 'running', x = 4559.6748, y = -3008.4602, z = 10.7789, heading = 352.6308},
                [8]  = { type = 'running', x = 4562.3306, y = -3008.5615, z = 10.7795, heading = 342.2491},
                [9]  = { type = 'running', x = 4564.6411, y = -3009.2739, z = 10.7849, heading = 337.2512},
                [10] = { type = 'running', x = 4566.1948, y = -3010.3408, z = 10.7823, heading = 323.9746},
                [11] = { type = 'running', x = 4567.5459, y = -3011.6455, z = 10.7828, heading = 306.4085},
                [12] = { type = 'running', x = 4568.7349, y = -3013.4414, z = 10.7828, heading = 295.2696},
                [13] = { type = 'running', x = 4569.1943, y = -3015.6309, z = 10.7809, heading = 286.9340},
                [14] = { type = 'running', x = 4569.5391, y = -3018.1655, z = 10.7806, heading = 268.3188},

                [15] = { type = 'pullup', x = 4559.7876, y = -3024.2214, z = 10.6290, heading = 356.0743},
                [16] = { type = 'pullup', x = 4557.6016, y = -3022.1191, z = 10.6290, heading = 181.2445},
                
                [17] = { type = 'pushups', x = 4557.8159, y = -3010.1965, z = 10.6290, heading = 176.7936},
                [18] = { type = 'pushups', x = 4554.5796, y = -3014.6692, z = 10.6290, heading = 185.7698},
                [19] = { type = 'pushups', x = 4557.6904, y = -3017.0930, z = 10.6290, heading = 211.9851},
                [20] = { type = 'pushups', x = 4565.2998, y = -3017.2546, z = 10.6290, heading = 359.4591},

                [21] = { type = 'bench', x = 4561.6030, y = -3015.9780, z = 10.0363, heading = 358.9032},
                [22] = { type = 'bench', x = 4561.5024, y = -3018.6833, z = 10.0363, heading = 182.8130},

                [23] = { type = 'yoga', x = 4553.5029, y = -3008.5015, z = 10.7471, heading = 267.5269},
                [24] = { type = 'yoga', x = 4553.5386, y = -3009.6431, z = 10.7471, heading = 262.5854},
                [25] = { type = 'yoga', x = 4553.2109, y = -3007.3662, z = 10.7469, heading = 268.4793},
            }
        },


        -- You can add more GYM's...
    },
    

    -----------------------------------------------------------
    -----------------------| TRANSLATE |-----------------------
    -----------------------------------------------------------

    Texts = {
        TextUI = {'[E] - Hacer'}, 
        Text3D = {'Para~r~', '~w~presiona ~w~[~g~E~w~]'}, 
    },    

    Notify = {
        [1] = {'MT GYM', "¡No tienes tarjeta de gimnasio!", 5000, 'error'},
        [2] = {'MT GYM', "¡Se acabó el tiempo!", 5000, 'warning'},
        [3] = {'MT GYM', "¡Saliste del gimnasio!", 5000, 'warning'},
        [4] = {'MT GYM', "¡No puedes hacer esto en un vehículo!", 5000, 'error'},
        [5] = {'MT GYM', "¡Necesitas descansar antes de empezar otro entrenamiento!", 5000, 'warning'},
        [6] = {'MT GYM', "Ahora puedes volver a hacer ejercicio.", 5000, 'info'},
        [7] = {'MT GYM', "Entrenamiento cancelado.", 5000, 'error'},
    }
}
