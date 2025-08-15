return {
	['testburger'] = {
		label = 'Тестовый бургер',
		weight = 220, -- гамбургер ~220 г
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Лизнуть',
				action = function(slot)
					print('Вы лизнули бургер')
				end
			},
			{
				label = 'Сжать',
				action = function(slot)
					print('Вы сжали бургер :(')
				end
			},
			{
				label = 'Как называется веганский бургер?',
				group = 'Шутки про гамбургеры',
				action = function(slot)
					print('Ошибка.')
				end
			},
			{
				label = 'Что лягушки любят есть с гамбургерами?',
				group = 'Шутки про гамбургеры',
				action = function(slot)
					print('Французские мухи.')
				end
			},
			{
				label = 'Почему бургер и картошка убегали?',
				group = 'Шутки про гамбургеры',
				action = function(slot)
					print('Потому что это фастфуд.')
				end
			}
		},
		consume = 0.3
	},
	
	['mechanic_tools'] = {
    label = "Mechanic tools",
    weight = 0,
    stack = false,
    close = true,
    description = "Needed for vehicle repairs",
    unique = true,
    client = { image = "mechanic_tools.png" },
},

['toolbox'] = {
    label = "Toolbox",
    weight = 0,
    stack = false,
    close = true,
    description = "Needed for Performance part removal",
    unique = true,
    client = { image = "toolbox.png" },
},

['ducttape'] = {
    label = "Duct Tape",
    weight = 0,
    stack = false,
    close = true,
    description = "Good for quick fixes",
    unique = true,
    client = { image = "bodyrepair.png" },
},

['mechboard'] = {
    label = "Mechanic Sheet",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "mechboard.png" },
},

-- Performance
['turbo'] = {
    label = "Supercharger Turbo",
    weight = 0,
    stack = false,
    close = true,
    description = "Who doesn't need a 65mm Turbo??",
    unique = true,
    client = { image = "turbo.png" },
},

['car_armor'] = {
    label = "Vehicle Armor",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "armour.png" },
},

['nos'] = {
    label = "NOS Bottle",
    weight = 0,
    stack = false,
    close = true,
    description = "A full bottle of NOS",
    unique = true,
    client = { image = "nos.png" },
},

['noscan'] = {
    label = "Empty NOS Bottle",
    weight = 0,
    stack = true,
    close = true,
    description = "An Empty bottle of NOS",
    unique = false,
    client = { image = "noscan.png" },
},

['noscolour'] = {
    label = "NOS Colour Injector",
    weight = 0,
    stack = true,
    close = true,
    description = "Make that purge spray",
    unique = false,
    client = { image = "noscolour.png" },
},

['engine1'] = {
    label = "Tier 1 Engine",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "engine1.png" },
},

['engine2'] = {
    label = "Tier 2 Engine",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "engine2.png" },
},

['engine3'] = {
    label = "Tier 3 Engine",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "engine3.png" },
},

['engine4'] = {
    label = "Tier 4 Engine",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "engine4.png" },
},

['engine5'] = {
    label = "Tier 5 Engine",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "engine5.png" },
},

['transmission1'] = {
    label = "Tier 1 Transmission",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "transmission1.png" },
},

['transmission2'] = {
    label = "Tier 2 Transmission",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "transmission2.png" },
},

['transmission3'] = {
    label = "Tier 3 Transmission",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "transmission3.png" },
},

['transmission4'] = {
    label = "Tier 4 Transmission",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "transmission4.png" },
},

['brakes1'] = {
    label = "Tier 1 Brakes",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "brakes1.png" },
},

['brakes2'] = {
    label = "Tier 2 Brakes",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "brakes2.png" },
},

['brakes3'] = {
    label = "Tier 3 Brakes",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "brakes3.png" },
},

['suspension1'] = {
    label = "Tier 1 Suspension",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "suspension1.png" },
},

['suspension2'] = {
    label = "Tier 2 Suspension",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "suspension2.png" },
},

['suspension3'] = {
    label = "Tier 3 Suspension",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "suspension3.png" },
},

['suspension4'] = {
    label = "Tier 4 Suspension",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "suspension4.png" },
},

['suspension5'] = {
    label = "Tier 5 Suspension",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "suspension5.png" },
},

['bprooftires'] = {
    label = "Bulletproof Tires",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "bprooftires.png" },
},

['drifttires'] = {
    label = "Drift Tires",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "drifttires.png" },
},

-- Cosmetics
['underglow_controller'] = {
    label = "Neon Controller",
    weight = 0,
    stack = true,
    close = true,
    description = "RGB LED Vehicle Remote",
    unique = false,
    client = { image = "underglow_controller.png" },
},

['headlights'] = {
    label = "Xenon Headlights",
    weight = 0,
    stack = false,
    close = true,
    description = "8k HID headlights",
    unique = true,
    client = { image = "headlights.png" },
},

['tint_supplies'] = {
    label = "Tint Supplies",
    weight = 0,
    stack = true,
    close = true,
    description = "Supplies for window tinting",
    unique = false,
    client = { image = "tint_supplies.png" },
},

['customplate'] = {
    label = "Customized Plates",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "plate.png" },
},

['hood'] = {
    label = "Vehicle Hood",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "hood.png" },
},

['roof'] = {
    label = "Vehicle Roof",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "roof.png" },
},

['spoiler'] = {
    label = "Vehicle Spoiler",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "spoiler.png" },
},

['bumper'] = {
    label = "Vehicle Bumper",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "bumper.png" },
},

['skirts'] = {
    label = "Vehicle Skirts",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "skirts.png" },
},

['exhaust'] = {
    label = "Vehicle Exhaust",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "exhaust.png" },
},

['seat'] = {
    label = "Seat Cosmetics",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "seat.png" },
},

['rollcage'] = {
    label = "Roll Cage",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "rollcage.png" },
},

['rims'] = {
    label = "Custom Wheel Rims",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "rims.png" },
},

['livery'] = {
    label = "Livery Roll",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "livery.png" },
},

['paintcan'] = {
    label = "Vehicle Spray Can",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "spraycan.png" },
},

['tires'] = {
    label = "Drift Smoke Tires",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "tires.png" },
},

['horn'] = {
    label = "Custom Vehicle Horn",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "horn.png" },
},

['internals'] = {
    label = "Internal Cosmetics",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "internals.png" },
},

['externals'] = {
    label = "Exterior Cosmetics",
    weight = 0,
    stack = false,
    close = true,
    description = "",
    unique = true,
    client = { image = "mirror.png" },
},

-- Repair Parts
['newoil'] = {
    label = "Car Oil",
    weight = 0,
    stack = true,
    close = false,
    description = "",
    unique = false,
    client = { image = "caroil.png" },
},

['sparkplugs'] = {
    label = "Spark Plugs",
    weight = 0,
    stack = true,
    close = false,
    description = "",
    unique = false,
    client = { image = "sparkplugs.png" },
},

['carbattery'] = {
    label = "Car Battery",
    weight = 0,
    stack = true,
    close = false,
    description = "",
    unique = false,
    client = { image = "carbattery.png" },
},

['axleparts'] = {
    label = "Axle Parts",
    weight = 0,
    stack = true,
    close = false,
    description = "",
    unique = false,
    client = { image = "axleparts.png" },
},

['sparetire'] = {
    label = "Spare Tire",
    weight = 0,
    stack = false,
    close = false,
    description = "",
    unique = true,
    client = { image = "sparetire.png" },
},

["acid"] = {
	label = "Synthetic Acid",
	weight = 1,
	stack = true,
	close = true,
	description = "Material - Synthetic Acid",
	client = {
		image = "acid.png",
	}
},

	['bandage'] = {
		label = 'Бинт',
		weight = 30, -- бинт весит около 30 г
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Грязные деньги',
	},
	
	['bubble'] = {
    	label = 'Газировка Bubble',
    	weight = 330, -- стандартная банка газировки 330 мл
		consume = 1,
    	client = {
        	status = { thirst = 35000 },
        	anim = 'drinking',
        	prop = 'bubble',
        	usetime = 2500,
        	notification = 'Вы выпили газировку Bubble'
    	},
	},
	['champagne'] = {
    	label = 'Шампанское',
    	weight = 750, -- бутылка шампанского 0.75л ~750 г
		consume = 1,
    	client = {
        	status = { thirst = 25000 },
        	anim = 'drinking',
        	prop = 'champagne',
        	usetime = 3000,
        	notification = 'Вы выпили шампанское',
        	effect = { type = 'drunk', time = 60 }
    	},
	},
	['chips'] = {
    	label = 'Чипсы',
    	weight = 90, -- пачка чипсов ~90 г
		consume = 1,
    	client = {
        	status = { hunger = 18000 },
        	anim = 'eating',
        	prop = 'chips',
        	usetime = 1800,
        	notification = 'Вы съели чипсы'
    	},
	},
	['chocolat'] = {
    	label = 'Шоколад',
    	weight = 100, -- стандартная плитка шоколада ~100 г
		consume = 1,
    	client = {
        	status = { hunger = 12000 },
        	anim = 'eating',
        	prop = 'chocolat',
        	usetime = 1600,
        	notification = 'Вы съели шоколад'
    	},
	},
	['COCKTAIL_cappucino'] = {
    	label = 'Капучино',
    	weight = 220, -- средний стакан ~220 г
		consume = 1,
    	client = {
        	status = { thirst = 20000 },
        	anim = 'drinking',
        	prop = 'COCKTAIL_cappucino',
        	usetime = 2000,
        	notification = 'Вы выпили капучино'
    	},
	},
	['COCKTAIL_greenTea'] = {
    	label = 'Зелёный чай',
    	weight = 200, -- чашка чая ~200 г
		consume = 1,
    	client = {
        	status = { thirst = 18000 },
        	anim = 'drinking',
        	prop = 'COCKTAIL_greenTea',
        	usetime = 2000,
        	notification = 'Вы выпили зелёный чай'
    	},
	},
	['COCKTAIL_TEA'] = {
    	label = 'Чёрный чай',
    	weight = 200,
		consume = 1,
    	client = {
        	status = { thirst = 17000 },
        	anim = 'drinking',
        	prop = 'COCKTAIL_TEA',
        	usetime = 2000,
        	notification = 'Вы выпили чай'
    	},
	},
	['cola'] = {
    	label = 'Кола',
    	weight = 500,
		consume = 1,
    	client = {
        	status = { thirst = 30000 },
        	anim = 'drinking',
        	prop = 'cola',
        	usetime = 2000,
        	notification = 'Вы выпили колу'
    	},
	},
	['GlassJuice_mandarin2'] = {
    	label = 'Мандариновый сок',
    	weight = 250, -- стакан ~250 г
		consume = 1,
    	client = {
        	status = { thirst = 25000 },
        	anim = 'drinking',
        	prop = 'GlassJuice_mandarin2',
        	usetime = 2000,
        	notification = 'Вы выпили мандариновый сок'
    	},
	},
	['sprunk'] = {
    	label = 'Спранк',
    	weight = 330,
		consume = 1,
    	client = {
        	status = { thirst = 30000 },
        	anim = 'drinking',
        	prop = 'sprunk',
        	usetime = 2000,
        	notification = 'Вы выпили спранк'
    	},
	},
	['water_bottle'] = {
    	label = 'Бутылка воды',
    	weight = 500, -- 0.5л воды
		consume = 1,
    	client = {
        	status = { thirst = 40000 },
        	anim = 'drinking',
        	prop = 'water_bottle',
        	usetime = 2000,
        	notification = 'Вы выпили воду'
    	},
	},
	['whiskey'] = {
    	label = 'Виски',
    	weight = 700, -- бутылка виски 0.7л
		consume = 1,
    	client = {
        	status = { thirst = 12000 },
        	anim = 'drinking',
        	prop = 'whiskey',
        	usetime = 3000,
        	notification = 'Вы выпили виски',
        	effect = { type = 'drunk', time = 120 }
    	},
	},
	['yogurt'] = {
    	label = 'Йогурт',
    	weight = 125, -- стандартный стаканчик йогурта
		consume = 1,
    	client = {
        	status = { hunger = 9000, thirst = 5000 },
        	anim = 'eating',
        	prop = 'yogurt',
        	usetime = 1500,
        	notification = 'Вы съели йогурт'
    	},
	},

	['burger'] = {
		label = 'Бургер',
		weight = 220,
		consume = 1,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'Вы съели вкусный бургер'
		},
	},

	['sprunk'] = {
		label = 'Спранк',
		weight = 330,
		consume = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'Вы утолили жажду спранком'
		}
	},

	['parachute'] = {
		label = 'Парашют',
		weight = 6500, -- спортивный парашют ~6.5 кг
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Мусор',
	},
	
	['contact_pimp'] = {
		label = 'Контакт для сутенера',
	},
	['privat_dostup'] = {
		label = 'Доступ к привату',
	},
	['paint'] = {
		label = 'Баллончик с краской',
	},
	['stencil'] = {
		label = 'Трафарет',
	},

	['paperbag'] = {
		label = 'Бумажный пакет',
		weight = 5, -- бумажный пакет ~5 г
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Удостоверение личности',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Трусики',
		weight = 20, -- около 20 г
		consume = 1,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Отмычка',
		weight = 40, -- отмычка ~40 г
	},

	['phone'] = {
		label = 'Телефон',
		weight = 180, -- телефон ~180 г
		stack = false,
		consume = 0,
		client = {
			export = "lb-phone.UsePhoneItem",

			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
					TriggerEvent("lb-phone:itemAdded")
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
					TriggerEvent("lb-phone:itemRemoved")
				end
			end
		}
	},

	['money'] = {
		label = 'Деньги',
	},

	['mustard'] = {
		label = 'Горчица',
		weight = 250, -- тюбик горчицы ~250г
		consume = 1,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'Вы... выпили горчицу'
		}
	},

	['water'] = {
		label = 'Вода',
		weight = 500,
		consume = 1,
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Вы выпили освежающую воду'
		}
	},

