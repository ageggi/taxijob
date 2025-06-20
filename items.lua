return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
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
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

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
	
	['bubble'] = {
    label = 'Газировка Bubble',
    weight = 300,
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
    weight = 800,
    client = {
        status = { thirst = 25000 },
        anim = 'drinking',
        prop = 'champagne',
        usetime = 3000,
        notification = 'Вы выпили шампанское',
        effect = { type = 'drunk', time = 60 } -- Эффект опьянения на 60 секунд
    },
},
['chips'] = {
    label = 'Чипсы',
    weight = 120,
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
    weight = 90,
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
    weight = 250,
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
    weight = 250,
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
    weight = 250,
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
    weight = 350,
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
    weight = 320,
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
    weight = 350,
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
    weight = 500,
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
    weight = 700,
    client = {
        status = { thirst = 12000 },
        anim = 'drinking',
        prop = 'whiskey',
        usetime = 3000,
        notification = 'Вы выпили виски',
        effect = { type = 'drunk', time = 120 } -- Эффект опьянения на 120 секунд
    },
},
['yogurt'] = {
    label = 'Йогурт',
    weight = 130,
    client = {
        status = { hunger = 9000, thirst = 5000 },
        anim = 'eating',
        prop = 'yogurt',
        usetime = 1500,
        notification = 'Вы съели йогурт'
    },
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
	
		['contact_pimp'] = {
		label = 'Контакт для сутенера',
	},
			['paint'] = {
		label = 'Баллончик с краской',
	},
			['stencil'] = {
		label = 'Трафарет',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
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

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["fitbit"] = {
		label = "Fitbit",
		weight = 500,
		stack = false,
		close = true,
		description = "Мне нравится fitbit",
		client = {
			image = "fitbit.png",
		}
	},

	["tactical_muzzle_brake"] = {
		label = "Тактический тормозной раструб",
		weight = 1000,
		stack = true,
		close = true,
		description = "Тактический тормозной раструб для оружия",
		client = {
			image = "tactical_muzzle_brake.png",
		}
	},

	["wet_classic_phone"] = {
		label = "Wet Classic Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_classic_phone.png",
		}
	},

	["wet_greenlight_phone"] = {
		label = "Wet Green Light Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "wet_greenlight_phone.png",
		}
	},

	["largescope_attachment"] = {
		label = "Большой прицел",
		weight = 1000,
		stack = true,
		close = true,
		description = "Большой прицел для оружия",
		client = {
			image = "largescope_attachment.png",
		}
	},

	["bag"] = {
		label = "Сумка",
		weight = 0,
		stack = false,
		close = true,
		description = "Сумка",
		client = {
			image = "bag.png",
		}
	},

	["wet_phone"] = {
		label = "Wet Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_classic_phone.png",
		}
	},

	["wine"] = {
		label = "Вино",
		weight = 300,
		stack = true,
		close = false,
		description = "Хорошее вино для выпивания в приятный вечер",
		client = {
			image = "wine.png",
		}
	},

	["police_stormram"] = {
		label = "Police Storm Ram",
		weight = 800,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "police_stormram.png",
		}
	},

	["suppressor_attachment"] = {
		label = "Глушитель",
		weight = 1000,
		stack = true,
		close = true,
		description = "Глушитель для оружия",
		client = {
			image = "suppressor_attachment.png",
		}
	},

	["veh_xenons"] = {
		label = "Ксеноны",
		weight = 1000,
		stack = true,
		close = true,
		description = "Улучшить ксеноны транспортного средства",
		client = {
			image = "veh_xenons.png",
		}
	},

	["steel"] = {
		label = "Сталь",
		weight = 100,
		stack = true,
		close = false,
		description = "Хороший кусочек металла, который, возможно, можно использовать для чего-то",
		client = {
			image = "steel.png",
		}
	},

	["goldbar"] = {
		label = "Золотая слиток",
		weight = 7000,
		stack = true,
		close = true,
		description = "Кажется, довольно дорого",
		client = {
			image = "goldbar.png",
		}
	},

	["weed_amnesia_seed"] = {
		label = "Amnesia seed",
		weight = 50,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_amnesia_seed.png",
		}
	},

	["ironoxide"] = {
		label = "Железный порошок",
		weight = 100,
		stack = true,
		close = false,
		description = "Немного порошка для смешивания.",
		client = {
			image = "ironoxide.png",
		}
	},

	["vodka"] = {
		label = "Водка",
		weight = 500,
		stack = true,
		close = true,
		description = "Для всех испытывающих жажду",
		client = {
			image = "vodka.png",
		}
	},

	["coke_brick"] = {
		label = "Блок кокаина",
		weight = 1000,
		stack = false,
		close = true,
		description = "Тяжелая упаковка кокаина, в основном используется для сделок и занимает много места",
		client = {
			image = "coke_brick.png",
		}
	},

	["kurkakola"] = {
		label = "Кола",
		weight = 500,
		stack = true,
		close = true,
		description = "Для всех испытывающих жажду",
		client = {
			image = "cola.png",
		}
	},

	["red_phone"] = {
		label = "Red Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "red_phone.png",
		}
	},

	["weed_skunk_seed"] = {
		label = "Skunk seed",
		weight = 50,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_skunk_seed.png",
		}
	},

	["weaponlicense"] = {
		label = "Лицензия на оружие",
		weight = 0,
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
		label = "Phone Hack",
		weight = 300,
		stack = false,
		close = true,
		description = "With this chip, you can access hidden areas of Discord.",
		client = {
			image = "phone_hack.png",
		}
	},

	["crack_baggy"] = {
		label = "Пакет крэка",
		weight = 0,
		stack = true,
		close = true,
		description = "Чтобы быстрее обрадоваться",
		client = {
			image = "crack_baggy.png",
		}
	},

	["handcuffs"] = {
		label = "Handcuffs",
		weight = 100,
		stack = true,
		close = false,
		description = "Handcuffs",
		client = {
			image = "handcuffs.png",
		}
	},

	["filled_evidence_bag"] = {
		label = "Сумка с уликами",
		weight = 200,
		stack = false,
		close = false,
		description = "Наполненная сумка с уликами, чтобы вычислить виновного >:(",
		client = {
			image = "evidence.png",
		}
	},

	["black_phone"] = {
		label = "Black Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "black_phone.png",
		}
	},

	["iphone"] = {
		label = "iPhone",
		weight = 1000,
		stack = true,
		close = true,
		description = "Очень дорогой телефон",
		client = {
			image = "iphone.png",
		}
	},

	["labkey"] = {
		label = "Ключ",
		weight = 500,
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
		label = "Wet Gold Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_gold_phone.png",
		}
	},

	["weed_og-kush"] = {
		label = "OG Kush weed",
		weight = 150,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_og-kush.png",
		}
	},

	["skullcamo_attachment"] = {
		label = "Skull Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A skull camo for a weapon",
		client = {
			image = "skullcamo_attachment.png",
		}
	},

	["coke_small_brick"] = {
		label = "Пакет кокаина",
		weight = 350,
		stack = false,
		close = true,
		description = "Маленький пакет кокаина, в основном используется для сделок и занимает много места",
		client = {
			image = "coke_small_brick.png",
		}
	},

	["precision_muzzle_brake"] = {
		label = "Точный тормозной раструб",
		weight = 1000,
		stack = true,
		close = true,
		description = "Тормозной раструб для оружия",
		client = {
			image = "precision_muzzle_brake.png",
		}
	},

	["advancedrepairkit"] = {
		label = "Продвинутый набор для ремонта",
		weight = 4000,
		stack = true,
		close = true,
		description = "Хороший ящик с инструментами для ремонта вашего транспортного средства",
		client = {
			image = "advancedkit.png",
		}
	},

	["diving_fill"] = {
		label = "Дайвинг-трубка",
		weight = 3000,
		stack = false,
		close = true,
		description = "Трубка с кислородом и ребрит",
		client = {
			image = "diving_tube.png",
		}
	},

	["empty_weed_bag"] = {
		label = "Empty weed bag",
		weight = 50,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "empty_weed_bag.png",
		}
	},

	["moneybag"] = {
		label = "Мешок с деньгами",
		weight = 0,
		stack = false,
		close = true,
		description = "Сумка с наличными",
		client = {
			image = "moneybag.png",
		}
	},

	["veh_exterior"] = {
		label = "Экстерьер",
		weight = 1000,
		stack = true,
		close = true,
		description = "Улучшить внешний вид транспортного средства",
		client = {
			image = "veh_exterior.png",
		}
	},

	["powerbank"] = {
		label = "Power Bank",
		weight = 200,
		stack = false,
		close = true,
		description = "Incredible portable charger!",
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
		label = "Wet Green Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "wet_green_phone.png",
		}
	},

	["nitrous"] = {
		label = "Нитро",
		weight = 1000,
		stack = true,
		close = true,
		description = "Ускорься, педаль газа! :D",
		client = {
			image = "nitrous.png",
		}
	},

	["advscope_attachment"] = {
		label = "Продвинутый прицел",
		weight = 1000,
		stack = true,
		close = true,
		description = "Продвинутый прицел для оружия",
		client = {
			image = "advscope_attachment.png",
		}
	},

	["laptop"] = {
		label = "Ноутбук",
		weight = 4000,
		stack = true,
		close = true,
		description = "Дорогой ноутбук",
		client = {
			image = "laptop.png",
		}
	},

	["green_phone"] = {
		label = "Green Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "green_phone.png",
		}
	},

	["ifaks"] = {
		label = "ifaks",
		weight = 200,
		stack = true,
		close = true,
		description = "ifaks для лечения и полного удаления стресса.",
		client = {
			image = "ifaks.png",
		}
	},

	["weed_whitewidow_seed"] = {
		label = "Семена Белой вдовы",
		weight = 0,
		stack = true,
		close = false,
		description = "Семя марихуаны Белой вдовы",
		client = {
			image = "weed_seed.png",
		}
	},

	["casinochips"] = {
		label = "Фишки казино",
		weight = 0,
		stack = true,
		close = false,
		description = "Фишки для азартных игр в казино",
		client = {
			image = "casinochips.png",
		}
	},

	["firework2"] = {
		label = "Poppelers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Фейерверки",
		client = {
			image = "firework2.png",
		}
	},

	["zebracamo_attachment"] = {
		label = "Zebra Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A zebra camo for a weapon",
		client = {
			image = "zebracamo_attachment.png",
		}
	},

	["heavyarmor"] = {
		label = "Тяжелая броня",
		weight = 5000,
		stack = true,
		close = true,
		description = "Немного защиты не повредит... верно?",
		client = {
			image = "armor.png",
		}
	},

	["diamond_ring"] = {
		label = "Бриллиантовое кольцо",
		weight = 1500,
		stack = true,
		close = true,
		description = "Бриллиантовое кольцо кажется мне джекпотом!",
		client = {
			image = "diamond_ring.png",
		}
	},

	["empty_evidence_bag"] = {
		label = "Пустая сумка для улик",
		weight = 0,
		stack = true,
		close = false,
		description = "Часто используется для хранения ДНК из крови, гильз и многое другое",
		client = {
			image = "evidence.png",
		}
	},
	
	["evidencebag"] = {
    label = 'Evidence Bag',
    weight = 100,
    stack = false,
    close = true,
    description = 'Used to collect and preserve evidence at crime scenes',
    useable = true,
    client = {
        export = 'dp-evidencebag.openEvidenceBag'
    }
},

	["samsungphone"] = {
		label = "Samsung S10",
		weight = 1000,
		stack = true,
		close = true,
		description = "Очень дорогой телефон",
		client = {
			image = "samsungphone.png",
		}
	},

	["jeans"] = {
		label = "Джинсы",
		weight = 0,
		stack = false,
		close = true,
		description = "Джинсы",
		client = {
			image = "jeans.png",
		}
	},
	

	["wet_red_phone"] = {
		label = "Wet Red Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_red_phone.png",
		}
	},

	["brushcamo_attachment"] = {
		label = "Brushstroke Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A brushstroke camo for a weapon",
		client = {
			image = "brushcamo_attachment.png",
		}
	},

	["cuff"] = {
		label = "Cuff",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "cuff.png",
		}
	},

	["comp_attachment"] = {
		label = "Компенсатор",
		weight = 1000,
		stack = true,
		close = true,
		description = "Компенсатор для оружия",
		client = {
			image = "comp_attachment.png",
		}
	},

	["armor"] = {
		label = "Броня",
		weight = 5000,
		stack = true,
		close = true,
		description = "Немного защиты не повредит... верно?",
		client = {
			image = "armor.png",
		}
	},

	["barrel_attachment"] = {
		label = "Ствол",
		weight = 1000,
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

	["whiskey"] = {
		label = "Виски",
		weight = 500,
		stack = true,
		close = true,
		description = "Для всех испытывающих жажду",
		client = {
			image = "whiskey.png",
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
		weight = 1000,
		stack = true,
		close = true,
		description = "Тормозной раструб для оружия",
		client = {
			image = "split_end_muzzle_brake.png",
		}
	},

	["weed_ogkush"] = {
		label = "OGKush 2г",
		weight = 200,
		stack = true,
		close = false,
		description = "Мешок с марихуаной 2 г OGKush",
		client = {
			image = "weed_baggy.png",
		}
	},

	["rope"] = {
		label = "Rope",
		weight = 100,
		stack = true,
		close = true,
		description = "Your description here",
		client = {
			image = "rope.png",
		}
	},

	["newscam"] = {
		label = "Новостная камера",
		weight = 100,
		stack = false,
		close = true,
		description = "Камера для новостей",
		client = {
			image = "newscam.png",
		}
	},

	["digicamo_attachment"] = {
		label = "Цифровой камуфляж",
		weight = 1000,
		stack = true,
		close = true,
		description = "Цифровой камуфляж для оружия",
		client = {
			image = "digicamo_attachment.png",
		}
	},

	["weed_ogkush_seed"] = {
		label = "Семена OGKush",
		weight = 0,
		stack = true,
		close = true,
		description = "Семя марихуаны OGKush",
		client = {
			image = "weed_seed.png",
		}
	},

	["diamond"] = {
		label = "Бриллиант",
		weight = 1000,
		stack = true,
		close = true,
		description = "Бриллиант кажется мне джекпотом!",
		client = {
			image = "diamond.png",
		}
	},

	["veh_wheels"] = {
		label = "Колеса",
		weight = 1000,
		stack = true,
		close = true,
		description = "Улучшить колеса транспортного средства",
		client = {
			image = "veh_wheels.png",
		}
	},

	["weed_purplehaze_seed"] = {
		label = "Семена Пурпурного тумана",
		weight = 0,
		stack = true,
		close = true,
		description = "Семя марихуаны Пурпурного тумана",
		client = {
			image = "weed_seed.png",
		}
	},

	["binoculars"] = {
		label = "Бинокль",
		weight = 600,
		stack = true,
		close = true,
		description = "Скрытый прослушиватель...",
		client = {
			image = "binoculars.png",
		}
	},

	["helmet"] = {
		label = "Шлем",
		weight = 0,
		stack = false,
		close = true,
		description = "Шлем",
		client = {
			image = "helmet.png",
		}
	},

	["clip_attachment"] = {
		label = "Магазин",
		weight = 1000,
		stack = true,
		close = true,
		description = "Магазин для оружия",
		client = {
			image = "clip_attachment.png",
		}
	},

	["wet_blue_phone"] = {
		label = "Wet Blue Phone",
		weight = 700,
		stack = false,
		close = true,
		description = "Did you really think that swimming in the ocean with your phone was a good idea?",
		client = {
			image = "wet_blue_phone.png",
		}
	},

	["luxuryfinish_attachment"] = {
		label = "Роскошная отделка",
		weight = 1000,
		stack = true,
		close = true,
		description = "Роскошная отделка для оружия",
		client = {
			image = "luxuryfinish_attachment.png",
		}
	},

	["firework3"] = {
		label = "WipeOut",
		weight = 1000,
		stack = true,
		close = true,
		description = "Фейерверки",
		client = {
			image = "firework3.png",
		}
	},

	["metalscrap"] = {
		label = "Металлический лом",
		weight = 100,
		stack = true,
		close = false,
		description = "С него можно что-то крутое сделать",
		client = {
			image = "metalscrap.png",
		}
	},

	["weed_skunk"] = {
		label = "Skunk weed",
		weight = 150,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_skunk.png",
		}
	},

	["perseuscamo_attachment"] = {
		label = "Perseus Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A perseus camo for a weapon",
		client = {
			image = "perseuscamo_attachment.png",
		}
	},

	["flat_muzzle_brake"] = {
		label = "Плоский тормозной раструб",
		weight = 1000,
		stack = true,
		close = true,
		description = "Тормозной раструб для оружия",
		client = {
			image = "flat_muzzle_brake.png",
		}
	},

	["meth"] = {
		label = "Метамфетамин",
		weight = 100,
		stack = true,
		close = true,
		description = "Пакет мета",
		client = {
			image = "meth_baggy.png",
		}
	},

	["tunerlaptop"] = {
		label = "Тюнинг-чип",
		weight = 2000,
		stack = false,
		close = true,
		description = "С этим тюнинг-чипом вы можете получить свой автомобиль на стероидах... Если вы знаете, что делаете",
		client = {
			image = "tunerchip.png",
		}
	},

	["coffee"] = {
		label = "Кофе",
		weight = 200,
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
		weight = 2000,
		stack = true,
		close = true,
		description = "Дорогой планшет",
		client = {
			image = "tablet.png",
		}
	},

	["water_bottle"] = {
		label = "Бутылка воды",
		weight = 500,
		stack = true,
		close = true,
		description = "Для всех испытывающих жажду",
		client = {
			image = "water_bottle.png",
		}
	},

	["veh_turbo"] = {
		label = "Турбо",
		weight = 1000,
		stack = true,
		close = true,
		description = "Установить турбонагнетатель в транспортное средство",
		client = {
			image = "veh_turbo.png",
		}
	},

	["rolling_paper"] = {
		label = "Бумага для курения",
		weight = 0,
		stack = true,
		close = true,
		description = "Бумага, специально созданная для оболочки и курения табака или каннабиса.",
		client = {
			image = "rolling_paper.png",
		}
	},

	["weed_white-widow"] = {
		label = "White Widow weed",
		weight = 150,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_white-widow.png",
		}
	},

	["walkstick"] = {
		label = "Ходунки",
		weight = 1000,
		stack = true,
		close = true,
		description = "Ходунки для вас, бабушки.. HAHA",
		client = {
			image = "walkstick.png",
		}
	},

	["veh_interior"] = {
		label = "Интерьер",
		weight = 1000,
		stack = true,
		close = true,
		description = "Улучшить интерьер транспортного средства",
		client = {
			image = "veh_interior.png",
		}
	},

	["leopardcamo_attachment"] = {
		label = "Leopard Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A leopard camo for a weapon",
		client = {
			image = "leopardcamo_attachment.png",
		}
	},

	["weed_nutrition"] = {
		label = "Weed nutrition",
		weight = 500,
		stack = true,
		close = true,
		description = "It does not contain a description.",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["rolex"] = {
		label = "Золотые часы",
		weight = 1500,
		stack = true,
		close = true,
		description = "Золотые часы кажутся мне джекпотом!",
		client = {
			image = "rolex.png",
		}
	},

	["sessantacamo_attachment"] = {
		label = "Sessanta Nove Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A sessanta nove camo for a weapon",
		client = {
			image = "sessantacamo_attachment.png",
		}
	},

	["drum_attachment"] = {
		label = "Барабан",
		weight = 1000,
		stack = true,
		close = true,
		description = "Барабан для оружия",
		client = {
			image = "drum_attachment.png",
		}
	},

	["bellend_muzzle_brake"] = {
		label = "Тормозной раструб с загнутым концом",
		weight = 1000,
		stack = true,
		close = true,
		description = "Тормозной раструб для оружия",
		client = {
			image = "bellend_muzzle_brake.png",
		}
	},

	["veh_suspension"] = {
		label = "Подвеска",
		weight = 1000,
		stack = true,
		close = true,
		description = "Улучшить подвеску транспортного средства",
		client = {
			image = "veh_suspension.png",
		}
	},

	["stickynote"] = {
		label = "Записка",
		weight = 0,
		stack = false,
		close = false,
		description = "Иногда удобно что-то запомнить :)",
		client = {
			image = "stickynote.png",
		}
	},

	['vehiclekeys'] = {
		label = 'Ключи от транспорта',
		weight = 10,
		stack = false,
		close = true,
	},

	['keys'] = {
		label = 'Ключи от двери',
		weight = 10,
		stack = false,
		close = true,
	},


	["stretcher"] = {
		label = "Stretcher",
		weight = 200,
		stack = true,
		close = true,
		description = "A stretcher used to moving patients who require medical care.",
	},

	["icepack"] = {
		label = "Ice Pack",
		weight = 200,
		stack = true,
		close = true,
		description = "An ice pack used to reduce swelling and provide relief from pain and inflammation.",
	},

	["medicalbag"] = {
		label = "Medical Bag",
		weight = 220,
		stack = true,
		close = true,
		description = "A comprehensive medical kit for treating injuries and ailments.",
	},

	["defibrillator"] = {
		label = "Defibrillator",
		weight = 100,
		stack = true,
		close = true,
		description = "Used for reviving patients.",
	},

	["suturekit"] = {
		label = "Suture Kit",
		weight = 100,
		stack = true,
		close = true,
		description = "A kit containing surgical tools and materials for stitching and closing wounds.",
	},

	["tweezers"] = {
		label = "Tweezers",
		weight = 100,
		stack = true,
		close = true,
		description = "Precision tweezers for safely removing foreign objects, such as bullets, from wounds.",
	},

	["emstablet"] = {
		label = "Ems tablet",
		weight = 200,
		stack = true,
		close = true,
	},
	["burncream"] = {
		label = "Burn Cream",
		weight = 100,
		stack = true,
		close = true,
		description = "Specialized cream for treating and soothing minor burns and skin irritations.",
	},
	['medicalbag'] = {
		label = 'Medical Bag',
		weight = 220,
		stack = true,
		description = "A comprehensive medical kit for treating injuries and ailments.",
	},
	
	['bandage'] = {
		label = 'Bandage',
		weight = 100,
		stack = true,
		description = "A simple bandage used to cover and protect wounds.",
	},
	
	['defibrillator'] = {
		label = 'Defibrillator',
		weight = 100,
		stack = true,
		description = "Used for reviving patients.",
	},
	
	['tweezers'] = {
		label = 'Tweezers',
		weight = 100,
		stack = true,
		description = "Precision tweezers for safely removing foreign objects, such as bullets, from wounds.",
	},
	
	['burncream'] = {
		label = 'Burn Cream',
		weight = 100,
		stack = true,
		description = "Specialized cream for treating and soothing minor burns and skin irritations.",
	},
	
	['suturekit'] = {
		label = 'Suture Kit',
		weight = 100,
		stack = true,
		description = "A kit containing surgical tools and materials for stitching and closing wounds.",
	},
	
	['icepack'] = {
		label = 'Ice Pack',
		weight = 200,
		stack = true,
		description = "An ice pack used to reduce swelling and provide relief from pain and inflammation.",
	},
	
	['stretcher'] = {
		label = 'Stretcher',
		weight = 200,
		stack = true,
		description = "A stretcher used to moving patients who require medical care.",
	},
	
	['emstablet'] = {
		label = 'Ems tablet',
		weight = 200,
		stack = true,
		client = {
			export = 'ars_ambulancejob.openDistressCalls'
		}
	},

	["petfood"] = {
		label = "pet food",
		weight = 500,
		stack = true,
		close = true,
		description = "food for your companion!",
		client = {
			image = "petfood.png",
		}
	},

	["keepcompanionmtlion"] = {
		label = "MtLion",
		weight = 500,
		stack = false,
		close = true,
		description = "MtLion is your royal companion!",
		client = {
			image = "A_C_MtLion.png",
		}
	},

	["petwaterbottleportable"] = {
		label = "Portable water bottle",
		weight = 1000,
		stack = false,
		close = true,
		description = "Flask to store water for your pets",
		client = {
			image = "petwaterbottleportable.png",
		}
	},

	["keepcompanionhen"] = {
		label = "Hen",
		weight = 500,
		stack = false,
		close = true,
		description = "Hen is your royal companion!",
		client = {
			image = "A_C_Hen.png",
		}
	},

	["keepcompanioncoyote"] = {
		label = "Coyote",
		weight = 500,
		stack = false,
		close = true,
		description = "Coyote is your royal companion!",
		client = {
			image = "A_C_Coyote.png",
		}
	},

	["keepcompanionrat"] = {
		label = "Rat",
		weight = 500,
		stack = false,
		close = true,
		description = "Your royal companion!",
		client = {
			image = "A_C_Rat.png",
		}
	},

	["keepcompanionrottweiler"] = {
		label = "Rottweiler",
		weight = 500,
		stack = false,
		close = true,
		description = "Rottweiler is your royal companion!",
		client = {
			image = "A_Rottweiler.png",
		}
	},

	["collarpet"] = {
		label = "Pet collar",
		weight = 500,
		stack = true,
		close = true,
		description = "Rename your pets!",
		client = {
			image = "collarpet.png",
		}
	},

	["keepcompanionwesty"] = {
		label = "Westy",
		weight = 500,
		stack = false,
		close = true,
		description = "Westy is your royal companion!",
		client = {
			image = "A_C_Westy.png",
		}
	},

	["keepcompanioncat"] = {
		label = "Cat",
		weight = 500,
		stack = false,
		close = true,
		description = "Cat is your royal companion!",
		client = {
			image = "A_C_Cat_01.png",
		}
	},

	["keepcompanionpoodle"] = {
		label = "Poodle",
		weight = 500,
		stack = false,
		close = true,
		description = "Poodle is your royal companion!",
		client = {
			image = "A_C_Poodle.png",
		}
	},

	["petgroomingkit"] = {
		label = "Pet Grooming Kit",
		weight = 1000,
		stack = false,
		close = true,
		description = "Pet Grooming Kit",
		client = {
			image = "petgroomingkit.png",
		}
	},

	["keepcompanionhusky"] = {
		label = "Husky",
		weight = 500,
		stack = false,
		close = true,
		description = "Husky is your royal companion!",
		client = {
			image = "A_C_Husky.png",
		}
	},

	["keepcompanionmtlion2"] = {
		label = "Panter",
		weight = 500,
		stack = false,
		close = true,
		description = "Panter is your royal companion!",
		client = {
			image = "A_C_MtLion.png",
		}
	},

	["keepcompanionshepherd"] = {
		label = "Shepherd",
		weight = 500,
		stack = false,
		close = true,
		description = "Shepherd is your royal companion!",
		client = {
			image = "A_C_shepherd.png",
		}
	},

	["keepcompanionrabbit"] = {
		label = "Rabbit",
		weight = 500,
		stack = false,
		close = true,
		description = "Rabbit is your royal companion!",
		client = {
			image = "A_C_Rabbit_01.png",
		}
	},

	["petnametag"] = {
		label = "Name tag",
		weight = 500,
		stack = true,
		close = true,
		description = "Rename your pet",
		client = {
			image = "petnametag.png",
		}
	},

	["keepcompanionretriever"] = {
		label = "Retriever",
		weight = 500,
		stack = false,
		close = true,
		description = "Retriever is your royal companion!",
		client = {
			image = "A_C_Retriever.png",
		}
	},

	["firstaidforpet"] = {
		label = "First aid for pet",
		weight = 500,
		stack = true,
		close = true,
		description = "Revive your pet!",
		client = {
			image = "firstaidforpet.png",
		}
	},

	["keepcompanionpug"] = {
		label = "Pug",
		weight = 500,
		stack = false,
		close = true,
		description = "Pug is your royal companion!",
		client = {
			image = "A_C_Pug.png",
		}
	},

	["Mdt"] = {
		label = "Полицейский планшет",
		weight = 100,
		stack = true,
		close = true,
		description = "Планшет копов",
		client = {
			image = "mdt.png",
		}
	},

	["tenkgoldchain"] = {
		label = "10k Gold Chain",
		weight = 2000,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["item_bench"] = {
		label = "Workbench",
		weight = 15000,
		stack = false,
		close = false,
		description = "A workbench to craft items.",
		client = {
			image = "workbench.png",
		}
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
   label = 'Пакетик с марихуаной',
   weight = 20,
   stack = true,
},

['bagged_meth'] = {
   label = 'Пакетик с метом',
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
   label = 'Пакетик с кокаином',
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


	["attachment_bench"] = {
		label = "Attachment Workbench",
		weight = 15000,
		stack = false,
		close = false,
		description = "A workbench for crafting attachments.",
		client = {
			image = "attworkbench.png",
		}
	},


--akqbcrime
['rope'] = {['name'] = 'rope', ['label'] = 'Rope', ['weight'] = 100, ['type'] = 'item', ['image'] = 'rope.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['blindfold'] = {['name'] = 'blindfold', ['label'] = 'Blindfold', ['weight'] = 100, ['type'] = 'item', ['image'] = 'blindfold.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['cuff'] = {['name'] = 'cuff', ['label'] = 'Cuff', ['weight'] = 100, ['type'] = 'item', ['image'] = 'cuff.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},
['key'] = {['name'] = 'key', ['label'] = 'Armbrace', ['weight'] = 100, ['type'] = 'item', ['image'] = 'key.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Your description here'},


--fivecodekey
['vehiclekeys'] = {
    label = 'Vehicle Keys',
    weight = 10,
    stack = false,
    close = true,
},


--qs housing
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

['outfitbag'] = {
	label = 'Outfitbag',
	consume = 0,
	weight = 1,
	client = {
		export = 'krs_outfitbag.outfitbag'
	}
},

['uvlight'] = {
    label = 'UV Light',
    weight = 25,
    stack = true,
    close = true,
    description = 'To scan for fingerprints',
    client = {
        image = 'uvlight.png',
        usable = true
    }
},

['bleachwipes'] = {
    label = 'Bleach Wipes',
    weight = 25,
    stack = true,
    close = true,
    description = 'To clean and sanitize',
    client = {
        image = 'bleachwipes.png',
        usable = true
    },
    combinable = true
},

['bobby_pin'] = {
    label = 'Bobby Pin',
    weight = 2500,
    stack = true,
    close = true,
    description = 'Can be used as a makeshift tool for picking locks',
    client = {
        image = 'bobby_pin.png',
        usable = true
    },
    combinable = true
},

['tracking_bracelet'] = {
    label = 'Tracking Bracelet',
    weight = 2500,
    stack = true,
    close = true,
    description = 'Can be used for tracking a suspect',
    client = {
        image = 'tracking_bracelet.png',
        usable = true
    },
    combinable = true
},

-- Medical Bag
['medbag'] = {
    label = 'Medical Bag',
    weight = 2500,
    stack = true,
    close = true,
    description = 'A bag of medic tools',
    client = {
        image = 'medbag.png',
        usable = true
    }
},

-- Tweezers
['tweezers'] = {
    label = 'Tweezers',
    weight = 50,
    stack = true,
    close = true,
    description = 'For picking out bullets',
    client = {
        image = 'tweezers.png',
        usable = true
    }
},

-- Suture Kit
['suturekit'] = {
    label = 'Suture Kit',
    weight = 60,
    stack = true,
    close = true,
    description = 'For stitching your patients',
    client = {
        image = 'suturekit.png',
        usable = true
    }
},

-- Ice Pack
['icepack'] = {
    label = 'Ice Pack',
    weight = 110,
    stack = true,
    close = true,
    description = 'To help reduce swelling',
    client = {
        image = 'icepack.png',
        usable = true
    }
},

-- Burn Cream
['burncream'] = {
    label = 'Burn Cream',
    weight = 125,
    stack = true,
    close = true,
    description = 'To help with burns',
    client = {
        image = 'burncream.png',
        usable = true
    }
},

-- Defibrillator
['defib'] = {
    label = 'Defibrillator',
    weight = 1120,
    stack = true,
    close = true,
    description = 'Used to revive patients',
    client = {
        image = 'defib.png',
        usable = true
    }
},

-- Sedative
['sedative'] = {
    label = 'Sedative',
    weight = 20,
    stack = true,
    close = true,
    description = 'If needed, this will sedate patient',
    client = {
        image = 'sedative.png',
        usable = true
    }
},

-- Morphine 30MG
['morphine30'] = {
    label = 'Morphine 30MG',
    weight = 2,
    stack = true,
    close = true,
    description = 'A controlled substance to control pain',
    client = {
        image = 'morphine30.png',
        usable = true
    },
    combinable = true
},

-- Morphine 15MG
['morphine15'] = {
    label = 'Morphine 15MG',
    weight = 2,
    stack = true,
    close = true,
    description = 'A controlled substance to control pain',
    client = {
        image = 'morphine15.png',
        usable = true
    },
    combinable = true
},

-- Percocet 30MG
['perc30'] = {
    label = 'Percocet 30MG',
    weight = 2,
    stack = true,
    close = true,
    description = 'A controlled substance to control pain',
    client = {
        image = 'perc30.png',
        usable = true
    },
    combinable = true
},

-- Percocet 10MG
['perc10'] = {
    label = 'Percocet 10MG',
    weight = 2,
    stack = true,
    close = true,
    description = 'A controlled substance to control pain',
    client = {
        image = 'perc10.png',
        usable = true
    },
    combinable = true
},

-- Percocet 5MG
['perc5'] = {
    label = 'Percocet 5MG',
    weight = 2,
    stack = true,
    close = true,
    description = 'A controlled substance to control pain',
    client = {
        image = 'perc5.png',
        usable = true
    },
    combinable = true
},

-- Vicodin 10MG
['vic10'] = {
    label = 'Vicodin 10MG',
    weight = 2,
    stack = true,
    close = true,
    description = 'A controlled substance to control pain',
    client = {
        image = 'vic10.png',
        usable = true
    },
    combinable = true
},

-- Vicodin 5MG
['vic5'] = {
    label = 'Vicodin 5MG',
    weight = 2,
    stack = true,
    close = true,
    description = 'A controlled substance to control pain',
    client = {
        image = 'vic5.png',
        usable = true
    },
    combinable = true
},

-- Medical Kit
['medikit'] = {
    label = 'Medical Kit',
    weight = 110,
    stack = true,
    close = true,
    description = 'A first aid kit for healing injured people.',
    client = {
        image = 'medikit.png',
        usable = true
    },
    combinable = true
},

["silver_coin"] = {
		label = 'Silver Coin',
		weight = 50,
	},

	["gold_coin"] = {
		label = 'Gold Coin',
		weight = 50,
	},

	["charlotte_ring"] = {
		label = 'Charlotte Ring',
		weight = 50,
	},

	["simbolos_chain"] = {
		label = 'Simbolos Chain',
		weight = 100,
	},

	["action_figure"] = {
		label = 'Action Figure',
		weight = 100,
	},

	["nominos_ring"] = {
		label = 'Nominos Ring',
		weight = 50,
	},

	["boss_chain"] = {
		label = 'BOSS Chain',
		weight = 200,
	},

	["branded_cigarette"] = {
		label = 'Branded Cigarette',
		weight = 10,
	},

	["branded_cigarette_box"] = {
		label = 'Branded Cigarette Box',
		weight = 200,
	},

	["ninja_figure"] = {
		label = 'Ninja Figure',
		weight = 50,
	},

	["painting"] = {
		label = 'Painting',
		weight = 100,
	},

	["statue"] = {
		label = 'Statue',
		weight = 200,
	},

	["ancient_egypt_artifact"] = {
		label = 'Ancient Egypt Artifact',
		weight = 200,
	},

	["ruby"] = {
		label = 'Ruby',
		weight = 100,
	},

	["diamond"] = {
		label = 'Diamond',
		weight = 100,
	},

	["danburite"] = {
		label = 'Danburite',
		weight = 100,
	},

	["television"] = {
		label = 'Television',
		weight = 5000,
		stack = false
	},

   ["coffee_machine"] = {
		label = 'Coffee Machine',
		weight = 1000,
		stack = false
	},

	["computer"] = {
		label = 'Computer',
		weight = 2500,
		stack = false
	},

	["microwave"] = {
		label = 'Microwave',
		weight = 3500,
		stack = false
	},

	["music_player"] = {
		label = 'Music Player',
		weight = 2000,
		stack = false
	},

	["lockpick"] = {
		label = 'Lockpick',
		weight = 10,
		stack = true
	},

	["cutter"] = {
		label = 'Cutter',
		weight = 1000,
		stack = true
	},

	["can_injector"] = {
		label = 'CAN Injector',
		weight = 100,
		stack = true
	},

	["can_injector"] = {
		label = 'CAN Injector',
		weight = 100,
		stack = true
	},

	["crime_hood"] = {
		label = 'Hood',
		weight = 100,
		stack = true
	},

	["crime_rims"] = {
		label = 'Rims',
		weight = 100,
		stack = true
	},

	["crime_seat"] = {
		label = 'Seat',
		weight = 100,
		stack = true
	},

	["crime_bumper"] = {
		label = 'Bumper',
		weight = 100,
		stack = true
	},

	["crime_externals"] = {
		label = 'Externals',
		weight = 100,
		stack = true
	},

	["crime_tires"] = {
		label = 'Tires',
		weight = 100,
		stack = true
	},

	["crime_headlights"] = {
		label = 'Headlights',
		weight = 100,
		stack = true
	},

	["crime_turbo"] = {
		label = 'Turbo',
		weight = 100,
		stack = true
	},

	["crime_batterycar"] = {
		label = 'Battery',
		weight = 100,
		stack = true
	},

	["crime_frein"] = {
		label = 'Frein',
		weight = 100,
		stack = true
	},
}