local searched = {3423423424}
local canSearch = true
local caixas = {1709954128, 1131941737, -1625667924, -2007495856, -1620823304, -2008643115}
local searchTime = 14000
local idle = 0
local caixaPos
local nearCaixa = false
local maxDistance = 2.5
local listening = false
local caixa
local currentCoords = nil
local realCaixa

local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    local dist = 0
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local playerCoords, awayFromCaixa = GetEntityCoords(PlayerPedId()), true
        if not nearCaixa then
            for i = 1, #caixas do
                local distance
                caixa = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, caixas[i], false, false, false)
                if caixa ~= 0 then
                    realCaixa = caixa 
                end
                caixaPos = GetEntityCoords(caixa)
                local distance = #(pos - caixaPos)
                if distance < maxDistance then
                    currentCoords = caixaPos
                end
                if distance < maxDistance then
                    awayFromCaixa = false
                    nearCaixa = true
                end
            end
        end
        if currentCoords ~= nil and #(currentCoords - playerCoords) > maxDistance then
            nearCaixa = false
            listening = false
        end
        if awayFromCaixa then
            Citizen.Wait(1000)
        end
    end
end)

RegisterNetEvent("mt-stealcopper:client:RoubarCobre", function() 
    listening = true
    currentlySearching = false
    notifiedOfFailure = false
    Citizen.CreateThread(function()
        while listening do
            local caixaFound = false
            Citizen.Wait(10)
            for i = 1, #searched do
                if searched[i] == realCaixa then
                    caixaFound = true
                end
                if i == #searched and caixaFound and not notifiedOfFailure then
                    QBCore.Functions.Notify('You already steal here...', 'error')
                    notifiedOfFailure = true
                    Citizen.Wait(1000)
                elseif i == #searched and not caixaFound and not currentlySearching then
                    currentlySearching = true
                    exports['qb-lock']:StartLockPickCircle(5,30)
                    local success = exports['qb-lock']:StartLockPickCircle(5,10)
                    QBCore.Functions.Progressbar("RoubarCobre", "STEALING COPPER...", 5000, false, false, {
                        disableMovement = false,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function()
                        TriggerServerEvent("mt-stealcopper:server:RoubarCobre")
                        notifiedOfFailure = true
                        TriggerServerEvent('mt-stealcopper:server:ComecarCooldown', caixa)
                        table.insert(searched, realCaixa)
                    end, function()
                        QBCore.Functions.Notify('You canceled the stealing', 'error')
                    end)
                end
            end
        end
    end)
end)