['radio'] = {
	label = 'Radio',
	weight = 1000,
	allowArmed = true,
	consume = 0,
	client = {
		event = 'mm_radio:client:use'
	}
},

['jammer'] = {
	label = 'Radio Jammer',
	weight = 10000,
	allowArmed = true,
	client = {
		event = 'mm_radio:client:usejammer'
	}
},

['radiocell'] = {
	label = 'AAA Cells',
	weight = 1000,
	stack = true,
	allowArmed = true,
	client = {
		event = 'mm_radio:client:recharge'
	}
},

	['armour'] = {
		label = 'Бронежилет',
		weight = 8500, -- бронежилет ~8.5 кг
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Одежда',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Карта Fleeca',
		stack = false,
		weight = 5, -- пластиковая карта ~5 г
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Металлолом',
		weight = 80,
	},

	["fitbit"] = {
		label = "Фитбит",
		weight = 30, -- фитнес-браслет ~30 г
		stack = false,
		close = true,
		description = "Мне нравится fitbit",
		client = {
			image = "fitbit.png",
		}
	},

	["tactical_muzzle_brake"] = {
		label = "Тактический тормозной раструб",
		weight = 600, -- дульный тормоз ~600 г
		stack = true,
		close = true,
		description = "Тактический тормозной раструб для оружия",
		client = {
			image = "tactical_muzzle_brake.png",
		}
	},

	["wet_classic_phone"] = {
		label = "Мокрый классический телефон",
		weight = 180,
		stack = false,
		close = true,
		description = "Вы правда думали, что купаться в океане с телефоном — хорошая идея?",
		client = {
			image = "wet_classic_phone.png",
		}
	},

	["wet_greenlight_phone"] = {
		label = "Мокрый Green Light телефон",
		weight = 180,
		stack = false,
		close = true,
		description = "Говорят, Quasar Smartphone такой же, как iPhone, а вы как думаете?",
		client = {
			image = "wet_greenlight_phone.png",
		}
	},

	["largescope_attachment"] = {
		label = "Большой прицел",
		weight = 900,
		stack = true,
		close = true,
		description = "Большой прицел для оружия",
		client = {
			image = "largescope_attachment.png",
		}
	},

	["bag"] = {
		label = "Сумка",
		weight = 500, -- тканевая сумка ~0.5 кг
		stack = false,
		close = true,
		description = "Сумка",
		client = {
			image = "bag.png",
		}
	},

	["wet_phone"] = {
		label = "Мокрый телефон",
		weight = 180,
		stack = false,
		close = true,
		description = "Вы правда думали, что купаться в океане с телефоном — хорошая идея?",
		client = {
			image = "wet_classic_phone.png",
		}
	},

	["wine"] = {
		label = "Вино",
		weight = 750, -- бутылка вина 0.75л
		stack = true,
		close = false,
		description = "Хорошее вино для выпивания в приятный вечер",
		client = {
			image = "wine.png",
		}
	},

	["police_stormram"] = {
		label = "Полицейский таран",
		weight = 9000, -- ~9 кг
		stack = true,
		close = true,
		description = "Описание отсутствует.",
		client = {
			image = "police_stormram.png",
		}
	},

	["suppressor_attachment"] = {
		label = "Глушитель",
		weight = 350, -- глушитель ~350 г
		stack = true,
		close = true,
		description = "Глушитель для оружия",
		client = {
			image = "suppressor_attachment.png",
		}
	},

	["veh_xenons"] = {
		label = "Ксеноновые фары",
		weight = 1200, -- комплект ксеноновых фар ~1.2 кг
		stack = true,
		close = true,
		description = "Улучшить ксеноновые фары транспортного средства",
		client = {
			image = "veh_xenons.png",
		}
	},

	["steel"] = {
	label = "Сталь",
	weight = 300, -- кусок стали ~300 г
	stack = true,
	close = false,
	description = "Хороший кусочек металла, который, возможно, можно использовать для чего-то",
	client = {
		image = "steel.png",
	}
},

["goldbar"] = {
	label = "Золотой слиток",
	weight = 7000, -- стандартный слиток ~7 кг
	stack = true,
	close = true,
	description = "Кажется, довольно дорого",
	client = {
		image = "goldbar.png",
	}
},

["weed_amnesia_seed"] = {
	label = "Семя Amnesia",
	weight = 1, -- семечко ~1 г
	stack = true,
	close = true,
	description = "Описание отсутствует.",
	client = {
		image = "weed_amnesia_seed.png",
	}
},

["ironoxide"] = {
	label = "Железный порошок",
	weight = 100, -- порошок ~100 г
	stack = true,
	close = false,
	description = "Немного порошка для смешивания.",
	client = {
		image = "ironoxide.png",
	}
},

["vodka"] = {
	label = "Водка",
	weight = 500, -- бутылка 0.5 л ~500 г
	stack = true,
	close = true,
	description = "Для всех испытывающих жажду",
	client = {
		image = "vodka.png",
	}
},

["coke_brick"] = {
	label = "Брикет кокаина",
	weight = 1000, -- 1 кг
	stack = false,
	close = true,
	description = "Тяжелая упаковка кокаина, в основном используется для сделок и занимает много места",
	client = {
		image = "coke_brick.png",
	}
},

["kurkakola"] = {
	label = "Кола",
	weight = 330, -- банка ~330 г
	stack = true,
	close = true,
	description = "Для всех испытывающих жажду",
	client = {
		image = "cola.png",
	}
},

["red_phone"] = {
	label = "Красный телефон",
	weight = 180, -- смартфон ~180 г
	stack = false,
	close = true,
	description = "Говорят, Quasar Smartphone такой же, как iPhone, а вы как думаете?",
	client = {
		image = "red_phone.png",
	}
},

["weed_skunk_seed"] = {
	label = "Семя Skunk",
	weight = 1,
	stack = true,
	close = true,
	description = "Описание отсутствует.",
	client = {
		image = "weed_skunk_seed.png",
	}
},

["weaponlicense"] = {
	label = "Лицензия на оружие",
	weight = 5, -- пластиковая карта ~5 г
	stack = false,
	close = true,
	description = "Лицензия на оружие",
	client = {
		image = "weapon_license.png",
	},
	server = {
		export = 'um-idcard.weaponlicense'
	}
},

["phone_hack"] = {
	label = "Чип для взлома телефона",
	weight = 50, -- чип ~50 г
	stack = false,
	close = true,
	description = "С этим чипом вы можете получить доступ к скрытым областям Discord.",
	client = {
		image = "phone_hack.png",
	}
},

["crack_baggy"] = {
	label = "Пакетик крэка",
	weight = 10, -- маленький пакетик ~10 г
	stack = true,
	close = true,
	description = "Чтобы быстрее обрадоваться",
	client = {
		image = "crack_baggy.png",
	}
},

["handcuffs"] = {
	label = "Наручники",
	weight = 340, -- металлические наручники ~340 г
	stack = true,
	close = false,
	description = "Наручники",
	client = {
		image = "handcuffs.png",
	}
},

["filled_evidence_bag"] = {
	label = "Сумка с уликами",
	weight = 200, -- пакет с уликами ~200 г
	stack = false,
	close = false,
	description = "Наполненная сумка с уликами, чтобы вычислить виновного >:(",
	client = {
		image = "evidence.png",
	}
},

["black_phone"] = {
	label = "Черный телефон",
	weight = 180,
	stack = false,
	close = true,
	description = "Говорят, Quasar Smartphone такой же, как iPhone, а вы как думаете?",
	client = {
		image = "black_phone.png",
	}
},

["iphone"] = {
	label = "Телефон",
	weight = 180,
	stack = true,
	close = true,
	description = "Дорогой телефон",
	client = {
		image = "iphone.png",
	}
},

["labkey"] = {
	label = "Ключ",
	weight = 80, -- ключ металлический ~80 г
	stack = false,
	close = true,
	description = "Ключ от замка...?",
	client = {
		image = "labkey.png",
	}
},

["aluminumoxide"] = {
	label = "Алюминиевый порошок",
	weight = 100,
	stack = true,
	close = false,
	description = "Немного порошка для смешивания",
	client = {
		image = "aluminumoxide.png",
	}
},

["wet_gold_phone"] = {
	label = "Мокрый золотой телефон",
	weight = 180,
	stack = false,
	close = true,
	description = "Вы правда думали, что купаться в океане с телефоном — хорошая идея?",
	client = {
		image = "wet_gold_phone.png",
	}
},

["weed_og-kush"] = {
	label = "Трава OG Kush",
	weight = 150, -- стандартная фасовка ~150 г
	stack = true,
	close = true,
	description = "Описание отсутствует.",
	client = {
		image = "weed_og-kush.png",
	}
},

["skullcamo_attachment"] = {
	label = "Камуфляж 'Череп'",
	weight = 400, -- камуфляж накладка ~400 г
	stack = true,
	close = true,
	description = "Камуфляж для оружия с черепом",
	client = {
		image = "skullcamo_attachment.png",
	}
},

["coke_small_brick"] = {
	label = "Пакет кокаина",
	weight = 350, -- 350 г
	stack = false,
	close = true,
	description = "Маленький пакет кокаина, в основном используется для сделок и занимает много места",
	client = {
		image = "coke_small_brick.png",
	}
},

["precision_muzzle_brake"] = {
	label = "Точный тормозной раструб",
	weight = 600, -- тормозной раструб ~600 г
	stack = true,
	close = true,
	description = "Тормозной раструб для оружия",
	client = {
		image = "precision_muzzle_brake.png",
	}
},

["advancedrepairkit"] = {
	label = "Продвинутый набор для ремонта",
	weight = 5000, -- набор инструментов ~5 кг
	stack = true,
	close = true,
	description = "Хороший ящик с инструментами для ремонта вашего транспортного средства",
	client = {
		image = "advancedkit.png",
	}
},

["diving_fill"] = {
	label = "Дайвинг-трубка",
	weight = 3000, -- комплект с баллоном ~3 кг
	stack = false,
	close = true,
	description = "Трубка с кислородом и ребрит",
	client = {
		image = "diving_tube.png",
	}
},

["empty_weed_bag"] = {
	label = "Пустой пакетик для травки",
	weight = 5, -- пустой пакетик ~5 г
	stack = true,
	close = true,
	description = "Описание отсутствует.",
	client = {
		image = "empty_weed_bag.png",
	}
},

["moneybag"] = {
	label = "Мешок с деньгами",
	weight = 2500, -- мешок с купюрами ~2.5 кг
	stack = false,
	close = true,
	description = "Сумка с наличными",
	client = {
		image = "moneybag.png",
	}
},

["veh_exterior"] = {
	label = "Экстерьер",
	weight = 2000, -- комплект тюнинга ~2 кг
	stack = true,
	close = true,
	description = "Улучшить внешний вид транспортного средства",
	client = {
		image = "veh_exterior.png",
	}
},

["powerbank"] = {
	label = "Повербанк",
	weight = 300, -- повербанк ~300 г
	stack = false,
	close = true,
	description = "Невероятно портативная зарядка!",
	client = {
		image = "powerbank.png",
	}
},

["markedbills"] = {
	label = "Маркированные деньги",
	weight = 1000,
	stack = false,
	close = true,
	description = "Деньги?",
	client = {
		image = "markedbills.png",
	}
},

["wet_green_phone"] = {
	label = "Мокрый зелёный телефон",
	weight = 180,
	stack = false,
	close = true,
	description = "Говорят, Quasar Smartphone такой же, как iPhone, а вы как думаете?",
	client = {
		image = "wet_green_phone.png",
	}
},

["nitrous"] = {
	label = "Нитро",
	weight = 3500, -- баллон ~3.5 кг
	stack = true,
	close = true,
	description = "Ускорься, педаль газа! :D",
	client = {
		image = "nitrous.png",
	}
},

