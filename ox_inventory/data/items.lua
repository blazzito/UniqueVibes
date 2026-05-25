return {

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},


	["medikit"] = {
		label = "Medikit",
		weight = 2,
		stack = true,
		close = true,
	},

	["megaphone"] = {
		label = "Megaphone",
		weight = 0,
		stack = true,
		close = true,
	},

	["caradvancedlockpick"] = {
		label = "Advanced Lockpick",
		weight = 0,
		stack = true,
		close = true,
	},

	["carlockpick"] = {
		label = "Car Lockpick",
		weight = 0,
		stack = true,
		close = true,
	},

	["plate"] = {
		label = "License Plate",
		weight = 0,
		stack = true,
		close = true,
	},

	["rentalpaper"] = {
		label = "Rental Paper",
		weight = 0,
		stack = true,
		close = true,
	},

	["screwdriver"] = {
		label = "Screwdriver",
		weight = 0,
		stack = true,
		close = true,
	},

	["vehiclegps"] = {
		label = "Vehicle GPS",
		weight = 0,
		stack = true,
		close = true,
	},

	["vehiclekeys"] = {
		label = "Vehicle Keys",
		weight = 0,
		stack = true,
		close = true,
	},

	["vehicletracker"] = {
		label = "Vehicle Tracker",
		weight = 0,
		stack = true,
		close = true,
	},

	["mov_basic_ceramic"] = {
		label = "Basic Ceramic",
		description = "After application on the car, dirt does not stick to the bodywork, making it much easier to wash off at the car wash. It lasts about 3 days on the car, after which time reapplication is required to maintain the effect.",
		client = {
			image = "mov_basic_ceramic.png",
		},
		weight = 10,
		stack = true,
		close = true,
	},

	["mov_advanced_ceramic"] = {
		label = "Premium Ceramic",
		description = "After application on the car, dirt does not stick to the bodywork at all, so at the car wash, it only needs to be rinsed off. It lasts about 7 days on the car, after which time reapplication is required to maintain the effect.",
		client = {
			image = "mov_advanced_ceramic.png",
		},
		weight = 10,
		stack = true,
		close = true,
	},

	["mov_basic_wax"] = {
		label = "Basic Wax",
		description = "After application on the car, the car is resistant to external dirt, such as driving on unpaved roads, etc. It will still get dirty, but much more slowly. It lasts about 3 days on the car, after which time reapplication is required to maintain the effect.",
		client = {
			image = "mov_basic_wax.png",
		},
		weight = 10,
		stack = true,
		close = true,
	},

	["mov_advanced_wax"] = {
		label = "Advanced Wax",
		description = "After application on the car, the car is highly resistant to external dirt, such as driving on unpaved roads, etc. It will still get dirty, but much more slowly. It lasts about 7 days on the car, after which time reapplication is required to maintain the effect.",
		client = {
			image = "mov_advanced_wax.png",
		},
		weight = 10,
		stack = true,
		close = true,
	},

	["ticket_cinema"] = {
		label = "Ticket Cinema",
		weight = 0,
		client = {
			image = "ticket_cinema.png",
		},
		stack = true,
		close = true,
	},

	["popcorn"] = {
		label = "Popcorn",
		weight = 150,
		client = {
			image = "popcorn.png",
		},
		stack = true,
		close = true,
	},

	["cola"] = {
		label = "Cola",
		weight = 150,
		client = {
			image = "cola.png",
		},
		stack = true,
		close = true,
	},

	["claw_01"] = {
		label = "Claw 01",
		weight = 150,
		client = {
			image = "claw_01.png",
		},
		stack = true,
		close = true,
	},

	["claw_02"] = {
		label = "Claw 02",
		weight = 150,
		client = {
			image = "claw_02.png",
		},
		stack = true,
		close = true,
	},

	["claw_03"] = {
		label = "Claw 03",
		weight = 150,
		client = {
			image = "claw_03.png",
		},
		stack = true,
		close = true,
	},

	["claw_04"] = {
		label = "Claw 04",
		weight = 150,
		client = {
			image = "claw_04.png",
		},
		stack = true,
		close = true,
	},

	["claw_05"] = {
		label = "Claw 05",
		weight = 150,
		client = {
			image = "claw_05.png",
		},
		stack = true,
		close = true,
	},

	["claw_06"] = {
		label = "Claw 06",
		weight = 150,
		client = {
			image = "claw_06.png",
		},
		stack = true,
		close = true,
	},

	["princess"] = {
		label = "Princess",
		weight = 150,
		client = {
			image = "princess.png",
		},
		stack = true,
		close = true,
	},

	["boombox"] = {
		label = "Boombox",
		weight = 2500,
		stack = false,
		close = true,
		client = {
			image = "boombox.png",
		},
	},

	["cryptostick"] = {
		label = "Crypto Stick",
		weight = 50,
		stack = true,
		close = true,
		client = {
			image = "cryptostick.png",
		},
	},

	["documents"] = {
		label = "Documents",
		weight = 20,
		stack = true,
		close = true,
		client = {
			image = "documents.png",
		},
	},

	["drive"] = {
		label = "Flash Drive",
		weight = 10,
		stack = true,
		close = true,
		client = {
			image = "drive.png",
		},
	},

	["weapon"] = {
		label = "Weapon Part",
		weight = 500,
		stack = true,
		close = true,
		client = {
			image = "weapon.png",
		},
	},

	["engine_oil"] = {
		label = "Engine Oil",
		weight = 1000,
	},
	["tyre_replacement"] = {
		label = "Tyre Replacement",
		weight = 1000,
	},
	["clutch_replacement"] = {
		label = "Clutch Replacement",
		weight = 1000,
	},
	["air_filter"] = {
		label = "Air Filter",
		weight = 100,
	},
	["spark_plug"] = {
		label = "Spark Plug",
		weight = 1000,
	},
	["brakepad_replacement"] = {
		label = "Brakepad Replacement",
		weight = 1000,
	},
	["suspension_parts"] = {
		label = "Suspension Parts",
		weight = 1000,
	},
	-- Engine Items
	["i4_engine"] = {
		label = "I4 Engine",
		weight = 1000,
	},
	["v6_engine"] = {
		label = "V6 Engine",
		weight = 1000,
	},
	["v8_engine"] = {
		label = "V8 Engine",
		weight = 1000,
	},
	["v12_engine"] = {
		label = "V12 Engine",
		weight = 1000,
	},
	["turbocharger"] = {
		label = "Turbocharger",
		weight = 1000,
	},
	-- Electric Engines
	["ev_motor"] = {
		label = "EV Motor",
		weight = 1000,
	},
	["ev_battery"] = {
		label = "EV Battery",
		weight = 1000,
	},
	["ev_coolant"] = {
		label = "EV Coolant",
		weight = 1000,
	},
	-- Drivetrain Items
	["awd_drivetrain"] = {
		label = "AWD Drivetrain",
		weight = 1000,
	},
	["rwd_drivetrain"] = {
		label = "RWD Drivetrain",
		weight = 1000,
	},
	["fwd_drivetrain"] = {
		label = "FWD Drivetrain",
		weight = 1000,
	},
	-- Tuning Items
	["slick_tyres"] = {
		label = "Slick Tyres",
		weight = 1000,
	},
	["semi_slick_tyres"] = {
		label = "Semi Slick Tyres",
		weight = 1000,
	},
	["offroad_tyres"] = {
		label = "Offroad Tyres",
		weight = 1000,
	},
	["drift_tuning_kit"] = {
		label = "Drift Tuning Kit",
		weight = 1000,
	},
	["ceramic_brakes"] = {
		label = "Ceramic Brakes",
		weight = 1000,
	},
	-- Cosmetic Items
	["lighting_controller"] = {
		label = "Lighting Controller",
		weight = 100,
		client = {
		event = "jg-mechanic:client:show-lighting-controller",
		}
	},
	["stancing_kit"] = {
		label = "Stancer Kit",
		weight = 100,
		client = {
		event = "jg-mechanic:client:show-stancer-kit",
		}
	},
	["cosmetic_part"] = {
		label = "Cosmetic Parts",
		weight = 100,
	},
	["respray_kit"] = {
		label = "Respray Kit",
		weight = 1000,
	},
	["vehicle_wheels"] = {
		label = "Vehicle Wheels Set",
		weight = 1000,
	},
	["tyre_smoke_kit"] = {
		label = "Tyre Smoke Kit",
		weight = 1000,
	},
	["bulletproof_tyres"] = {
		label = "Bulletproof Tyres",
		weight = 1000,
	},
	["extras_kit"] = {
		label = "Extras Kit",
		weight = 1000,
	},
	-- Nitrous & Cleaning Items
	["nitrous_bottle"] = {
		label = "Nitrous Bottle",
		weight = 1000,
		client = {
		event = "jg-mechanic:client:use-nitrous-bottle",
		}
	},
	["empty_nitrous_bottle"] = {
		label = "Empty Nitrous Bottle",
		weight = 1000,
	},
	["nitrous_install_kit"] = {
		label = "Nitrous Install Kit",
		weight = 1000,
	},
	["cleaning_kit"] = {
		label = "Cleaning Kit",
		weight = 1000,
		client = {
		event = "jg-mechanic:client:clean-vehicle",
		}
	},
	["repair_kit"] = {
		label = "Repair Kit",
		weight = 1000,
		client = {
		event = "jg-mechanic:client:repair-vehicle",
		}
	},
	["duct_tape"] = {
		label = "Duct Tape",
		weight = 1000,
		client = {
		event = "jg-mechanic:client:use-duct-tape",
		}
	},
	-- Performance Item
	["performance_part"] = {
		label = "Performance Parts",
		weight = 1000,
	},
	-- Mechanic Tablet Item
	["mechanic_tablet"] = {
		label = "Mechanic Tablet",
		weight = 1000,
		client = {
		event = "jg-mechanic:client:use-tablet",
		}
	},
	-- Gearbox
	["manual_gearbox"] = {
		label = "Manual Gearbox",
		weight = 1000,
	},

	["outfitbag"] = {
		label = "Outfit Bag",
		weight = 500,
		stack = false,
		close = true,
		client = {
			image = "outfitbag.png",
		},
	},

	["instant_camera"] = {
		label = "Instant camera",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "instant_camera.png",
		},
	},

	["photo"] = {
		label = "Photo",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "photo.png",
		},
	},

	["evidence_a"] = {
		label = "Evidence of",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "evidence_a.png",
		},
	},

	["evidence_az"] = {
		label = "Evidence",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "evidence_az.png",
		},
	},

	["evidence_b"] = {
		label = "Vehicle evidence",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "evidence_b.png",
		},
	},

	["evidence_n"] = {
		label = "Impact evidence",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "evidence_n.png",
		},
	},

	["evidence_ne"] = {
		label = "Footprint evidence",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "evidence_ne.png",
		},
	},

	["evidence_r"] = {
		label = "Blood evidence",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "evidence_r.png",
		},
	},

	["evidence_ro"] = {
		label = "Evidence",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "evidence_ro.png",
		},
	},

	["evidence_v"] = {
		label = "Drug evidence",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "evidence_v.png",
		},
	},

	["report_evidence"] = {
		label = "Evidence report",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "report_evidence.png",
		},
	},

	["k9"] = {
		label = "K9 whistle",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "k9.png",
		},
	},

	["lspd_badge"] = {
		label = "Police badge",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "lspd_badge.png",
		},
	},

	["bcsd_badge"] = {
		label = "Sheriff badge",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "bcsd_badge.png",
		},
	},

	["police_cad"] = {
		label = "Police tablet",
		weight = 0,
		stack = true,
		close = true,
		client = {
			image = "police_cad.png",
		},
	},

	["housekey"] = {
		label = "House Key",
		weight = 100,
		stack = false,
	},

	["weed_white-widow"] = {
		label = "White Widow weed",
		weight = 150,
		stack = false,
	},

	["weed_skunk"] = {
		label = "Skunk weed",
		weight = 150,
		stack = false,
	},

	["weed_purple-haze"] = {
		label = "Purple Haze weed",
		weight = 150,
		stack = false,
	},

	["weed_og-kush"] = {
		label = "OG Kush weed",
		weight = 150,
		stack = false,
	},

	["weed_amnesia"] = {
		label = "Amnesia weed",
		weight = 150,
		stack = false,
	},

	["weed_ak47"] = {
		label = "AK47 weed",
		weight = 150,
		stack = false,
	},

	["weed_white-widow_seed"] = {
		label = "White Widow seed",
		weight = 50,
		stack = false,
	},

	["weed_skunk_seed"] = {
		label = "Skunk seed",
		weight = 50,
		stack = false,
	},

	["weed_purple-haze_seed"] = {
		label = "Purple Haze seed",
		weight = 50,
		stack = false,
	},

	["weed_og-kush_seed"] = {
		label = "OG Kush seed",
		weight = 50,
		stack = false,
	},

	["weed_amnesia_seed"] = {
		label = "Amnesia seed",
		weight = 50,
		stack = false,
	},

	["weed_ak47_seed"] = {
		label = "AK47 seed",
		weight = 50,
		stack = false,
	},

	["empty_weed_bag"] = {
		label = "Empty weed bag",
		weight = 50,
		stack = true,
	},

	["weed_nutrition"] = {
		label = "Weed nutrition",
		weight = 500,
		stack = false,
	},

	["lockpick"] = {
		label = "Lockpick",
		weight = 100,
		stack = true,
	},

	["police_stormram"] = {
		label = "Police Storm Ram",
		weight = 800,
		stack = false,
	},


	["phone_dongle"] = {
		label = "Phone Dongle",
		weight = 50,
		stack = false,
	},

	["powerbank"] = {
		label = "Power Bank",
		weight = 50,
		stack = false,
	},

	['phone'] = {
		label = 'Classic Phone',
		weight = 150,
		stack = false,
		consume = 0,
		client = {
			export = "qs-smartphone-pro.UsePhoneItem",
			add = function(total)
				TriggerServerEvent('phone:itemAdd')
			end,

			remove = function(total)
				TriggerServerEvent('phone:itemDelete')
			end
		}
	},

	['black_phone'] = {
		label = 'Black Phone',
		weight = 150,
		stack = false,
		consume = 0,
		client = {
			export = "qs-smartphone-pro.UsePhoneItem",
			add = function(total)
				TriggerServerEvent('phone:itemAdd')
			end,

			remove = function(total)
				TriggerServerEvent('phone:itemDelete')
			end
		}
	},

	['yellow_phone'] = {
		label = 'Yellow Phone',
		weight = 150,
		stack = false,
		consume = 0,
		client = {
			export = "qs-smartphone-pro.UsePhoneItem",
			add = function(total)
				TriggerServerEvent('phone:itemAdd')
			end,

			remove = function(total)
				TriggerServerEvent('phone:itemDelete')
			end
		}
	},

	['red_phone'] = {
		label = 'Red Phone',
		weight = 150,
		stack = false,
		consume = 0,
		client = {
			export = "qs-smartphone-pro.UsePhoneItem",
			add = function(total)
				TriggerServerEvent('phone:itemAdd')
			end,

			remove = function(total)
				TriggerServerEvent('phone:itemDelete')
			end
		}
	},

	['green_phone'] = {
		label = 'Green Phone',
		weight = 150,
		stack = false,
		consume = 0,
		client = {
			export = "qs-smartphone-pro.UsePhoneItem",
			add = function(total)
				TriggerServerEvent('phone:itemAdd')
			end,

			remove = function(total)
				TriggerServerEvent('phone:itemDelete')
			end
		}
	},

	['white_phone'] = {
		label = 'White Phone',
		weight = 150,
		stack = false,
		consume = 0,
		client = {
			export = "qs-smartphone-pro.UsePhoneItem",
			add = function(total)
				TriggerServerEvent('phone:itemAdd')
			end,

			remove = function(total)
				TriggerServerEvent('phone:itemDelete')
			end
		}
	},

	['WEAPON_ACIDPACKAGE'] = {
		label = 'Newspaper',
		weight = 0,
		throwable = true,
	},	
	['visa_r1'] = {
		label = 'Visa',
		description = 'Documento Legal. Permite cruzar la frontera.',
		weight = 0,
		stack = false,
		close = true,
		consume = 0,
		client = { image = 'visa_r1.png' }
	},

	['tablet_r1'] = {
		label = 'Tablet R1 Fiesta',
		weight = 500,
		stack = false,
		close = true,
		description = 'Tablet especial para fiestas privadas',
		client = {
			export = 'R1_FiestasPriv.useTablet',
			image = 'tablet_r1.png'
		}
	},

	["banana"] = {
		label = "Banana",
		weight = 1000,
		stack = true,
		close = true,
		client = { image = "banana.png" }
	},

	["inflatable"] = {
		label = "Inflatable",
		weight = 1000,
		stack = true,
		close = true,
		client = { image = "inflatable.png" }
	},

	["parasailing"] = {
		label = "Parachute",
		weight = 1000,
		stack = true,
		close = true,
		client = { image = "parasailing.png" }
	},

	["ski"] = {
		label = "Ski",
		weight = 1000,
		stack = true,
		close = true,
		client = { image = "ski.png" }
	},

	["circle"] = {
		label = "Circle",
		weight = 1000,
		stack = true,
		close = true,
		client = { image = "circle.png" }
	},

	["bed1"] = {
		label = "Lounger 1",
		weight = 1000,
		stack = true,
		close = true,
		client = { image = "bed1.png" }
	},

	["bed2"] = {
		label = "Lounger 2",
		weight = 1000,
		stack = true,
		close = true,
		client = { image = "bed2.png" }
	},

	["bed3"] = {
		label = "Lounger 3",
		weight = 1000,
		stack = true,
		close = true,
		client = { image = "bed3.png" }
	},

	["bed4"] = {
		label = "Lounger 4",
		weight = 1000,
		stack = true,
		close = true,
		client = { image = "bed4.png" }
	},

	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Repair Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Iron",
		weight = 1,
		stack = true,
		close = true,
	},

	["kq_outfitbag"] = {
		label = "Outfit bag",
		weight = 4,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Blowtorch",
		weight = 2,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Body Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Wool",
		weight = 1,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Cloth",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Copper",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Chicken fillet",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Processed oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Packaged wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Repair Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		stack = true,
		close = true,
	},

	["casino_ego_chaser"] = {
		label = "Casino Ego Chaser",
		weight = 0,
		stack = true,
		close = true,
	},

	["casino_luckypotion"] = {
		label = "Casino Lucky Potion",
		weight = 0,
		stack = true,
		close = true,
	},

	["casino_psqs"] = {
		label = "Casino Ps & Qs",
		weight = 0,
		stack = true,
		close = true,
	},

	["casino_sandwitch"] = {
		label = "Casino Sandwitch",
		weight = 0,
		stack = true,
		close = true,
	},

	["casino_sprite"] = {
		label = "Casino Sprite",
		weight = 0,
		stack = true,
		close = true,
	},

	["casino_beer"] = {
		label = "Casino Beer",
		weight = 0,
		stack = true,
		close = true,
	},

	["casino_burger"] = {
		label = "Casino Burger",
		weight = 0,
		stack = true,
		close = true,
	},

	["casino_chips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = true,
	},

	["casino_coffee"] = {
		label = "Casino Coffee",
		weight = 0,
		stack = true,
		close = true,
	},

	["casino_coke"] = {
		label = "Casino Kofola",
		weight = 0,
		stack = true,
		close = true,
	},

	["casino_donut"] = {
		label = "Casino Donut",
		weight = 0,
		stack = true,
		close = true,
	},

	['engine_i4_turbo'] = {
    label = 'I4 Turbo Engine',
    description = 'Turbocharged inline-4 engine swap kit',
    weight = 15000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'engine_i4_turbo.png',
    },
},

