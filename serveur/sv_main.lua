-- Fonction pour traiter les achats ou dons avec plusieurs items
local function handlePurchaseOrGiveItems(xPlayer, data)
    if xPlayer.getMoney() >= data.price then
        if data.price > 0 then
            xPlayer.removeMoney(data.price)
            if data.account ~= nil then
                TriggerEvent('esx_addonaccount:getSharedAccount', data.account, function(account)
                    account.addMoney(data.price)
                end)
            end
        end

        -- Suppression des items, s'il y en a
        if data.removeItems then
            for _, removeData in pairs(data.removeItems) do
                local hasItem = exports.ox_inventory:Search(xPlayer.source, 'count', removeData.item)
                if hasItem >= removeData.amount then
                    exports.ox_inventory:RemoveItem(xPlayer.source, removeData.item, removeData.amount)
                    TriggerClientEvent('ESX:Notify', xPlayer.source, "info", 5000, 'Vous avez utilisé ' .. removeData.amount .. ' de ' .. removeData.item)
                else
                    TriggerClientEvent('ESX:Notify', xPlayer.source, "error", 5000, 'Vous n\'avez pas assez de ' .. removeData.item)
                    return
                end
            end
        end

        -- Ajout des items
        for _, itemData in pairs(data.items) do
            local success = exports.ox_inventory:AddItem(xPlayer.source, itemData.item, itemData.amount)
            if success then
                TriggerClientEvent('ESX:Notify', xPlayer.source, "success", 5000, 'Vous avez reçu ' .. itemData.amount .. ' de ' .. itemData.item)
            else
                TriggerClientEvent('ESX:Notify', xPlayer.source, "error", 5000, 'Erreur lors de l\'ajout de ' .. itemData.item .. ' dans l\'inventaire.')
            end
        end

        -- Notification pour le paiement si c'est un achat
        if data.price > 0 then
            TriggerClientEvent('ESX:Notify', xPlayer.source, "success", 5000, 'Vous avez payé $' .. data.price .. ' pour ' .. data.label)
        end
    else
        TriggerClientEvent('ESX:Notify', xPlayer.source, "error", 5000, 'Vous n\'avez pas assez d\'argent pour acheter ' .. data.label)
    end
end

-- Boucle sur chaque événement dans purchases
for event, data in pairs(event_action_list) do
    RegisterNetEvent(event)
    AddEventHandler(event, function()
        local xPlayer = ESX.GetPlayerFromId(source)
        handlePurchaseOrGiveItems(xPlayer, data)
    end)
end
