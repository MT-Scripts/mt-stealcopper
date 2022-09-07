# mt-stealcopper
Simple electric-box robbery for materials

# Config
```
Config.searchTime = 14000 -- seconds it takes to remove materials from electric-box
Config.boxDistance = 2.5 -- distance from electric-box
Config.policeCall = true -- call police set to false if you don't want it
Config.searchableModels = {1709954128, 1131941737, -1625667924, -2007495856, -1620823304, -2008643115} -- searchable models id in gta5
Config.ItemTable = { -- materials that can be robbed
  [1] = "metalscrap",
  [2] = "plastic",
  [3] = "copper",
  [4] = "iron",
  [5] = "aluminum",
  [6] = "steel",
  [7] = "glass",
}
Config.MinItemsReceived = 2
Config.MaxItemsReceived = 5
Config.MinItemReceivedQty = 6
Config.MaxItemReceivedQty = 10

Config.LuckyItem = "rubber" -- lucky item to give if player has a chance
Config.MinLuckyItemReceivedQty = 2
Config.MaxLuckyItemReceivedQty = 10
Config.LuckyItemChance = 5 -- lucky item chance should be between 1 and 100
```


# Dependencies:
qb-core: https://github.com/qbcore-framework/qb-core

qb-target: https://github.com/qbcore-framework/qb-target

qb-policejob: https://github.com/qbcore-framework/qb-policejob

qb-lock: qb-lock: https://github.com/M-Middy/qb-lock

# Preview
https://www.youtube.com/watch?v=tjS9GWmvLII

# Discord
https://discord.gg/AQHbsahZsV 

# Big thanks to abdel1touimi for his rework <3