["advscope_attachment"] = {
	label = "Продвинутый прицел",
	weight = 900, -- оптика ~900 г
	stack = true,
	close = true,
	description = "Продвинутый прицел для оружия",
	client = {
		image = "advscope_attachment.png",
	}
},

["laptop"] = {
	label = "Ноутбук",
	weight = 2200, -- ноутбук ~2.2 кг
	stack = true,
	close = true,
	description = "Дорогой ноутбук",
	client = {
		image = "laptop.png",
	}
},

["green_phone"] = {
	label = "Зелёный телефон",
	weight = 180,
	stack = false,
	close = true,
	description = "Говорят, Quasar Smartphone такой же, как iPhone, а вы как думаете?",
	client = {
		image = "green_phone.png",
	}
},

["ifaks"] = {
	label = "ИФАК",
	weight = 250, -- набор первой помощи ~250 г
	stack = true,
	close = true,
	description = "ИФАК для лечения и полного удаления стресса.",
	client = {
		image = "ifaks.png",
	}
},

["weed_whitewidow_seed"] = {
	label = "Семя Белой вдовы",
	weight = 1,
	stack = true,
	close = false,
	description = "Семя марихуаны Белой вдовы",
	client = {
		image = "weed_seed.png",
	}
},

["casinochips"] = {
	label = "Фишки казино",
	weight = 5, -- одна фишка ~5 г
	stack = true,
	close = false,
	description = "Фишки для азартных игр в казино",
	client = {
		image = "casinochips.png",
	}
},

["firework2"] = {
	label = "Поппелеры",
	weight = 1000, -- упаковка фейерверков ~1 кг
	stack = true,
	close = true,
	description = "Фейерверки",
	client = {
		image = "firework2.png",
	}
},

["zebracamo_attachment"] = {
	label = "Камуфляж 'Зебра'",
	weight = 400,
	stack = true,
	close = true,
	description = "Камуфляж для оружия с узором зебры",
	client = {
		image = "zebracamo_attachment.png",
	}
},

["heavyarmor"] = {
	label = "Тяжёлая броня",
	weight = 9000, -- тяжёлый бронежилет ~9 кг
	stack = true,
	close = true,
	description = "Немного защиты не повредит... верно?",
	client = {
		image = "armor.png",
	}
},

["diamond_ring"] = {
	label = "Бриллиантовое кольцо",
	weight = 5, -- кольцо ~5 г
	stack = true,
	close = true,
	description = "Бриллиантовое кольцо кажется мне джекпотом!",
	client = {
		image = "diamond_ring.png",
	}
},

["empty_evidence_bag"] = {
	label = "Пустая сумка для улик",
	weight = 5, -- пустая сумка ~5 г
	stack = true,
	close = false,
	description = "Часто используется для хранения ДНК из крови, гильз и многое другое",
	client = {
		image = "evidence.png",
	}
},
	
["evidencebag"] = {
	label = 'Сумка для улик',
	weight = 100,
	stack = false,
	close = true,
	description = 'Используется для сбора и хранения улик на месте преступления',
	useable = true,
	client = {
		export = 'dp-evidencebag.openEvidenceBag'
	}
},

["samsungphone"] = {
	label = "Samsung S10",
	weight = 180,
	stack = true,
	close = true,
	description = "Очень дорогой телефон",
	client = {
		image = "samsungphone.png",
	}
},

["jeans"] = {
	label = "Джинсы",
	weight = 500, -- джинсы ~0.5 кг
	stack = false,
	close = true,
	description = "Джинсы",
	client = {
		image = "jeans.png",
	}
},

["wet_red_phone"] = {
	label = "Мокрый красный телефон",
	weight = 180,
	stack = false,
	close = true,
	description = "Вы правда думали, что купаться в океане с телефоном — хорошая идея?",
	client = {
		image = "wet_red_phone.png",
	}
},

["brushcamo_attachment"] = {
	label = "Камуфляж 'Браш'",
	weight = 400,
	stack = true,
	close = true,
	description = "Камуфляж для оружия с мазками кисти",
	client = {
		image = "brushcamo_attachment.png",
	}
},

["cuff"] = {
	label = "Наручники (каб. стяжка)",
	weight = 60, -- пластиковая стяжка ~60 г
	stack = true,
	close = true,
	description = "Ваше описание здесь",
	client = {
		image = "cuff.png",
	}
},

["comp_attachment"] = {
	label = "Компенсатор",
	weight = 350, -- компенсатор ~350 г
	stack = true,
	close = true,
	description = "Компенсатор для оружия",
	client = {
		image = "comp_attachment.png",
	}
},

["armor"] = {
	label = "Броня",
	weight = 8000, -- бронежилет ~8 кг
	stack = true,
	close = true,
	description = "Немного защиты не повредит... верно?",
	client = {
		image = "armor.png",
	}
},