['engine_v6_33l'] = {
    label = 'V6 3.3L Engine',
    description = 'V6 3.3 liter engine swap kit',
    weight = 18000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'engine_v6_33l.png',
    },
},

['engine_v8_65l'] = {
    label = 'V8 6.5L Engine',
    description = 'High-performance V8 6.5 liter engine swap kit',
    weight = 22000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'engine_v8_65l.png',
    },
},

['engine_v12_60l'] = {
    label = 'V12 6.0L Engine',
    description = 'Premium V12 6.0 liter engine swap kit',
    weight = 25000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'engine_v12_60l.png',
    },
},

-- ============================================
-- BRAKES
-- ============================================

['ceramic_brake_kit'] = {
    label = 'Ceramic Brake Kit',
    description = 'High-performance ceramic brake system',
    weight = 3000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'ceramic_brake_kit.png',
    },
},

-- ============================================
-- HANDLING
-- ============================================

['drift_tuning_kit'] = {
    label = 'Drift Tuning Kit',
    description = 'Complete drift setup package for handling modifications',
    weight = 5000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'drift_tuning_kit.png',
    },
},

-- ============================================
-- DRIVETRAIN
-- ============================================

['drivetrain_awd'] = {
    label = 'AWD Drivetrain',
    description = 'All-wheel drive conversion kit',
    weight = 8000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'drivetrain_awd.png',
    },
},

