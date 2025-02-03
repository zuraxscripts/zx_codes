RegisterNetEvent('openVoucherAdminMenu', function()
    local input = lib.inputDialog("Create Voucher Code", {
        { type = "input", label = "Enter Code", placeholder = "XXXXX-XXXXX" },
        { type = "input", label = "Item Name", placeholder = "money, weapon_pistol, etc." },
        { type = "number", label = "Amount", min = 1, placeholder = "1, 10, 100" }
    })

    if input and input[1] and input[2] and input[3] then
        TriggerServerEvent("zx_codes:createCode", {
            code = input[1],
            item = input[2],
            amount = input[3]
        })
    else
        lib.notify({ type = 'error', description = 'Invalid input!' })
    end
end)

RegisterNetEvent('openVoucherClaimMenu', function()
    local input = lib.inputDialog("Claim Voucher", {
        { type = "input", label = "Enter Code", placeholder = "XXXXX" }
    })

    if input and input[1] then
        TriggerServerEvent("zx_codes:claimCode", {
            code = input[1]
        })
    else
        lib.notify({ type = 'error', description = 'Invalid code!' })
    end
end)