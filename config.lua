configTargets = {

        ["prop_vend_coffe_01"] = {
            {
                name = "buy_coffee",
                icon = "fas fa-coffee",
                label = "Acheter un café pour $2",
                event = "ton_buy_coffee",
                progress = {label = "Achat en cours", duration = 5000},
                animation = {type = "anim", dict = "mp_common", lib = "givetake1_a"}
            }
        },
        ["prop_vend_soda_02"] = {
            {
                name = "buy_soda",
                icon = "fa-glass-martini-alt",
                label = "Acheter un sprunk pour 5$",
                event = "ton_buy_sprunk",
                progress = {label = "Achat en cours", duration = 5000},
                animation = {type = "anim", dict = "mp_common", lib = "givetake1_a"}
            },
            {
                name = "buy_soda_light",
                icon = "fa-glass-martini-alt",
                label = "Acheter un sprunk light pour 5$",
                event = "ton_buy_sprunklight",
                progress = {label = "Achat en cours", duration = 5000},
                animation = {type = "anim", dict = "mp_common", lib = "givetake1_a"}
            }
        },
        ["prop_bar_ice_01"] = {
            {
                name = "give_ice",
                icon = "fa-glass-martini-alt",
                label = "Récupérer des glaçons",
                event = "ton_give_ice",
                progress = {label = "Achat en cours", duration = 5000},
                animation = {type = "anim", dict = "mp_common", lib = "givetake1_a"}
            }
        },
        ["prop_vend_soda_01"] = {
            {
                name = "buy_soda",
                icon = "fa-glass-martini-alt",
                label = "Acheter un E.cola pour 5$",
                event = "ton_buy_ecola",
                progress = {label = "Achat en cours", duration = 5000},
                animation = {type = "anim", dict = "mp_common", lib = "givetake1_a"}
            },
            {
                name = "buy_soda_light",
                icon = "fa-glass-martini-alt",
                label = "Acheter un E.cola light pour 5$",
                event = "ton_buy_ecola_light",
                progress = {label = "Achat en cours", duration = 5000},
                animation = {type = "anim", dict = "mp_common", lib = "givetake1_a"}
            }
        },
        ["prop_watercooler"] = {
            {
                name = "buy_water",
                icon = "fa-glass-martini-alt",
                label = "Remplir sa bouteille d'eau",
                event = "ton_remplir_bouteille",
                progress = {label = "Remplissage en cours", duration = 8000},
                animation = {type = "anim", dict = "mp_common", lib = "givetake1_a"}
            }
        },
        ["prop_waterwheela"] = {
            {
                name = "remplissage_arrosoir",
                icon = "fa-glass-martini-alt",
                label = "Remplir son arrosoir d'eau",
                event = "ton_remplir_arrosoir",
                progress = {label = "Remplissage en cours", duration = 10000},
                animation = {type = "anim", dict = "amb@prop_human_bum_bin@base", lib = "base"},
                prop = {
                    model = "prop_wateringcan",
                    bone = 28422,
                    x = -0.4,
                    y = -0.1,
                    z = -0.1,
                    xr = 58.0,
                    yr = 0.0,
                    zr = 108.0
                }
            }
        },
        ["prop_hose_3"] = {
            {
                name = "remplissage_arrosoir",
                icon = "fa-glass-martini-alt",
                label = "Remplir son arrosoir d'eau",
                event = "ton_remplir_arrosoir",
                progress = {label = "Remplissage en cours...", duration = 10000},
                animation = {type = "anim", dict = "amb@prop_human_bum_bin@base", lib = "base"},
                prop = {
                    model = "prop_wateringcan",
                    bone = 28422,
                    x = -0.4,
                    y = -0.1,
                    z = -0.1,
                    xr = 58.0,
                    yr = 0.0,
                    zr = 108.0
                }
            } 
        },
        ["prop_news_disp_02a"] = {
            {
                name = "buy_off_journal",
                icon = "fas fa-coffee",
                label = "Acheter le journal officiel $5",
                event = "buy_off_journal",
                progress = {label = "Achat en cours", duration = 5000},
                animation = {type = "anim", dict = "mp_common", lib = "givetake1_a"}
            }
        }
}


event_action_list = {
    ['ton_buy_coffee'] = {price = 2, items = {{item = 'coffee', amount = 1}}, label = 'café'},
    ['ton_remplir_bouteille'] = {price = 0, items = {{item = 'water', amount = 1}}, removeItems = {{item = 'empty_bottle', amount = 1}}, label = 'eau'},
    ['ton_buy_ecola'] = {price = 5, items = {{item = 'ecola', amount = 1}}, label = 'E.cola'},
    ['ton_buy_ecola_light'] = {price = 5, items = {{item = 'ecola_light', amount = 1}}, label = 'E.cola light'},
    ['ton_buy_sprunk'] = {price = 5, items = {{item = 'sprunk', amount = 1}}, label = 'sprunk'},
    ['ton_buy_sprunklight'] = {price = 5, items = {{item = 'sprunklight', amount = 1}}, label = 'sprunk light'},
    ['ton_give_ice'] = {price = 0, items = {{item = 'ice', amount = 5}}, label = 'glaçons'},
    ['ton_coffee:burger-softdrink'] = {price = 0, items = {{item = 'burger-softdrink', amount = 1}}, label = 'Soda'},
    ['ton_coffee:burger-softdrink2'] = {price = 0, items = {{item = 'burger-softdrink2', amount = 1}}, label = 'Soda light'},
    ['ton_coffee:burger-coffee'] = {price = 0, items = {{item = 'burger-coffee', amount = 1}}, label = 'Expresso'},
    ['ton_coffee:burger-coffee2'] = {price = 0, items = {{item = 'burger-coffee2', amount = 1}}, label = 'Grand Café'},
    ['ton_remplir_arrosoir'] = {price = 0, items = {{item = 'watering_can_full', amount = 1}}, removeItems = {{item = 'watering_can', amount = 1}}, label = 'eau'},
    ['buy_off_journal'] = {price = 5, account='society_police', items = {{item = 'journal_officiel', amount = 1}}, label = 'Journal'},
    -- ['ton_buy_combo'] = {price = 10, items = {{item = 'coffee', amount = 1}, {item = 'ecola', amount = 2}}, label = 'combo café et E.cola'}
}