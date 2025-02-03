ESX = exports["es_extended"]:getSharedObject()

lib.addCommand(Config.AdminCommand, {
    help = "Open the voucher code creation menu",
    restricted = "admin"
}, function(source)
    TriggerClientEvent("openVoucherAdminMenu", source)
end)

lib.addCommand(Config.ClaimCommand, {
    help = "Open the voucher claim menu"
}, function(source)
    TriggerClientEvent("openVoucherClaimMenu", source)
end)

RegisterNetEvent("zx_codes:createCode", function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not xPlayer then return end

    local code = data.code
    local item = data.item
    local amount = tonumber(data.amount)

    if not code or not item or not amount or amount < 1 then
        TriggerClientEvent("ox_lib:notify", src, { type = "error", description = "Invalid input!" })
        return
    end

    MySQL.Async.execute('INSERT INTO zx_codes (code, item, amount, created_by) VALUES (?, ?, ?, ?)', 
        {code, item, amount, xPlayer.identifier}, function(result)

        if result then
            sendToDiscord("Voucher Code Created", 
                "**Admin:** "..xPlayer.getName().."\n**Code:** "..code.."\n**Item:** "..item.."\n**Amount:** "..amount,
                Config.Webhook)

            TriggerClientEvent("ox_lib:notify", src, { type = "success", description = "Voucher code created!" })
        end
    end)
end)

RegisterNetEvent("zx_codes:claimCode", function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    local code = data.code

    MySQL.Async.fetchAll('SELECT * FROM zx_codes WHERE code = ?', {code}, function(result)
        if result[1] then
            local data = result[1]

            local success = xPlayer.addInventoryItem(data.item, data.amount)

            if success then
                MySQL.Async.execute('DELETE FROM zx_codes WHERE code = ?', {code})

                sendToDiscord("Voucher Claimed", 
                    "**Player:** "..xPlayer.getName().."\n**Code:** "..code.."\n**Item:** "..data.item.."\n**Amount:** "..data.amount,
                    Config.Webhook)

                TriggerClientEvent("ox_lib:notify", src, { type = "success", description = "You have claimed your items!" })
            else
                TriggerClientEvent("ox_lib:notify", src, { type = "error", description = "Your inventory is full!" })
            end
        else
            TriggerClientEvent("ox_lib:notify", src, { type = "error", description = "Invalid or already claimed code!" })
        end
    end)
end)

function sendToDiscord(title, message, webhook)
    local payload = json.encode({
        username = "Voucher Logs",
        embeds = {{
            title = title,
            description = message,
            color = 16711680
        }}
    })

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', payload, { ['Content-Type'] = 'application/json' })
end