["barrel_attachment"] = {
	label = "Ствол",
	weight = 1000, -- стальной ствол ~1 кг
	stack = true,
	close = true,
	description = "Ствол для оружия",
	client = {
		image = "barrel_attachment.png",
	}
},
	["goldchain"] = {
		label = "Золотая цепочка",
		weight = 1500,
		stack = true,
		close = true,
		description = "Золотая цепочка кажется мне джекпотом!",
		client = {
			image = "goldchain.png",
		}
	},

	["trojan_usb"] = {
		label = "Троянский USB",
		weight = 0,
		stack = true,
		close = true,
		description = "Удобное программное обеспечение для отключения некоторых систем",
		client = {
			image = "usb_device.png",
		}
	},

	["veh_neons"] = {
		label = "Неоны",
		weight = 1000,
		stack = true,
		close = true,
		description = "Улучшить неоны транспортного средства",
		client = {
			image = "veh_neons.png",
		}
	},

	["key"] = {
		label = "Armbrace",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "key.png",
		}
	},

	["bolt_cutters"] = {
		label = "Bolt cutters",
		weight = 10,
		stack = true,
		close = false,
		description = "Useful for cutting handcuffs",
		client = {
			image = "bolt_cutters.png",
		}
	},

	["dendrogyra_coral"] = {
		label = "Дендрогира",
		weight = 1000,
		stack = true,
		close = true,
		description = "Также известен как столповая коралловая порода",
		client = {
			image = "dendrogyra_coral.png",
		}
	},

	["cokebaggy"] = {
		label = "Пакет кокаина",
		weight = 0,
		stack = true,
		close = true,
		description = "Чтобы быстро обрадоваться",
		client = {
			image = "cocaine_baggy.png",
		}
	},

	["twerks_candy"] = {
		label = "Конфеты Тверкс",
		weight = 100,
		stack = true,
		close = true,
		description = "Вкусные конфеты :O",
		client = {
			image = "twerks_candy.png",
		}
	},

	["wet_black_phone"] = {
		label = "Wet Black Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_black_phone.png",
		}
	},

	["greenlight_phone"] = {
		label = "Green Light Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "greenlight_phone.png",
		}
	},

	["weed_white-widow_seed"] = {
		label = "White Widow seed",
		weight = 50,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_white-widow_seed.png",
		}
	},

	["firework4"] = {
		label = "Weeping Willow",
		weight = 1000,
		stack = true,
		close = true,
		description = "Фейерверки",
		client = {
			image = "firework4.png",
		}
	},

	["smallscope_attachment"] = {
		label = "Маленький прицел",
		weight = 1000,
		stack = true,
		close = true,
		description = "Маленький прицел для оружия",
		client = {
			image = "smallscope_attachment.png",
		}
	},

	["lawyerpass"] = {
		label = "Пропуск адвоката",
		weight = 0,
		stack = false,
		close = false,
		description = "Пропуск эксклюзивно для адвокатов, чтобы показать, что они могут представлять подозреваемого",
		client = {
			image = "lawyerpass.png",
		},
		server = {
			export = 'um-idcard.lawyerpass'
		}
	},

	["id_card"] = {
		label = "ID карта",
		weight = 0,
		stack = false,
		close = false,
		description = "Основной документ гражданина США",
		client = {
			image = "id_card.png"
		},
		server = {
			export = 'um-idcard.id_card'
		}
	},

	["squared_muzzle_brake"] = {
		label = "Квадратный тормозной раструб",
		weight = 1000,
		stack = true,
		close = true,
		description = "Тормозной раструб для оружия",
		client = {
			image = "squared_muzzle_brake.png",
		}
	},

	["vehiclekey"] = {
		label = "Ключи от транспорта",
		weight = 10,
		stack = false,
		close = true,
		description = "ключи от транспорта",
		client = {
			image = "vehiclekeys.png",
		}
	},

	["xtcbaggy"] = {
		label = "Пакет экстази",
		weight = 0,
		stack = true,
		close = true,
		description = "Попробуйте эти таблетки, детка",
		client = {
			image = "xtc_baggy.png",
		}
	},

	["glass"] = {
		label = "Стекло",
		weight = 100,
		stack = true,
		close = false,
		description = "Оно очень хрупкое, будьте осторожны",
		client = {
			image = "glass.png",
		}
	},

	["certificate"] = {
		label = "Сертификат",
		weight = 0,
		stack = true,
		close = true,
		description = "Сертификат, подтверждающий ваше право собственности на определенные вещи",
		client = {
			image = "certificate.png",
		}
	},

	["weed_purple-haze_seed"] = {
		label = "Purple Haze seed",
		weight = 50,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_purple-haze_seed.png",
		}
	},

	["diving_gear"] = {
		label = "Дайвинг-снаряжение",
		weight = 30000,
		stack = false,
		close = true,
		description = "Баллон с кислородом и ребрит",
		client = {
			image = "diving_gear.png",
		}
	},

	["firstaid"] = {
		label = "Первая помощь",
		weight = 2500,
		stack = true,
		close = true,
		description = "Вы можете использовать этот набор для оказания помощи людям",
		client = {
			image = "firstaid.png",
		}
	},

	["lighter"] = {
		label = "Зажигалка",
		weight = 0,
		stack = true,
		close = true,
		description = "В канун Нового года хороший огонек, около которого постоять",
		client = {
			image = "lighter.png",
		}
	},

	["newsbmic"] = {
		label = "Бум-микрофон",
		weight = 100,
		stack = false,
		close = true,
		description = "Пригодный Бум-микрофон",
		client = {
			image = "newsbmic.png",
		}
	},

	["tirerepairkit"] = {
		label = "Набор для ремонта шин",
		weight = 1000,
		stack = true,
		close = true,
		description = "Набор для ремонта ваших шин",
		client = {
			image = "tirerepairkit.png",
		}
	},

	["10kgoldchain"] = {
		label = "Золотая цепочка 10 карат",
		weight = 2000,
		stack = true,
		close = true,
		description = "Золотая цепочка 10 карат",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["phone_module"] = {
		label = "Phone Module",
		weight = 300,
		stack = false,
		close = true,
		description = "It seems that we can fix a wet phone with this module, interesting.",
		client = {
			image = "phone_module.png",
		}
	},

	["nvscope_attachment"] = {
		label = "Прицел ночного видения",
		weight = 1000,
		stack = true,
		close = true,
		description = "Прицел ночного видения для оружия",
		client = {
			image = "nvscope_attachment.png",
		}
	},

	["security_card_01"] = {
		label = "Пропуск A",
		weight = 0,
		stack = true,
		close = true,
		description = "Пропуск... Интересно, к чему это относится",
		client = {
			image = "security_card_01.png",
		}
	},

	["sandwich"] = {
		label = "Бутерброд",
		weight = 200,
		stack = true,
		close = true,
		description = "Хороший хлеб для вашего желудка",
		client = {
			image = "sandwich.png",
		}
	},

	["beer"] = {
		label = "Пиво",
		weight = 500,
		stack = true,
		close = true,
		description = "Ничего не так хорошо, как холодное пиво!",
		client = {
			image = "beer.png",
		}
	},

	["thermite"] = {
		label = "Термит",
		weight = 1000,
		stack = true,
		close = true,
		description = "Иногда хочется, чтобы всё сгорело",
		client = {
			image = "thermite.png",
		}
	},

	["flashlight_attachment"] = {
		label = "Фонарик",
		weight = 1000,
		stack = true,
		close = true,
		description = "Фонарик для оружия",
		client = {
			image = "flashlight_attachment.png",
		}
	},

	["medscope_attachment"] = {
		label = "Средний прицел",
		weight = 1000,
		stack = true,
		close = true,
		description = "Средний прицел для оружия",
		client = {
			image = "medscope_attachment.png",
		}
	},

	["aluminum"] = {
		label = "Алюминий",
		weight = 100,
		stack = true,
		close = false,
		description = "Хороший кусочек металла, который, возможно, можно использовать для чего-то",
		client = {
			image = "aluminum.png",
		}
	},

	["fat_end_muzzle_brake"] = {
		label = "Толстый конец тормозного раструба",
		weight = 1000,
		stack = true,
		close = true,
		description = "Тормозной раструб для оружия",
		client = {
			image = "fat_end_muzzle_brake.png",
		}
	},

	["security_card_02"] = {
		label = "Пропуск B",
		weight = 0,
		stack = true,
		close = true,
		description = "Пропуск... Интересно, к чему это относится",
		client = {
			image = "security_card_02.png",
		}
	},

	["glasses"] = {
		label = "Очки",
		weight = 0,
		stack = false,
		close = true,
		description = "Очки",
		client = {
			image = "glasses.png",
		}
	},

	["grape"] = {
		label = "Виноград",
		weight = 100,
		stack = true,
		close = false,
		description = "Мммм, вкусные винограды",
		client = {
			image = "grape.png",
		}
	},

	["ears"] = {
		label = "Уши",
		weight = 0,
		stack = false,
		close = true,
		description = "Уши",
		client = {
			image = "ears.png",
		}
	},

	["veh_transmission"] = {
		label = "Трансмиссия",
		weight = 1000,
		stack = true,
		close = true,
		description = "Улучшить трансмиссию транспортного средства",
		client = {
			image = "veh_transmission.png",
		}
	},

	["grip_attachment"] = {
		label = "Приклад",
		weight = 1000,
		stack = true,
		close = true,
		description = "Приклад для оружия",
		client = {
			image = "grip_attachment.png",
		}
	},

	["iron"] = {
		label = "Железо",
		weight = 100,
		stack = true,
		close = false,
		description = "Удобный кусочек металла, который, возможно, можно использовать для чего-то",
		client = {
			image = "iron.png",
		}
	},

	["tshirt"] = {
		label = "Футболка",
		weight = 0,
		stack = false,
		close = true,
		description = "Футболка",
		client = {
			image = "tshirt.png",
		}
	},

	["zipties"] = {
		label = "Zipties",
		weight = 10,
		stack = true,
		close = false,
		description = "Zipties",
		client = {
			image = "zipties.png",
		}
	},

	["cleaningkit"] = {
		label = "Набор для чистки",
		weight = 250,
		stack = true,
		close = true,
		description = "Микрофибра и немного мыла сделают ваш автомобиль снова блестящим!",
		client = {
			image = "cleaningkit.png",
		}
	},

	["painkillers"] = {
		label = "Болеутоляющие",
		weight = 0,
		stack = true,
		close = true,
		description = "Для боли, которую вы больше не можете вынести, возьмите эту таблетку, которая снова заставит вас чувствовать себя прекрасно",
		client = {
			image = "painkillers.png",
		}
	},

	["slanted_muzzle_brake"] = {
		label = "Наклонный тормозной раструб",
		weight = 1000,
		stack = true,
		close = true,
		description = "Тормозной раструб для оружия",
		client = {
			image = "slanted_muzzle_brake.png",
		}
	},

	["pink_phone"] = {
		label = "Pink Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "pink_phone.png",
		}
	},

	["harness"] = {
		label = "Гоночный ремень",
		weight = 1000,
		stack = false,
		close = true,
		description = "Гоночный ремень, чтобы вы всегда оставались в машине",
		client = {
			image = "harness.png",
		}
	},

	["boomcamo_attachment"] = {
		label = "Boom Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A boom camo for a weapon",
		client = {
			image = "boomcamo_attachment.png",
		}
	},

	["geocamo_attachment"] = {
		label = "Geometric Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A geometric camo for a weapon",
		client = {
			image = "geocamo_attachment.png",
		}
	},

	["arms"] = {
		label = "Руки",
		weight = 0,
		stack = false,
		close = true,
		description = "Руки",
		client = {
			image = "arms.png",
		}
	},

	["drill"] = {
		label = "Дрель",
		weight = 20000,
		stack = true,
		close = false,
		description = "Настоящий инструмент...",
		client = {
			image = "drill.png",
		}
	},

	["advancedlockpick"] = {
		label = "Продвинутая отмычка",
		weight = 500,
		stack = true,
		close = true,
		description = "Если вы часто теряете ключи, это очень полезно... Также полезно для открытия бутылок",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["holoscope_attachment"] = {
		label = "Голографический прицел",
		weight = 1000,
		stack = true,
		close = true,
		description = "Голографический прицел для оружия",
		client = {
			image = "holoscope_attachment.png",
		}
	},

	["veh_armor"] = {
		label = "Броня",
		weight = 1000,
		stack = true,
		close = true,
		description = "Улучшить броню транспортного средства",
		client = {
			image = "veh_armor.png",
		}
	},

	["cryptostick"] = {
		label = "Крипто-палка",
		weight = 200,
		stack = false,
		close = true,
		description = "Зачем бы кто-то купил деньги, которых не существует.. Сколько их в ней будет..?",
		client = {
			image = "cryptostick.png",
		}
	},

	["printerdocument"] = {
		label = "Документ",
		weight = 500,
		stack = false,
		close = true,
		description = "Хороший документ",
		client = {
			image = "printerdocument.png",
		}
	},

	["joint"] = {
		label = "Сигарета с марихуаной",
		weight = 0,
		stack = true,
		close = true,
		description = "Сидни был бы очень горд вами",
		client = {
			image = "joint.png",
		}
	},

	["copper"] = {
		label = "Медь",
		weight = 100,
		stack = true,
		close = false,
		description = "Хороший кусочек металла, который, возможно, можно использовать для чего-то",
		client = {
			image = "copper.png",
		}
	},

	["electronickit"] = {
		label = "Электронный комплект",
		weight = 100,
		stack = true,
		close = true,
		description = "Если вы всегда хотели построить робота, можете начать здесь. Может быть, вы станете новым Илоном Маском?",
		client = {
			image = "electronickit.png",
		}
	},

	["weed_whitewidow"] = {
		label = "Белая вдова 2г",
		weight = 200,
		stack = true,
		close = false,
		description = "Мешок с марихуаной 2 г Белая вдова",
		client = {
			image = "weed_baggy.png",
		}
	},

	["weed_ak47_seed"] = {
		label = "AK47 seed",
		weight = 50,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_ak47_seed.png",
		}
	},

	["blue_phone"] = {
		label = "Blue Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "blue_phone.png",
		}
	},

	["veh_brakes"] = {
		label = "Тормоза",
		weight = 1000,
		stack = true,
		close = true,
		description = "Улучшить тормоза транспортного средства",
		client = {
			image = "veh_brakes.png",
		}
	},

	["pinger"] = {
		label = "Пингер",
		weight = 1000,
		stack = true,
		close = true,
		description = "С помощью пингера и вашего телефона вы можете отправить свое местоположение",
		client = {
			image = "pinger.png",
		}
	},

	["wet_white_phone"] = {
		label = "Wet White Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "wet_white_phone.png",
		}
	},

	["oxy"] = {
		label = "Рецепт Окси",
		weight = 0,
		stack = true,
		close = true,
		description = "Этикетка сорвана",
		client = {
			image = "oxy.png",
		}
	},

	["weed_og-kush_seed"] = {
		label = "OG Kush seed",
		weight = 50,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_og-kush_seed.png",
		}
	},

	["patriotcamo_attachment"] = {
		label = "Patriot Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A patriot camo for a weapon",
		client = {
			image = "patriotcamo_attachment.png",
		}
	},

	["torso"] = {
		label = "Торс",
		weight = 0,
		stack = false,
		close = true,
		description = "Торс",
		client = {
			image = "torso.png",
		}
	},

	["blindfold"] = {
		label = "Blindfold",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "blindfold.png",
		}
	},

	["firework1"] = {
		label = "2Brothers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Фейерверки",
		client = {
			image = "firework1.png",
		}
	},

	["thermalscope_attachment"] = {
		label = "Прицел тепловизионного обзора",
		weight = 1000,
		stack = true,
		close = true,
		description = "Прицел тепловизионного обзора для оружия",
		client = {
			image = "thermalscope_attachment.png",
		}
	},

	["newsmic"] = {
		label = "Новостной микрофон",
		weight = 100,
		stack = false,
		close = true,
		description = "Микрофон для новостей",
		client = {
			image = "newsmic.png",
		}
	},

	["shoes"] = {
		label = "Обувь",
		weight = 0,
		stack = false,
		close = true,
		description = "Обувь",
		client = {
			image = "shoes.png",
		}
	},

	["snikkel_candy"] = {
		label = "Конфеты Сниккель",
		weight = 100,
		stack = true,
		close = true,
		description = "Вкусные конфеты :O",
		client = {
			image = "snikkel_candy.png",
		}
	},

	["driver_license"] = {
		label = "Водительское удостоверение",
		weight = 0,
		stack = false,
		close = false,
		description = "Разрешение на управление транспортным средством",
		client = {
			image = "driver_license.png",
		},
		server = {
			export = 'um-idcard.driver_license'
		}
	},

	["weed_ak47"] = {
		label = "AK47 weed",
		weight = 150,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_ak47.png",
		}
	},

	["veh_tint"] = {
		label = "Тонировка",
		weight = 1000,
		stack = true,
		close = true,
		description = "Установить тонировку в транспортное средство",
		client = {
			image = "veh_tint.png",
		}
	},

	["white_phone"] = {
		label = "White Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "white_phone.png",
		}
	},

	["woodcamo_attachment"] = {
		label = "Woodland Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A woodland camo for a weapon",
		client = {
			image = "woodcamo_attachment.png",
		}
	},

	["veh_engine"] = {
		label = "Двигатель",
		weight = 1000,
		stack = true,
		close = true,
		description = "Улучшить двигатель транспортного средства",
		client = {
			image = "veh_engine.png",
		}
	},

	["gold_phone"] = {
		label = "Gold Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "gold_phone.png",
		}
	},

	["veh_toolbox"] = {
		label = "Ящик с инструментами",
		weight = 1000,
		stack = true,
		close = true,
		description = "Проверьте состояние транспортного средства",
		client = {
			image = "veh_toolbox.png",
		}
	},

    ["redwoodpack"] = {
		label = "Redwood Cigarette Pack",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "redwoodpack.png",
		}
	},

    ["debonairepack"] = {
		label = "Debonaire Cigarette Pack",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "debonairepack.png",
		}
	},

    ["yukonpack"] = {
		label = "Yukon Cigarette Pack",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "yukonpack.png",
		}
	},

    ["sixtyninepack"] = {
		label = "Sixty Nine Cigarette Pack",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "sixtyninepack.png",
		}
	},
	
	
    ["cement"] = {
        label = "Cement",
        weight = 5000,
        stack = true,
        close = true,
        consume = 0,
    },

    ["expensive_sneakers"] = {
        label = "Designer sneakers",
        weight = 1000,
        stack = true,
        close = true,
    },

    ["expensive_bag"] = {
        label = "Designer bag",
        weight = 1000,
        stack = true,
        close = true,
    },

    ["laptop"] = {
        label = "Laptop",
        weight = 1000,
        stack = true,
        close = true,
    },

    ["copper"] = {
        label = "Copper ingot",
        weight = 1000,
        stack = true,
        close = true,
    },

    ["stolen_weapon_case"] = {
        label = "Stolen weapon case",
        weight = 2000,
        stack = true,
        close = true,
        consume = 0,
        server = {
            export = 'kq_smash_n_grab2.LootItem',
        },
    },

    ["stolen_bag"] = {
        label = "Stolen bag",
        weight = 2000,
        stack = true,
        close = true,
        consume = 0,
        server = {
            export = 'kq_smash_n_grab2.LootItem',
        },
    },


    ["cigs"] = {
		label = "Cigarette",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cigs.png",
		}
	},

    ["vape"] = {
		label = "Electronic Vape",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "vape.png",
		}
	},

    ["vapejuice"] = {
		label = "Vape Juice",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "vapejuice.png",
		}
	},

    ["lighter"] = {
		label = "Lighter",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "lighter.png",
		}
	},

	["plastic"] = {
		label = "Пластик",
		weight = 100,
		stack = true,
		close = false,
		description = "Перерабатывай! - Грета Тунберг 2019",
		client = {
			image = "plastic.png",
		}
	},

	["jerry_can"] = {
		label = "Канистра 20 л",
		weight = 20000,
		stack = true,
		close = true,
		description = "Банка полная бензина",
		client = {
			image = "jerry_can.png",
		}
	},

	["mask"] = {
		label = "Маска",
		weight = 0,
		stack = false,
		close = true,
		description = "Маска",
		client = {
			image = "mask.png",
		}
	},

	["repairkit"] = {
		label = "Набор для ремонта",
		weight = 2500,
		stack = true,
		close = true,
		description = "Хороший ящик с инструментами для ремонта вашего транспортного средства",
		client = {
			image = "repairkit.png",
		}
	},

	["screwdriverset"] = {
		label = "Набор отверток",
		weight = 1000,
		stack = true,
		close = false,
		description = "Очень полезно закручивать... винты...",
		client = {
			image = "screwdriverset.png",
		}
	},

	["classic_phone"] = {
		label = "Classic Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "classic_phone.png",
		}
	},

	["weed_amnesia"] = {
		label = "Amnesia weed",
		weight = 150,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_amnesia.png",
		}
	},

	["bank_card"] = {
		label = "Банковская карта",
		weight = 0,
		stack = false,
		close = true,
		description = "Используется для доступа к банкомату",
		client = {
			image = "bank_card.png",
		}
	},

	["gatecrack"] = {
		label = "Gatecrack",
		weight = 0,
		stack = true,
		close = true,
		description = "Удобное программное обеспечение для взлома некоторых заборов",
		client = {
			image = "usb_device.png",
		}
	},

	["tosti"] = {
		label = "Тост с сыром",
		weight = 200,
		stack = true,
		close = true,
		description = "Приятно поесть",
		client = {
			image = "tosti.png",
		}
	},

	["rubber"] = {
		label = "Резина",
		weight = 100,
		stack = true,
		close = false,
		description = "Резина, я думаю, вы можете сделать свою собственную резиновую утку с ней :D",
		client = {
			image = "rubber.png",
		}
	},

	["weed_purplehaze"] = {
		label = "Пурпурный туман 2г",
		weight = 200,
		stack = true,
		close = false,
		description = "Мешок с марихуаной 2 г Пурпурный туман",
		client = {
			image = "weed_baggy.png",
		}
	},

	["grapejuice"] = {
		label = "Виноградный сок",
		weight = 200,
		stack = true,
		close = false,
		description = "Сок из винограда, говорят, что это полезно",
		client = {
			image = "grapejuice.png",
		}
	},

	["veh_plates"] = {
		label = "Пластины",
		weight = 1000,
		stack = true,
		close = true,
		description = "Установить номера на транспортное средство",
		client = {
			image = "veh_plates.png",
		}
	},

	["antipatharia_coral"] = {
		label = "Антипатария",
		weight = 1000,
		stack = true,
		close = true,
		description = "Также известен как черный коралл или шиповатый коралл",
		client = {
			image = "antipatharia_coral.png",
		}
	},

	["weed_purple-haze"] = {
		label = "Purple Haze weed",
		weight = 150,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_purple-haze.png",
		}
	},

	["wet_pink_phone"] = {
		label = "Wet Pink Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "wet_pink_phone.png",
		}
	},

	["radioscanner"] = {
		label = "Радиосканер",
		weight = 1000,
		stack = true,
		close = true,
		description = "С помощью этого вы можете получать некоторые предупреждения от полиции. Однако не на 100% эффективно",
		client = {
			image = "radioscanner.png",
		}
	},

	["weed_brick"] = {
		label = "Блок марихуаны",
		weight = 1000,
		stack = true,
		close = true,
		description = "1 кг кирпичик марихуаны для продажи крупным клиентам.",
		client = {
			image = "weed_brick.png",
		}
	},

	["split_end_muzzle_brake"] = {
	label = "Тормозной раструб с разделенным концом",
	weight = 600, -- облегчённый дульный тормоз ~600 г
	stack = true,
	close = true,
	description = "Тормозной раструб для оружия",
	client = {
		image = "split_end_muzzle_brake.png",
	}
},