['drivetrain_rwd'] = {
    label = 'RWD Drivetrain',
    description = 'Rear-wheel drive conversion kit',
    weight = 7000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'drivetrain_rwd.png',
    },
},

['drivetrain_fwd'] = {
    label = 'FWD Drivetrain',
    description = 'Front-wheel drive conversion kit',
    weight = 7000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'drivetrain_fwd.png',
    },
},

-- ============================================
-- TURBO (Already defined in craft items, included here for completeness)
-- ============================================

['turbo_kit'] = {
    label = 'Turbo Kit',
    description = 'High-performance turbocharger system',
    weight = 5000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'turbo_kit.png',
    },
},

-- ============================================
-- TYRES
-- ============================================

['tyres_slick'] = {
    label = 'Slick Tyres',
    description = 'Racing slick tyres for maximum grip on dry surfaces',
    weight = 4000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'tyres_slick.png',
    },
},

['tyres_semi_slick'] = {
    label = 'Semi-Slick Tyres',
    description = 'Semi-slick performance tyres for street and track',
    weight = 4000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'tyres_semi_slick.png',
    },
},

['tyres_offroad'] = {
    label = 'Off-Road Tyres',
    description = 'Heavy-duty off-road tyres for rough terrain',
    weight = 5000,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'tyres_offroad.png',
    },
},


