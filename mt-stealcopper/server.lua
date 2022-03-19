local QBCore = exports['qb-core']:GetCoreObject()

local timer = 10 * 60 * math.random(1000, 10000)

RegisterServerEvent('mt-stealcopper:server:RoubarCobre', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 20)
    
    Player.Functions.AddItem("copper", quantity)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["copper"], "add")
end)

RegisterServerEvent('mt-stealcopper:server:ComecarCooldown')
AddEventHandler('mt-stealcopper:server:ComecarCooldown', function(caixa)
    comecarCooldown(source, caixa)
end)

function comecarCooldown(id, object)
    Citizen.CreateThread(function()
        Citizen.Wait(timer)
        TriggerClientEvent('mt-stealcopper:server:ComecarCooldown', id, object)
    end)
end