["weed_ogkush"] = {
	label = "OGKush 2г",
	weight = 2, -- 2 грамма
	stack = true,
	close = false,
	description = "Мешок с марихуаной 2 г OGKush",
	client = {
		image = "weed_baggy.png",
	}
},

["rope"] = {
	label = "Верёвка",
	weight = 250, -- моток верёвки ~250 г
	stack = true,
	close = true,
	description = "Ваше описание здесь",
	client = {
		image = "rope.png",
	}
},

["newscam"] = {
	label = "Новостная камера",
	weight = 2500, -- камера ~2.5 кг
	stack = false,
	close = true,
	description = "Камера для новостей",
	client = {
		image = "newscam.png",
	}
},

["digicamo_attachment"] = {
	label = "Цифровой камуфляж",
	weight = 400, -- накладка ~400 г
	stack = true,
	close = true,
	description = "Цифровой камуфляж для оружия",
	client = {
		image = "digicamo_attachment.png",
	}
},

["weed_ogkush_seed"] = {
	label = "Семена OGKush",
	weight = 1,
	stack = true,
	close = true,
	description = "Семя марихуаны OGKush",
	client = {
		image = "weed_seed.png",
	}
},

["diamond"] = {
	label = "Бриллиант",
	weight = 5, -- 1 кара́т = 0,2 г, крупный ~5 г
	stack = true,
	close = true,
	description = "Бриллиант кажется мне джекпотом!",
	client = {
		image = "diamond.png",
	}
},

["veh_wheels"] = {
	label = "Колёса",
	weight = 3500, -- комплект дисков ~3.5 кг
	stack = true,
	close = true,
	description = "Улучшить колёса транспортного средства",
	client = {
		image = "veh_wheels.png",
	}
},

["weed_purplehaze_seed"] = {
	label = "Семена Пурпурного тумана",
	weight = 1,
	stack = true,
	close = true,
	description = "Семя марихуаны Пурпурного тумана",
	client = {
		image = "weed_seed.png",
	}
},

["binoculars"] = {
	label = "Бинокль",
	weight = 600, -- бинокль ~600 г
	stack = true,
	close = true,
	description = "Скрытый прослушиватель...",
	client = {
		image = "binoculars.png",
	}
},

["helmet"] = {
	label = "Шлем",
	weight = 1200, -- шлем ~1.2 кг
	stack = false,
	close = true,
	description = "Шлем",
	client = {
		image = "helmet.png",
	}
},

["clip_attachment"] = {
	label = "Магазин",
	weight = 400, -- магазин ~400 г
	stack = true,
	close = true,
	description = "Магазин для оружия",
	client = {
		image = "clip_attachment.png",
	}
},

["wet_blue_phone"] = {
	label = "Мокрый синий телефон",
	weight = 180,
	stack = false,
	close = true,
	description = "Вы правда думали, что купаться в океане с телефоном — хорошая идея?",
	client = {
		image = "wet_blue_phone.png",
	}
},

["luxuryfinish_attachment"] = {
	label = "Роскошная отделка",
	weight = 400,
	stack = true,
	close = true,
	description = "Роскошная отделка для оружия",
	client = {
		image = "luxuryfinish_attachment.png",
	}
},

["firework3"] = {
	label = "WipeOut",
	weight = 800,
	stack = true,
	close = true,
	description = "Фейерверки",
	client = {
		image = "firework3.png",
	}
},

["metalscrap"] = {
	label = "Металлический лом",
	weight = 200, -- куски лома ~200 г
	stack = true,
	close = false,
	description = "С него можно что-то крутое сделать",
	client = {
		image = "metalscrap.png",
	}
},

["weed_skunk"] = {
	label = "Трава Skunk",
	weight = 2,
	stack = true,
	close = true,
	description = "Описание отсутствует.",
	client = {
		image = "weed_skunk.png",
	}
},

["perseuscamo_attachment"] = {
	label = "Камуфляж Perseus",
	weight = 400,
	stack = true,
	close = true,
	description = "Камуфляж Perseus для оружия",
	client = {
		image = "perseuscamo_attachment.png",
	}
},

["flat_muzzle_brake"] = {
	label = "Плоский тормозной раструб",
	weight = 600,
	stack = true,
	close = true,
	description = "Тормозной раструб для оружия",
	client = {
		image = "flat_muzzle_brake.png",
	}
},

["meth"] = {
	label = "Метамфетамин",
	weight = 1,
	stack = true,
	close = true,
	description = "Пакет мета",
	client = {
		image = "meth_baggy.png",
	}
},

["tunerlaptop"] = {
	label = "Тюнинг-чип",
	weight = 400, -- чип ~400 г
	stack = false,
	close = true,
	description = "С этим тюнинг-чипом вы можете получить свой автомобиль на стероидах... Если вы знаете, что делаете",
	client = {
		image = "tunerchip.png",
	}
},

["coffee"] = {
	label = "Кофе",
	weight = 220, -- стакан кофе ~220 г
	stack = true,
	close = true,
	description = "Для подъема тонуса",
	client = {
		image = "coffee.png",
	}
},

["heavy_duty_muzzle_brake"] = {
	label = "Тяжелый тормозной раструб",
	weight = 1000,
	stack = true,
	close = true,
	description = "Тормозной раструб для оружия",
	client = {
		image = "heavy_duty_muzzle_brake.png",
	}
},

["tablet"] = {
	label = "Планшет",
	weight = 500, -- компактный планшет ~0.5 кг
	stack = true,
	close = true,
	description = "Дорогой планшет",
	client = {
		image = "tablet.png",
	}
},

["water_bottle"] = {
	label = "Бутылка воды",
	weight = 500, -- 0.5 литра воды
	stack = true,
	close = true,
	description = "Для всех испытывающих жажду",
	client = {
		image = "water_bottle.png",
	}
},

["veh_turbo"] = {
	label = "Турбо",
	weight = 2200, -- турбокомпрессор ~2.2 кг
	stack = true,
	close = true,
	description = "Установить турбонагнетатель в транспортное средство",
	client = {
		image = "veh_turbo.png",
	}
},

["rolling_paper"] = {
	label = "Бумага для курения",
	weight = 1, -- пачка бумаги ~1 г
	stack = true,
	close = true,
	description = "Бумага, специально созданная для оболочки и курения табака или каннабиса.",
	client = {
		image = "rolling_paper.png",
	}
},

["weed_white-widow"] = {
	label = "Трава White Widow",
	weight = 2,
	stack = true,
	close = true,
	description = "Описание отсутствует.",
	client = {
		image = "weed_white-widow.png",
	}
},

["walkstick"] = {
	label = "Ходунки",
	weight = 800, -- трость ~0.8 кг
	stack = true,
	close = true,
	description = "Ходунки для вас, бабушки.. HAHA",
	client = {
		image = "walkstick.png",
	}
},

["veh_interior"] = {
	label = "Интерьер",
	weight = 2000, -- комплект тюнинга ~2 кг
	stack = true,
	close = true,
	description = "Улучшить интерьер транспортного средства",
	client = {
		image = "veh_interior.png",
	}
},

["leopardcamo_attachment"] = {
	label = "Камуфляж Leopard",
	weight = 400,
	stack = true,
	close = true,
	description = "Камуфляж Leopard для оружия",
	client = {
		image = "leopardcamo_attachment.png",
	}
},

["weed_nutrition"] = {
	label = "Удобрение для марихуаны",
	weight = 500, -- упаковка ~500 г
	stack = true,
	close = true,
	description = "Описание отсутствует.",
	client = {
		image = "weed_nutrition.png",
	}
},

["rolex"] = {
	label = "Золотые часы",
	weight = 150, -- часы ~150 г
	stack = true,
	close = true,
	description = "Золотые часы кажутся мне джекпотом!",
	client = {
		image = "rolex.png",
	}
},

["sessantacamo_attachment"] = {
	label = "Камуфляж Sessanta Nove",
	weight = 400,
	stack = true,
	close = true,
	description = "Камуфляж Sessanta Nove для оружия",
	client = {
		image = "sessantacamo_attachment.png",
	}
},

["drum_attachment"] = {
	label = "Барабан",
	weight = 900, -- барабанный магазин ~900 г
	stack = true,
	close = true,
	description = "Барабан для оружия",
	client = {
		image = "drum_attachment.png",
	}
},

["bellend_muzzle_brake"] = {
	label = "Тормозной раструб с загнутым концом",
	weight = 600,
	stack = true,
	close = true,
	description = "Тормозной раструб для оружия",
	client = {
		image = "bellend_muzzle_brake.png",
	}
},

["veh_suspension"] = {
	label = "Подвеска",
	weight = 3000, -- комплект подвески ~3 кг
	stack = true,
	close = true,
	description = "Улучшить подвеску транспортного средства",
	client = {
		image = "veh_suspension.png",
	}
},

["stickynote"] = {
	label = "Записка",
	weight = 3, -- бумажка ~3 г
	stack = false,
	close = false,
	description = "Иногда удобно что-то запомнить :)",
	client = {
		image = "stickynote.png",
	}
},

['vehiclekeys'] = {
	label = 'Ключи от транспорта',
	weight = 50, -- связка ключей ~50 г
	stack = false,
	close = true,
},

['keys'] = {
	label = 'Ключи от двери',
	weight = 50,
	stack = false,
	close = true,
},

["stretcher"] = {
	label = "Каталка",
	weight = 12000, -- медицинская каталка ~12 кг
	stack = true,
	close = true,
	description = "Каталка для перевозки пациентов, нуждающихся в медицинской помощи.",
},

["icepack"] = {
	label = "Пакет со льдом",
	weight = 200, -- пакет ~200 г
	stack = true,
	close = true,
	description = "Пакет со льдом для уменьшения отека и облегчения боли и воспаления.",
},

["medicalbag"] = {
	label = "Медицинская сумка",
	weight = 900, -- медсумка ~0.9 кг
	stack = true,
	close = true,
	description = "Комплексный медицинский набор для лечения травм и недугов.",
},