['blank_plate'] = {
    label = 'Blank Plate',
    description = 'Unpressed blank vehicle license plate',
    weight = 500,
    stack = true,
    close = true,
    consume = 0,
},

['plate_ink'] = {
    label = 'Plate Ink',
    description = 'Special ink for license plate printing',
    weight = 200,
    stack = true,
    close = true,
    consume = 0,
},

-- ============================================
-- FAKE PLATE REMOVER MATERIALS
-- ============================================

['screwdriver'] = {
    label = 'Screwdriver',
    description = 'Multi-purpose screwdriver',
    weight = 150,
    stack = true,
    close = true,
    consume = 0,
},

['solvent'] = {
    label = 'Solvent',
    description = 'Chemical solvent - dissolves adhesives and paints',
    weight = 300,
    stack = true,
    close = true,
    consume = 0,
},

-- ============================================
-- NITRO MATERIALS
-- ============================================

['nitrous_fuel'] = {
    label = 'Nitrous Fuel',
    description = 'High-performance fuel canister for nitrous systems',
    weight = 2000,
    stack = true,
    close = true,
    consume = 0,
},

['nitro_kit'] = {
    label = 'Nitro Installation Kit',
    description = 'Nitro system installation materials',
    weight = 1500,
    stack = true,
    close = true,
    consume = 0,
},

