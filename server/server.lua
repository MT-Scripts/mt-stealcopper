local QBCore = exports['qb-core']:GetCoreObject()
local boxStolen = {}
local CachedPoliceAmount = {}

local function giveStealedItemsToPlayer()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  for _ = 1, math.random(Config.MinItemsReceived, Config.MaxItemsReceived), 1 do
    local randItem = Config.ItemTable[math.random(1, #Config.ItemTable)]
    local amount = math.random(Config.MinItemReceivedQty, Config.MaxItemReceivedQty)
    Player.Functions.AddItem(randItem, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
    Wait(500)
  end

  local chance = math.random(1, 100)
  if chance <= Config.LuckyItemChance then
    local amount = math.random(Config.MinLuckyItemReceivedQty, Config.MaxLuckyItemReceivedQty)
    Player.Functions.AddItem(Config.LuckyItem, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LuckyItem], 'add')
  end
end

RegisterServerEvent('mt-stealcopper:server:stealedbox', function(objectCoords)
	boxStolen[objectCoords] = true
  giveStealedItemsToPlayer()
end)

QBCore.Functions.CreateCallback('mt-stealcopper:server:getbox', function(source, cb, objectCoords)
  local objectCoords = objectCoords
	cb(boxStolen[objectCoords])
end)

QBCore.Functions.CreateCallback('mt-stealcopper:server:GetCops', function(source, cb)
  local src = source
	local amount = 0
  for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
    if v.PlayerData.job.name == Config.policeJobName and v.PlayerData.job.onduty then
      amount = amount + 1
    end
  end
  CachedPoliceAmount[src] = amount
  cb(amount)
end)