["defibrillator"] = {
	label = "Дефибриллятор",
	weight = 3000, -- переносной дефибриллятор ~3 кг
	stack = true,
	close = true,
	description = "Используется для реанимации пациентов.",
},

["suturekit"] = {
	label = "Набор для швов",
	weight = 120, -- набор ~120 г
	stack = true,
	close = true,
	description = "Набор для наложения и снятия швов.",
},

["tweezers"] = {
	label = "Пинцет",
	weight = 30, -- пинцет ~30 г
	stack = true,
	close = true,
	description = "Пинцет для аккуратного извлечения посторонних предметов, например, пуль.",
},

["emstablet"] = {
	label = "EMS-планшет",
	weight = 400, -- планшет ~400 г
	stack = true,
	close = true,
},

["burncream"] = {
	label = "Крем от ожогов",
	weight = 50, -- тюбик ~50 г
	stack = true,
	close = true,
	description = "Крем для лечения и облегчения ожогов и раздражений кожи.",
},

['bandage'] = {
	label = 'Бинт',
	weight = 30,
	stack = true,
	description = "Обычный бинт для закрытия и защиты ран.",
},

["petfood"] = {
	label = "Корм для питомца",
	weight = 500, -- упаковка ~500 г
	stack = true,
	close = true,
	description = "Корм для вашего питомца!",
	client = {
		image = "petfood.png",
	}
},

["keepcompanionmtlion"] = {
	label = "Горный лев",
	weight = 500, -- аксессуар
	stack = false,
	close = true,
	description = "Горный лев — ваш верный спутник!",
	client = {
		image = "A_C_MtLion.png",
	}
},

["petwaterbottleportable"] = {
	label = "Поилка для питомца",
	weight = 150, -- поилка ~150 г
	stack = false,
	close = true,
	description = "Фляжка для воды для ваших питомцев",
	client = {
		image = "petwaterbottleportable.png",
	}
},

["keepcompanionhen"] = {
	label = "Курица",
	weight = 500,
	stack = false,
	close = true,
	description = "Курица — ваш верный спутник!",
	client = {
		image = "A_C_Hen.png",
	}
},

["keepcompanioncoyote"] = {
	label = "Койот",
	weight = 500,
	stack = false,
	close = true,
	description = "Койот — ваш верный спутник!",
	client = {
		image = "A_C_Coyote.png",
	}
},

["keepcompanionrat"] = {
	label = "Крыса",
	weight = 250,
	stack = false,
	close = true,
	description = "Ваш верный спутник!",
	client = {
		image = "A_C_Rat.png",
	}
},

["keepcompanionrottweiler"] = {
	label = "Ротвейлер",
	weight = 800,
	stack = false,
	close = true,
	description = "Ротвейлер — ваш верный спутник!",
	client = {
		image = "A_Rottweiler.png",
	}
},

["collarpet"] = {
	label = "Ошейник для питомца",
	weight = 50, -- ошейник ~50 г
	stack = true,
	close = true,
	description = "Переименуйте ваших питомцев!",
	client = {
		image = "collarpet.png",
	}
},

["keepcompanionwesty"] = {
	label = "Вести",
	weight = 400,
	stack = false,
	close = true,
	description = "Вести — ваш верный спутник!",
	client = {
		image = "A_C_Westy.png",
	}
},

["keepcompanioncat"] = {
	label = "Кошка",
	weight = 400,
	stack = false,
	close = true,
	description = "Кошка — ваш верный спутник!",
	client = {
		image = "A_C_Cat_01.png",
	}
},

["keepcompanionpoodle"] = {
	label = "Пудель",
	weight = 400,
	stack = false,
	close = true,
	description = "Пудель — ваш верный спутник!",
	client = {
		image = "A_C_Poodle.png",
	}
},

["petgroomingkit"] = {
	label = "Набор для груминга",
	weight = 300, -- набор ~300 г
	stack = false,
	close = true,
	description = "Набор для груминга питомца",
	client = {
		image = "petgroomingkit.png",
	}
},

["keepcompanionhusky"] = {
	label = "Хаски",
	weight = 800,
	stack = false,
	close = true,
	description = "Хаски — ваш верный спутник!",
	client = {
		image = "A_C_Husky.png",
	}
},

["keepcompanionmtlion2"] = {
	label = "Пантера",
	weight = 500,
	stack = false,
	close = true,
	description = "Пантера — ваш верный спутник!",
	client = {
		image = "A_C_MtLion.png",
	}
},

["keepcompanionshepherd"] = {
	label = "Овчарка",
	weight = 800,
	stack = false,
	close = true,
	description = "Овчарка — ваш верный спутник!",
	client = {
		image = "A_C_shepherd.png",
	}
},

["keepcompanionrabbit"] = {
	label = "Кролик",
	weight = 350,
	stack = false,
	close = true,
	description = "Кролик — ваш верный спутник!",
	client = {
		image = "A_C_Rabbit_01.png",
	}
},

["petnametag"] = {
	label = "Именной жетон",
	weight = 30, -- жетон ~30 г
	stack = true,
	close = true,
	description = "Переименуйте вашего питомца",
	client = {
		image = "petnametag.png",
	}
},

["keepcompanionretriever"] = {
	label = "Ретривер",
	weight = 700,
	stack = false,
	close = true,
	description = "Ретривер — ваш верный спутник!",
	client = {
		image = "A_C_Retriever.png",
	}
},

["firstaidforpet"] = {
	label = "Первая помощь для питомца",
	weight = 120, -- набор ~120 г
	stack = true,
	close = true,
	description = "Оживите вашего питомца!",
	client = {
		image = "firstaidforpet.png",
	}
},

["keepcompanionpug"] = {
	label = "Мопс",
	weight = 400,
	stack = false,
	close = true,
	description = "Мопс — ваш верный спутник!",
	client = {
		image = "A_C_Pug.png",
	}
},

["Mdt"] = {
	label = "Полицейский планшет",
	weight = 400,
	stack = true,
	close = true,
	description = "Планшет копов",
	client = {
		image = "mdt.png",
	}
},

["tenkgoldchain"] = {
	label = "Золотая цепочка 10 карат",
	weight = 65,
	stack = true,
	close = true,
	description = "Золотая цепочка 10 карат",
	client = {
		image = "10kgoldchain.png",
	}
},

["item_bench"] = {
	label = "Верстак",
	weight = 15000, -- тяжёлый верстак ~15 кг
	stack = false,
	close = false,
	description = "Верстак для крафта предметов.",
	client = {
		image = "workbench.png",
	}
},

['weed'] = {
	label = 'Трава',
	weight = 2, -- 2 г
	stack = true,
},

['liquid_meth'] = {
	label = 'Жидкий мет',
	weight = 1,
	stack = true,
},

['baggy'] = {
	label = 'Пакетик',
	weight = 5,
	stack = true,
},

['bagged_weed'] = {
	label = 'Пакет травы',
	weight = 2,
	stack = true,
},

['bagged_meth'] = {
	label = 'Пакетик с метом',
	weight = 2,
	stack = true,
},

['bagging_table'] = {
	label = 'Стол для фасовки',
	weight = 7000,
	stack = true,
},

['cauldron'] = {
	label = 'Котёл',
	weight = 2000,
	stack = true,
},

['coca_leaf'] = {
	label = 'Листья коки',
	weight = 2,
	stack = true,
},

['coke_base'] = {
	label = 'Кокаиновая база',
	weight = 1,
	stack = true,
},

['meth_cooking_table'] = {
	label = 'Стол для варки мета',
	weight = 7000,
	stack = true,
},

['phos'] = {
	label = 'Фосфор',
	weight = 1,
	stack = true,
},

['acid'] = {
	label = 'Кислота',
	weight = 1,
	stack = true,
},

['pseudo'] = {
	label = 'Псевдо',
	weight = 1,
	stack = true,
},

['explosive_meth'] = {
	label = 'Взрывной мет',
	weight = 1,
	stack = true,
},

['mixer'] = {
	label = 'Миксер',
	weight = 800,
	stack = true,
},

['gasoline'] = {
	label = 'Бензин',
	weight = 400,
	stack = true,
},

['meth_oven'] = {
	label = 'Печь для мета',
	weight = 2500,
	stack = true,
},

['coke_oven'] = {
	label = 'Печь для кокаина',
	weight = 2500,
	stack = true,
},

["cocaine"] = {
	label = "Пакетик с кокаином",
	weight = 1,
	stack = true,
},

['meth'] = {
	label = 'Мет',
	weight = 1,
	stack = true,
},

['cannabis_seed'] = {
	label = 'Семя каннабиса',
	weight = 1,
	stack = true,
},

['coca_seed'] = {
	label = 'Семя коки',
	weight = 1,
	stack = true,
},

['plant_pot'] = {
	label = 'Горшок для растений',
	weight = 80, -- пластиковый или глиняный горшок ~80 г
	stack = true,
},

['fertilizer'] = {
	label = 'Удобрение',
	weight = 10,
	stack = true,
},

['water_bottle'] = {
	label = 'Бутылка воды',
	weight = 500, -- 0.5л воды
	stack = true,
},

['default_lamp'] = {
	label = 'Лампа',
	weight = 220, -- настольная лампа ~220 г
	stack = true,
},

['press'] = {
	label = 'Пресс',
	weight = 2500, -- механический пресс ~2.5 кг
	stack = true,
},

['coke_brick'] = {
	label = 'Кокаиновый брикет',
	weight = 1000, -- 1 кг
	stack = true,
},

["attachment_bench"] = {
	label = "Верстак для модификаций",
	weight = 15000, -- тяжёлый верстак ~15 кг
	stack = false,
	close = false,
	description = "Верстак для создания модификаций.",
	client = {
		image = "attworkbench.png",
	}
},

-- akqbcrime
['rope'] = {['name'] = 'rope', ['label'] = 'Верёвка', ['weight'] = 250, ['type'] = 'item', ['image'] = 'rope.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Ваше описание здесь'},
['blindfold'] = {['name'] = 'blindfold', ['label'] = 'Повязка на глаза', ['weight'] = 15, ['type'] = 'item', ['image'] = 'blindfold.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Ваше описание здесь'},
['cuff'] = {['name'] = 'cuff', ['label'] = 'Стяжка', ['weight'] = 5, ['type'] = 'item', ['image'] = 'cuff.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Ваше описание здесь'},
['key'] = {['name'] = 'key', ['label'] = 'Ключ от двери', ['weight'] = 50, ['type'] = 'item', ['image'] = 'key.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Ваше описание здесь'},

-- fivecodekey
['vehiclekeys'] = {
	label = 'Ключи от транспорта',
	weight = 50,
	stack = false,
	close = true,
},

-- qs housing
["weed_white-widow"] = {
	label = "Трава White Widow",
	weight = 2,
	stack = false,
},

["weed_skunk"] = {
	label = "Трава Skunk",
	weight = 2,
	stack = false,
},

["weed_purple-haze"] = {
	label = "Трава Purple Haze",
	weight = 2,
	stack = false,
},

["weed_og-kush"] = {
	label = "Трава OG Kush",
	weight = 2,
	stack = false,
},

["weed_amnesia"] = {
	label = "Трава Amnesia",
	weight = 2,
	stack = false,
},

["weed_ak47"] = {
	label = "Трава AK47",
	weight = 2,
	stack = false,
},

["weed_white-widow_seed"] = {
	label = "Семя White Widow",
	weight = 1,
	stack = false,
},

["weed_skunk_seed"] = {
	label = "Семя Skunk",
	weight = 1,
	stack = false,
},

["weed_purple-haze_seed"] = {
	label = "Семя Purple Haze",
	weight = 1,
	stack = false,
},

["weed_og-kush_seed"] = {
	label = "Семя OG Kush",
	weight = 1,
	stack = false,
},

["weed_amnesia_seed"] = {
	label = "Семя Amnesia",
	weight = 1,
	stack = false,
},

["weed_ak47_seed"] = {
	label = "Семя AK47",
	weight = 1,
	stack = false,
},

["empty_weed_bag"] = {
	label = "Пустой пакетик для травки",
	weight = 5,
	stack = true,
},

["weed_nutrition"] = {
	label = "Удобрение для марихуаны",
	weight = 500,
	stack = false,
},

["lockpick"] = {
	label = "Отмычка",
	weight = 40,
	stack = true,
},

["police_stormram"] = {
	label = "Полицейский таран",
	weight = 9000,
	stack = false,
},

['outfitbag'] = {
	label = 'Сумка для одежды',
	consume = 0,
	weight = 500,
	client = {
		export = 'krs_outfitbag.outfitbag'
	}
},

['uvlight'] = {
	label = 'УФ-лампа',
	weight = 60,
	stack = true,
	close = true,
	description = 'Для поиска отпечатков пальцев',
	client = {
		image = 'uvlight.png',
		usable = true
	}
},