-- ============================================
-- OUTPUT ITEMS - FAKE PLATE
-- ============================================

['fake_plate'] = {
    label = 'Fake License Plate',
    description = 'Vehicle license plate copy - can be detected by police. Use near a vehicle to install.',
    weight = 500,
    stack = false,
    close = true,
    consume = 0,
    -- Metadata: craftedBy, craftedAt
    client = {
        image = 'fake_plate.png',
    },
},

['fake_plate_remover'] = {
    label = 'Plate Remover',
    description = 'Used to remove fake plates from vehicles',
    weight = 300,
    stack = false,
    close = true,
    consume = 0,
    -- Metadata: craftedBy, craftedAt
    client = {
        image = 'fake_plate_remover.png',
    },
},

-- ============================================
-- OUTPUT ITEMS - NITRO SYSTEM
-- ============================================

['nitro_filled'] = {
    label = 'Nitro System (Filled)',
    description = 'Vehicle-installable filled nitro system - 100 uses',
    weight = 4000,
    stack = false,
    close = true,
    consume = 0,
    -- Metadata: uses, maxUses, heatPerUse, craftedBy, craftedAt
    client = {
        image = 'nitro_filled.png',
    },
},

['nitro_empty'] = {
    label = 'Nitro System (Empty)',
    description = 'Empty nitro system - can be refilled by illegal mechanic',
    weight = 2000,
    stack = false,
    close = true,
    consume = 0,
    -- Metadata: maxUses, craftedBy, craftedAt
    client = {
        image = 'nitro_empty.png',
    },
},

