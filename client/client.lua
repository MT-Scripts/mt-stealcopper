local QBCore = exports['qb-core']:GetCoreObject()

local function PoliceCall()
    local chance = 75
    if GetClockHours() >= 1 and GetClockHours() <= 6 then
        chance = 50
    end
    if math.random(1, 100) <= chance then
        TriggerServerEvent('police:server:policeAlert', Lang:t("stealboxes.police_notification"))
    end
end

local function startStealingBox(entity)
    QBCore.Functions.Progressbar("stealingBox", Lang:t("stealboxes.stealing_animation_label"), Config.searchTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 49,
    }, {}, {}, function()
        if DoesEntityExist(entity) then
            NetworkRegisterEntityAsNetworked(entity)
            Wait(100)
            NetworkRequestControlOfEntity(entity)
            SetEntityAsMissionEntity(entity)
            Wait(100)
            TriggerServerEvent("pp2-stealboxes:server:stealedbox")
            DeleteEntity(entity)
            QBCore.Functions.Notify(Lang:t("stealboxes.box_removed"), "primary")
        end
    end, function()
        Lang:t("stealboxes.stealing_animation_canceled")
    end)
end

CreateThread(function()
    exports['qb-target']:AddTargetModel(
        Config.searchableModels, 
        {
            options = {
                {
                    targeticon = 'fas fa-mask', 
                    icon = "fas fa-mask",
                    type = "client",
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end
                        TriggerEvent('pp2-stealboxes:client:steal', entity)
                    end,
                    label = Lang:t("stealboxes.target_label"),
                    item = "advancedlockpick",
                }
            },
            distance = Config.boxDistance,
        }
    )
end)

RegisterNetEvent("pp2-stealboxes:client:steal", function(entity)
    if Config.policeCall then PoliceCall() end
    local success = exports['qb-lock']:StartLockPickCircle(2,30)
    if success then
        success = exports['qb-lock']:StartLockPickCircle(4,10)
        if success then
            startStealingBox(entity)
        else
            QBCore.Functions.Notify(Lang:t("stealboxes.messed_up_error"), 'error')
        end
    else
        QBCore.Functions.Notify(Lang:t("stealboxes.messed_up_error"), 'error')
    end
end)