['bleachwipes'] = {
	label = 'Влажные салфетки',
	weight = 25,
	stack = true,
	close = true,
	description = 'Для очистки и дезинфекции',
	client = {
		image = 'bleachwipes.png',
		usable = true
	},
	combinable = true
},

['bobby_pin'] = {
	label = 'Шпилька',
	weight = 1,
	stack = true,
	close = true,
	description = 'Можно использовать как инструмент для взлома замков',
	client = {
		image = 'bobby_pin.png',
		usable = true
	},
	combinable = true
},

['tracking_bracelet'] = {
	label = 'Браслет для отслеживания',
	weight = 50,
	stack = true,
	close = true,
	description = 'Для отслеживания подозреваемого',
	client = {
		image = 'tracking_bracelet.png',
		usable = true
	},
	combinable = true
},

['medbag'] = {
	label = 'Медицинская сумка',
	weight = 900,
	stack = true,
	close = true,
	description = 'Сумка с медицинскими инструментами',
	client = {
		image = 'medbag.png',
		usable = true
	}
},

['tweezers'] = {
	label = 'Пинцет',
	weight = 30,
	stack = true,
	close = true,
	description = 'Для извлечения пуль и осколков',
	client = {
		image = 'tweezers.png',
		usable = true
	}
},

['suturekit'] = {
	label = 'Набор для швов',
	weight = 60,
	stack = true,
	close = true,
	description = 'Для наложения швов',
	client = {
		image = 'suturekit.png',
		usable = true
	}
},

['icepack'] = {
	label = 'Пакет со льдом',
	weight = 120,
	stack = true,
	close = true,
	description = 'Для снятия отёка',
	client = {
		image = 'icepack.png',
		usable = true
	}
},

['burncream'] = {
	label = 'Крем от ожогов',
	weight = 50,
	stack = true,
	close = true,
	description = 'Для лечения ожогов',
	client = {
		image = 'burncream.png',
		usable = true
	}
},

['defib'] = {
	label = 'Дефибриллятор',
	weight = 2500,
	stack = true,
	close = true,
	description = 'Используется для реанимации',
	client = {
		image = 'defib.png',
		usable = true
	}
},

['sedative'] = {
	label = 'Седативное',
	weight = 2,
	stack = true,
	close = true,
	description = 'Для седации пациента',
	client = {
		image = 'sedative.png',
		usable = true
	}
},

['morphine30'] = {
	label = 'Морфин 30 мг',
	weight = 2,
	stack = true,
	close = true,
	description = 'Обезболивающее',
	client = {
		image = 'morphine30.png',
		usable = true
	},
	combinable = true
},

['morphine15'] = {
	label = 'Морфин 15 мг',
	weight = 2,
	stack = true,
	close = true,
	description = 'Обезболивающее',
	client = {
		image = 'morphine15.png',
		usable = true
	},
	combinable = true
},

['perc30'] = {
	label = 'Перкоцет 30 мг',
	weight = 2,
	stack = true,
	close = true,
	description = 'Обезболивающее',
	client = {
		image = 'perc30.png',
		usable = true
	},
	combinable = true
},

['perc10'] = {
	label = 'Перкоцет 10 мг',
	weight = 2,
	stack = true,
	close = true,
	description = 'Обезболивающее',
	client = {
		image = 'perc10.png',
		usable = true
	},
	combinable = true
},

['perc5'] = {
	label = 'Перкоцет 5 мг',
	weight = 2,
	stack = true,
	close = true,
	description = 'Обезболивающее',
	client = {
		image = 'perc5.png',
		usable = true
	},
	combinable = true
},

['vic10'] = {
	label = 'Викодин 10 мг',
	weight = 2,
	stack = true,
	close = true,
	description = 'Обезболивающее',
	client = {
		image = 'vic10.png',
		usable = true
	},
	combinable = true
},

['vic5'] = {
	label = 'Викодин 5 мг',
	weight = 2,
	stack = true,
	close = true,
	description = 'Обезболивающее',
	client = {
		image = 'vic5.png',
		usable = true
	},
	combinable = true
},

['medikit'] = {
	label = 'Медицинский набор',
	weight = 500,
	stack = true,
	close = true,
	description = 'Набор первой помощи',
	client = {
		image = 'medikit.png',
		usable = true
	},
	combinable = true
},

["silver_coin"] = {
	label = 'Серебряная монета',
	weight = 30,
},

["gold_coin"] = {
	label = 'Золотая монета',
	weight = 35,
},

["charlotte_ring"] = {
	label = 'Кольцо Charlotte',
	weight = 10,
},

["simbolos_chain"] = {
	label = 'Цепочка Simbolos',
	weight = 30,
},

["action_figure"] = {
	label = 'Фигурка',
	weight = 60,
},

["nominos_ring"] = {
	label = 'Кольцо Nominos',
	weight = 10,
},

["boss_chain"] = {
	label = 'Цепочка BOSS',
	weight = 40,
},

["branded_cigarette"] = {
	label = 'Марочная сигарета',
	weight = 2,
},

["branded_cigarette_box"] = {
	label = 'Пачка марочных сигарет',
	weight = 20,
},

["ninja_figure"] = {
	label = 'Фигурка ниндзя',
	weight = 60,
},

["painting"] = {
	label = 'Картина',
	weight = 1000,
},
["chocobox"] = {
	label = 'Коробка шоколадок',
	weight = 5000,
},
["colabox"] = {
	label = 'Ящик колы',
	weight = 12000,
},
["beerbox"] = {
	label = 'Ящик пива',
	weight = 12000,
},
["waterbox"] = {
	label = 'Ящик воды',
	weight = 12000,
},
["cigarettebox"] = {
	label = 'Коробка сигарет',
	weight = 10000,
},

["statue"] = {
	label = 'Статуя',
	weight = 2500,
},

["ancient_egypt_artifact"] = {
	label = 'Артефакт Древнего Египта',
	weight = 800,
},

["ruby"] = {
	label = 'Рубин',
	weight = 10,
},

["diamond"] = {
	label = 'Бриллиант',
	weight = 10,
},

["danburite"] = {
	label = 'Данбурит',
	weight = 10,
},

["television"] = {
	label = 'Телевизор',
	weight = 8000,
	stack = false
},

["coffee_machine"] = {
	label = 'Кофемашина',
	weight = 4000,
	stack = false
},

["computer"] = {
	label = 'Компьютер',
	weight = 3000,
	stack = false
},

["microwave"] = {
	label = 'Микроволновка',
	weight = 3500,
	stack = false
},

["music_player"] = {
	label = 'Музыкальный плеер',
	weight = 800,
	stack = false
},

["lockpick"] = {
	label = 'Отмычка',
	weight = 40,
	stack = true
},

["cutter"] = {
	label = 'Кусачки',
	weight = 350,
	stack = true
},

["can_injector"] = {
	label = 'CAN-инжектор',
	weight = 80,
	stack = true
},

["crime_hood"] = {
	label = 'Капот',
	weight = 3000,
	stack = true
},

["crime_rims"] = {
	label = 'Диски',
	weight = 2500,
	stack = true
},

["crime_seat"] = {
	label = 'Сиденье',
	weight = 1500,
	stack = true
},

["crime_bumper"] = {
	label = 'Бампер',
	weight = 2500,
	stack = true
},

["crime_externals"] = {
	label = 'Внешний обвес',
	weight = 2000,
	stack = true
},

["crime_tires"] = {
	label = 'Шины',
	weight = 2000,
	stack = true
},

["crime_headlights"] = {
	label = 'Фары',
	weight = 600,
	stack = true
},

["crime_turbo"] = {
	label = 'Турбо',
	weight = 2200,
	stack = true
},

["crime_batterycar"] = {
	label = 'Аккумулятор',
	weight = 900,
	stack = true
},

["crime_frein"] = {
	label = 'Тормозной диск',
	weight = 700,
	stack = true
},

-- Сырые продукты 
['burger_bread_fresh'] = {
	label = 'Свежая булочка для бургера',
	weight = 80,
	consume = 1,
	client = {
		image = 'burger_bread_fresh.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели свежую булочку для бургера',
	},
},
['patty'] = {
	label = 'Котлета для бургера',
	weight = 100,
	consume = 1,
	client = {
		image = 'patty.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели котлету для бургера',
	},
},
['cheese'] = {
	label = 'Сыр',
	weight = 50,
	consume = 1,
	client = {
		image = 'cheese.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели сыр',
	},
},
['ham_leg'] = {
	label = 'Ветчина',
	weight = 80,
	consume = 1,
	client = {
		image = 'Ham_leg.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели ветчину',
	},
},
['salad'] = {
	label = 'Салат',
	weight = 30,
	consume = 1,
	client = {
		image = 'salad.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели салат',
	},
},
['tomato'] = {
	label = 'Помидор',
	weight = 50,
	consume = 1,
	client = {
		image = 'Tomato.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели помидор',
	},
},
['onion'] = {
	label = 'Лук',
	weight = 40,
	consume = 1,
	client = {
		image = 'onion.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели лук',
	},
},
['mustard'] = {
	label = 'Горчица',
	weight = 15,
	consume = 1,
	client = {
		image = 'mustard.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели горчицу',
	},
},
['sauces'] = {
	label = 'Соус',
	weight = 20,
	consume = 1,
	client = {
		image = 'sauces.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели соус',
	},
},
['chickenmeat'] = {
	label = 'Куриное мясо',
	weight = 90,
	consume = 1,
	client = {
		image = 'chickenmeat.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели куриное мясо',
	},
},
['fine_meat_cooked'] = {
	label = 'Колбаска',
	weight = 90,
	consume = 1,
	client = {
		image = 'fine_meat_cooked.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели колбаску',
	},
},
['bean'] = {
	label = 'Фасоль',
	weight = 30,
	consume = 1,
	client = {
		image = 'bean.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели фасоль',
	},
},
['corn'] = {
	label = 'Кукуруза',
	weight = 40,
	consume = 1,
	client = {
		image = 'corn.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели кукурузу',
	},
},
['pepper'] = {
	label = 'Перец',
	weight = 10,
	consume = 1,
	client = {
		image = 'Pepper.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели перец',
	},
},
['fish_meat_cooked'] = {
	label = 'Рыба',
	weight = 90,
	consume = 1,
	client = {
		image = 'fish_meat_cooked.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели рыбу',
	},
},
['bread'] = {
	label = 'Хлеб',
	weight = 60,
	consume = 1,
	client = {
		image = 'Bread.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели хлеб',
	},
},
['flour'] = {
	label = 'Мука',
	weight = 50,
	consume = 1,
	client = {
		image = 'flour.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели муку',
	},
},
['dough'] = {
	label = 'Тесто',
	weight = 80,
	consume = 1,
	client = {
		image = '0.Dought.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели тесто',
	},
},
['pineapple'] = {
	label = 'Ананас',
	weight = 120,
	consume = 1,
	client = {
		image = 'pineapple.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели ананас',
	},
},
['avocado'] = {
	label = 'Авокадо',
	weight = 60,
	consume = 1,
	client = {
		image = 'avocado.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели авокадо',
	},
},
['potato'] = {
	label = 'Картофель',
	weight = 80,
	consume = 1,
	client = {
		image = 'potato.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели картофель',
	},
},
['potato_cook'] = {
	label = 'Жареный картофель',
	weight = 90,
	consume = 1,
	client = {
		image = 'potato_cook.png',
		status = { hunger = 100000, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели жареный картофель',
	},
},
['carrot'] = {
	label = 'Морковь',
	weight = 30,
	consume = 1,
	client = {
		image = 'carrot.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели морковь',
	},
},
['paprika'] = {
	label = 'Паприка',
	weight = 20,
	consume = 1,
	client = {
		image = 'paprika.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели паприку',
	},
},
['dragonfr'] = {
	label = 'Питахайя',
	weight = 80,
	consume = 1,
	client = {
		image = 'dragonfr.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели питахайю',
	},
},
['papaya'] = {
	label = 'Папайя',
	weight = 100,
	consume = 1,
	client = {
		image = 'papaya.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели папайю',
	},
},
['mango'] = {
	label = 'Манго',
	weight = 100,
	consume = 1,
	client = {
		image = 'Mango.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели манго',
	},
},
['pomegranate'] = {
	label = 'Гранат',
	weight = 80,
	consume = 1,
	client = {
		image = 'pomegranate.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели гранат',
	},
},
['orange'] = {
	label = 'Апельсин',
	weight = 80,
	consume = 1,
	client = {
		image = 'Orange.png',
		status = { hunger = 100000, thirst = 100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели апельсин',
	},
},
['salt'] = {
	label = 'Соль',
	weight = 10,
	consume = 1,
	client = {
		image = 'Salt.png',
		status = { hunger = 0, thirst = -100000 },
		anim = 'eating',
		prop = nil,
		usetime = 2000,
		notification = 'Вы съели соль',
	},
},

-- Готовые блюда (полностью восстанавливают, но сушат!)
['classic_burger'] = {
    label = 'Классический бургер',
    weight = 250,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = -100000 },
        anim = 'eating',
        prop = nil,
        usetime = 2000,
        notification = 'Вы съели классический бургер',
        image = '0.burger_cheese2.png',
    },
},