-- ============================================
-- SYSTEM ITEMS
-- ============================================

['tablet'] = {
    label = 'Tablet',
    weight = 500,
    stack = false,
    close = true,
},

['mechanic_invoice'] = {
    label = 'Mechanic Invoice',
    description = 'A detailed service invoice from the mechanic shop.',
    weight = 100,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'mechanic_invoice.png', -- or webp
    },
},

-- ============================================
-- REMOTE CONTROLLERS (Reusable - NOT consumed on use)
-- ============================================

['stance_remote'] = {
    label = 'Stance Remote',
    description = 'Controls vehicle camber and suspension height',
    weight = 200,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'stance_remote.png', -- or webp
    },
},

['light_remote'] = {
    label = 'Light Remote',
    description = 'Controls vehicle neon and xenon lights',
    weight = 200,
    stack = false,
    close = true,
    consume = 0,
    client = {
        image = 'light_remote.png', -- or webp
    },
},


['ammonium_nitrate'] = {
    label = 'Ammonium nitrate',
    weight = 100,
    stack = true,
    close = true
},

['carbon'] = {
    label = 'Carbon',
    weight = 100,
    stack = true,
    close = true
},

['codeine'] = {
    label = 'Codeine',
    weight = 100,
    stack = true,
    close = true
},

