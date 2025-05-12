-- Fonction pour attacher le prop si défini dans la configuration
local function attachPropToPlayer(playerPed, propConfig)
    local playerCoords = GetEntityCoords(playerPed)
    RequestModel(GetHashKey(propConfig.model))
    while not HasModelLoaded(propConfig.model) do
        Wait(500)
    end

    local prop =
        CreateObject(GetHashKey(propConfig.model), playerCoords.x, playerCoords.y, playerCoords.z, true, true, true)
    AttachEntityToEntity(
        prop,
        playerPed,
        GetPedBoneIndex(playerPed, propConfig.bone),
        propConfig.x,
        propConfig.y,
        propConfig.z,
        propConfig.xr,
        propConfig.yr,
        propConfig.zr,
        true,
        true,
        false,
        true,
        1,
        true
    )

    return prop
end

local function removeProp(prop)
    if DoesEntityExist(prop) then
        DeleteObject(prop)
    end
end

local function registerTargetInteractions(targets)
    -- Fonction générique pour enregistrer les cibles
    local function handleTargetInteraction(model, options)
        exports.ox_target:addModel(
            model,
            {
                name = options.name,
                icon = options.icon,
                label = options.label,
                groups = options.groups or nil,
                onSelect = function(data)
                    local playerPed = PlayerPedId()
                    local prop = nil

                    if options.prop then
                        prop = attachPropToPlayer(playerPed, options.prop)
                    end

                    if options.progress then
                        ESX.Progressbar(
                            options.progress.label,
                            options.progress.duration,
                            {
                                FreezePlayer = true,
                                animation = options.animation or nil,
                                onFinish = function()
                                    if prop then
                                        removeProp(prop)
                                    end
                                    TriggerServerEvent(options.event)
                                end,
                                onCancel = function()
                                    if prop then
                                        removeProp(prop)
                                    end
                                    TriggerClientEvent("ESX:Notify", data.source, "error", 5000, "Action annulée.")
                                end
                            }
                        )
                    else
                        if prop then
                            removeProp(prop)
                        end
                        TriggerServerEvent(options.event)
                    end
                end
            }
        )
    end

    -- Ajout des cibles pour les modèles simples
    for model, optionsList in pairs(targets) do
        for _, options in ipairs(optionsList) do
            handleTargetInteraction(model, options)
        end
    end

end

-- Enregistre toutes les interactions configurées
registerTargetInteractions(configTargets)