['bacon_cheeseburger'] = {
    label = 'Чизбургер с беконом',
    weight = 270,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = -100000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели чизбургер с беконом',
        image = '0.burger_baconlov.png',
    },
},

['chicken_burrito'] = {
    label = 'Куриный буррито',
    weight = 220,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = -100000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели куриный буррито',
        image = '0.burger_BuritosChicken.png',
    },
},

['beef_taco'] = {
    label = 'Традиционный тако с говядиной',
    weight = 180,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = -100000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели тако с говядиной',
        image = '0.burger_tacos.png',
    },
},

['vegan_taco'] = {
    label = 'Вегетарианский тако',
    weight = 170,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = 200000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели веган тако',
        image = 'bite_vegan.png',
    },
},

['fish_burger'] = {
    label = 'Бургер с рыбой',
    weight = 210,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = -100000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели бургер с рыбой',
        image = '0.burger_fish.png',
    },
},

['hotdog'] = {
    label = 'Хот-дог',
    weight = 170,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = -100000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели хот-дог',
        image = '0.burger_hotdog.png',
    },
},

['french_fries'] = {
    label = 'Картофель фри',
    weight = 100,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = -100000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели картошку фри',
        image = 'frites_auto.png',
    },
},

['caesar_salad'] = {
    label = 'Салат "Цезарь"',
    weight = 170,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = 200000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели салат "Цезарь"',
        image = 'COBB SALAD.png',
    },
},

['pizza_margherita'] = {
    label = 'Пицца Маргарита',
    weight = 300,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = -100000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели пиццу Маргарита',
        image = 'TinCan_pizza_frozen.png',
    },
},

['ham_cheese_pizza'] = {
    label = 'Пицца с ветчиной и сыром',
    weight = 320,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = -100000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели пиццу с ветчиной и сыром',
        image = 'Cake_cheese.png',
    },
},

['vegetable_soup'] = {
    label = 'Овощной суп',
    weight = 220,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = 200000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели овощной суп',
        image = 'campbowl_vegetable_Soup.png',
    },
},

['fish_pineapple_burger'] = {
    label = 'Бургер с рыбой и ананасом',
    weight = 210,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = 200000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели бургер с рыбой и ананасом',
        image = 'bite_Fish.png',
    },
},

['avocado_burger'] = {
    label = 'Бургер с авокадо',
    weight = 210,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = 200000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели бургер с авокадо',
        image = 'bite_vegan.png',
    },
},

['exotic_fruit_salad'] = {
    label = 'Экзотический фруктовый салат',
    weight = 150,
    consume = 1,
    client = {
        status = { hunger = 500000, thirst = 200000 },
        anim = 'eating',
        usetime = 2000,
        notification = 'Вы съели фруктовый салат',
        image = 'fruit_salad.png',
    },
},

-- Напитки: жидкости восстанавливают жажду!
['rum'] = {
    label = 'Ром',
    weight = 450,
    consume = 1,
    client = {
        image = 'alcool_rum.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 3500,
        cancel = true,
        notification = 'Вы выпили ром.',
        effect = { type = 'drunk', time = 120 }
    }
},
['vodka'] = {
    label = 'Водка',
    weight = 450,
    consume = 1,
    client = {
        image = 'alcool_vodka.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 3500,
        cancel = true,
        notification = 'Вы выпили водку.',
        effect = { type = 'drunk', time = 140 }
    }
},
['tequila'] = {
    label = 'Текила',
    weight = 450,
    consume = 1,
    client = {
        image = 'alcool_tequila.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 3500,
        cancel = true,
        notification = 'Вы выпили текилу.',
        effect = { type = 'drunk', time = 120 }
    }
},
['whisky'] = {
    label = 'Виски',
    weight = 450,
    consume = 1,
    client = {
        image = 'whisky1.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 3500,
        cancel = true,
        notification = 'Вы выпили виски.',
        effect = { type = 'drunk', time = 120 }
    }
},
['mint'] = {
    label = 'Мята',
    weight = 10,
    consume = 1,
    client = {
        image = 'hop.png',
        status = { hunger = 700, thirst = 500 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 1500,
        cancel = true,
        notification = 'Вы пожевали мяту'
    }
},
['syrupsugarcane'] = {
    label = 'Сироп из тростника',
    weight = 100,
    consume = 1,
    client = {
        image = 'Syrup_ginger.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 1500,
        cancel = true,
        notification = 'Вы попробовали сладкий сироп'
    }
},
['syrupcoconut'] = {
    label = 'Кокосовый сироп',
    weight = 100,
    consume = 1,
    client = {
        image = 'Syrup_coconut.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 1500,
        cancel = true,
        notification = 'Вы попробовали кокосовый сироп'
    }
},
['milkshake'] = {
    label = 'Молочный коктейль',
    weight = 300,
    consume = 1,
    client = {
        image = '0.milkskake.png',
        status = { thirst = 500000, hunger = 15000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 2000,
        cancel = true,
        notification = 'Вы выпили молочный коктейль'
    }
},
['syrupgrenadine'] = {
    label = 'Гренадин',
    weight = 100,
    consume = 1,
    client = {
        image = 'Syrup_pomegranate.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 1500,
        cancel = true,
        notification = 'Вы попробовали гренадин'
    }
},
['syrupcranberry'] = {
    label = 'Клюквенный сироп',
    weight = 100,
    consume = 1,
    client = {
        image = 'Syrup_rose.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 1500,
        cancel = true,
        notification = 'Вы попробовали клюквенный сироп'
    }
},
['syruplemon'] = {
    label = 'Лимонный сироп',
    weight = 100,
    consume = 1,
    client = {
        image = 'Syrup_lemon.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 1500,
        cancel = true,
        notification = 'Вы попробовали лимонный сироп'
    }
},
['syrupbluecuracao'] = {
    label = 'Блю Кюрасао (сироп)',
    weight = 100,
    consume = 1,
    client = {
        image = 'curaco.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 1500,
        cancel = true,
        notification = 'Вы попробовали blue curacao'
    }
},
['soda'] = {
    label = 'Сода',
    weight = 250,
    consume = 1,
    client = {
        image = 'Drink_SprunkLite.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 1500,
        cancel = true,
        notification = 'Вы выпили газировку'
    }
},
['strawberry'] = {
    label = 'Клубника',
    weight = 50,
    consume = 1,
    client = {
        image = 'GlassJuice_strawberry.png',
        status = { hunger = 1000, thirst = 800 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 1000,
        cancel = true,
        notification = 'Вы съели клубнику'
    }
},
['coffeecup'] = {
    label = 'Чашка кофе',
    weight = 100,
    consume = 1,
    client = {
        image = 'COCKTAIL_expresso.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 2000,
        cancel = true,
        notification = 'Вы выпили кофе'
    }
},
['syrupchocolat'] = {
    label = 'Шоколадный сироп',
    weight = 100,
    consume = 1,
    client = {
        image = 'Syrup_chocolat.png',
        status = { thirst = 200000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 1000,
        cancel = true,
        notification = 'Вы попробовали шоколадный сироп'
    }
},

-- Готовые коктейли с эффектом алкоголя (полностью восстанавливают жажду)
['mojito'] = {
    label = 'Мохито',
    weight = 350,
    consume = 1,
    client = {
        image = 'cocktail_mojito.png',
        status = { thirst = 500000, hunger = 3000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 4000,
        cancel = true,
        notification = 'Вы выпили освежающий Мохито!',
        effect = { type = 'drunk', time = 30 }
    }
},

['tequilasunrise'] = {
    label = 'Tequila Sunrise',
    weight = 350,
    consume = 1,
    client = {
        image = 'cocktail_tequilaSunrise.png',
        status = { thirst = 500000, hunger = 2000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 4000,
        cancel = true,
        notification = 'Вы выпили Tequila Sunrise! Вечеринка началась!',
        effect = { type = 'drunk', time = 40 }
    }
},

['pinacolada'] = {
    label = 'Pina Colada',
    weight = 350,
    consume = 1,
    client = {
        image = 'cocktail_colada.png',
        status = { thirst = 500000, hunger = 4000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 4000,
        cancel = true,
        notification = 'Вы выпили Pina Colada! Тропическое наслаждение!',
        effect = { type = 'drunk', time = 36 }
    }
},

['bloodymary'] = {
    label = 'Bloody Mary',
    weight = 350,
    consume = 1,
    client = {
        image = 'cocktail_BloodyMary.png',
        status = { thirst = 500000, hunger = 7000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 4000,
        cancel = true,
        notification = 'Вы выпили Bloody Mary! Становится жарко!',
        effect = { type = 'drunk', time = 48 }
    }
},

['cosmopolitan'] = {
    label = 'Cosmopolitan',
    weight = 350,
    consume = 1,
    client = {
        image = 'cocktail_cosmopolitan.png',
        status = { thirst = 500000, hunger = 2000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 4000,
        cancel = true,
        notification = 'Вы выпили Cosmopolitan! Вы в центре внимания!',
        effect = { type = 'drunk', time = 32 }
    }
},

['bluelagoon'] = {
    label = 'Blue Lagoon',
    weight = 350,
    consume = 1,
    client = {
        image = 'cocktail_bluelagoon.png',
        status = { thirst = 500000, hunger = 2000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 4000,
        cancel = true,
        notification = 'Вы выпили Blue Lagoon! Освежает и веселит!',
        effect = { type = 'drunk', time = 28 }
    }
},

['strawberrydaiquiri'] = {
    label = 'Strawberry Daiquiri',
    weight = 350,
    consume = 1,
    client = {
        image = 'cocktail_strawberrydaiquiri.png',
        status = { thirst = 500000, hunger = 5000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 4000,
        cancel = true,
        notification = 'Вы выпили Strawberry Daiquiri! Лето на вкус!',
        effect = { type = 'drunk', time = 36 }
    }
},
["spraycan"] = {
    label = "Spray Can",
    weight = 1000,
    stack = true,
    close = true,
    description = "Spray Can",
    consume = 0,
    client = {
		export = 'qb-graffiti.spraycan'
	},
    server = {},
    icon = "spraycan.png"
},

["spraycan_ballas"] = {
    label = "Ballas Graffiti",
    weight = 1000,
    stack = true,
    close = true,
    description = "Ballas Graffiti",
    consume = 0,
    client = {
		export = 'qb-graffiti.spraycan'
	},
    server = {},
    icon = "spraycan.png"
},

["spraycan_vagos"] = {
    label = "Vagos Graffiti",
    weight = 1000,
    stack = true,
    close = true,
    description = "Vagos Graffiti",
    consume = 0,
    client = {
		export = 'qb-graffiti.spraycan'
	},
    server = {},
    icon = "spraycan.png"
},

["spraycan_families"] = {
    label = "Families Graffiti",
    weight = 1000,
    stack = true,
    close = true,
    description = "Families Graffiti",
    consume = 0,
    client = {
		export = 'qb-graffiti.spraycan'
	},
    server = {},
    icon = "spraycan.png"
},

["spraycan_thelostmc"] = {
    label = "The Lost MC Graffiti",
    weight = 1000,
    stack = true,
    close = true,
    description = "The Lost MC Graffiti",
    consume = 0,
    client = {
		export = 'qb-graffiti.spraycan'
	},
    server = {},
    icon = "spraycan.png"
},

["spraycan_streetracers"] = {
    label = "Streetracers Graffiti",
    weight = 1000,
    stack = true,
    close = true,
    description = "Streetracers Graffiti",
    consume = 0,
    client = {
		export = 'qb-graffiti.spraycan'
	},
    server = {},
    icon = "spraycan.png"
},

["sprayremover"] = {
    label = "Spray Remover",
    weight = 100,
    stack = true,
    close = true,
    description = "Spray Remover",
    consume = 0,
	info = {
		model = ""
	},
    client = {
		export = 'qb-graffiti.sprayremover'
	},
    server = {},
    icon = "sprayremover.png"
},

['irishcoffee'] = {
    label = 'Irish Coffee',
    weight = 350,
    consume = 1,
    client = {
        image = 'Cocktail_ExpressoMartini.png',
        status = { thirst = 65000, hunger = 7000 },
        anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
        usetime = 4000,
        cancel = true,
        notification = 'Вы выпили Irish Coffee! Согревает душу!',
        effect = { type = 'drunk', time = 44 }
    }
},
['bodycam'] = {
        label = 'Bodycam',
        weight = 300,
        stack = false,
        close = true,
        allowArmed = true,
        consume = 0,
        client = { event = 'redutzu-mdt:client:toggle-bodycam-state', image = 'bodycam.png' },
        description = 'Let other players see your body with the most advanced bodycam on FiveM'
},

}