['drink_sprite'] = {
    label = 'Sprite',
    weight = 100,
    stack = true,
    close = true
},

['drug_ecstasy'] = {
    label = 'Ecstasy',
    weight = 100,
    stack = true,
    close = true
},

['drug_lean'] = {
    label = 'Lean',
    weight = 100,
    stack = true,
    close = true
},

['drug_lsd'] = {
    label = 'LSD',
    weight = 100,
    stack = true,
    close = true
},

['drug_meth'] = {
    label = 'Meth',
    weight = 100,
    stack = true,
    close = true
},

['hydrogen'] = {
    label = 'Hydrogen',
    weight = 100,
    stack = true,
    close = true
},

['ice'] = {
    label = 'Ice',
    weight = 100,
    stack = true,
    close = true
},

['jolly_ranchers'] = {
    label = 'Jolly Ranchers',
    weight = 100,
    stack = true,
    close = true
},

['liquid_sulfur'] = {
    label = 'Liquid Sulfur',
    weight = 100,
    stack = true,
    close = true
},

['muriatic_acid'] = {
    label = 'Muriatic Acid',
    weight = 100,
    stack = true,
    close = true
},

['nitrogen'] = {
    label = 'Nitrogen',
    weight = 100,
    stack = true,
    close = true
},

['oxygen'] = {
    label = 'Oxygen',
    weight = 100,
    stack = true,
    close = true
},

['pseudoefedrine'] = {
    label = 'Pseudoefedrine',
    weight = 100,
    stack = true,
    close = true
},

['red_sulfur'] = {
    label = 'Red Sulfur',
    weight = 100,
    stack = true,
    close = true
},

['sodium_hydroxide'] = {
    label = 'Sodium hydroxide',
    weight = 100,
    stack = true,
    close = true
},

['water'] = {
    label = 'Water',
    weight = 100,
    stack = true,
    close = true
},

['cannabis'] = {
    label = 'Cannabis',
    weight = 100,
    stack = true,
    close = true
},

['green_gelato_cannabis'] = {
    label = 'Green Gelato Cannabis',
    weight = 100,
    stack = true,
    close = true
},

['opium'] = {
    label = 'Opium',
    weight = 100,
    stack = true,
    close = true
},

['cocaine'] = {
    label = 'Cocaine',
    weight = 100,
    stack = true,
    close = true
},



["tunerchip1"] = {
	label = "Tuner Chip Stage 1",
	weight = 250,
	stack = true,
	close = true
},
["tunerchip2"] = {
	label = "Tuner Chip Stage 2",
	weight = 250,
	stack = true,
	close = true
},
["tunerchip3"] = {
	label = "Tuner Chip Stage 3",
	weight = 250,
	stack = true,
	close = true
},
["tunerchipbangs"] = {
	label = "Pops & Bangs Chip",
	weight = 250,
	stack = true,
	close = true
},
["flameschip"] = {
	label = "Flame Chip",
	weight = 250,
	stack = true,
	close = true
},
["tunerchipr"] = {
	label = "Chip removal",
	weight = 250,
	stack = true,
	close = true
},



['weed'] = {
   label = 'Weed',
   weight = 1,
   stack = true,
},

['liquid_meth'] = {
   label = 'Liquid Meth',
   weight = 1,
   stack = true,
},

['baggy'] = {
   label = 'Baggy',
   weight = 10,
   stack = true,
},

['bagged_weed'] = {
   label = 'Weed Bag',
   weight = 20,
   stack = true,
},

['bagged_meth'] = {
   label = 'Meth Bag',
   weight = 20,
   stack = true,
},

['bagging_table'] = {
   label = 'Bagging Table',
   weight = 1000,
   stack = true,
},

['cauldron'] = {
   label = 'Cauldron',
   weight = 500,
   stack = true,
},

['coca_leaf'] = {
   label = 'Coca Leaf',
   weight = 5,
   stack = true,
},

['coke_base'] = {
   label = 'Cocaine Base',
   weight = 1,
   stack = true,
},

['meth_cooking_table'] = {
   label = 'Meth Cooking Table',
   weight = 1000,
   stack = true,
},

['phos'] = {
   label = 'phos',
   weight = 1,
   stack = true,
},

['acid'] = {
   label = 'Acid',
   weight = 1,
   stack = true,
},

['pseudo'] = {
   label = 'Pseudo',
   weight = 1,
   stack = true,
},

['explosive_meth'] = {
   label = 'Explosive Meth',
   weight = 1,
   stack = true,
},

['mixer'] = {
   label = 'Mixer',
   weight = 1,
   stack = true,
},

['gasoline'] = {
   label = 'Gasoline',
   weight = 500,
   stack = true,
},

['meth_oven'] = {
   label = 'Meth Oven',
   weight = 2500,
   stack = true,
},

['coke_oven'] = {
   label = 'Coke Oven',
   weight = 2500,
   stack = true,
},

['cocaine'] = {
   label = 'Cocaine',
   weight = 1,
   stack = true,
},

['meth'] = {
   label = 'Meth',
   weight = 1,
   stack = true,
},

['cannabis_seed'] = {
   label = 'Cannabis seed',
   weight = 1,
   stack = true,
},

['coca_seed'] = {
   label = 'Coca Seed',
   weight = 1,
   stack = true,
},

['plant_pot'] = {
   label = 'Plant Pot',
   weight = 100,
   stack = true,
},

['fertilizer'] = {
   label = 'Fertilizer',
   weight = 10,
   stack = true,
},

['water_bottle'] = {
   label = 'Water Bottle',
   weight = 100,
   stack = true,
},

['default_lamp'] = {
   label = 'Lamp',
   weight = 200,
   stack = true,
},

['press'] = {
   label = 'Press',
   weight = 2500,
   stack = true,
},

['coke_brick'] = {
   label = 'Coke Brick',
   weight = 100,
   stack = true,
},
}