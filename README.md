# mt-stealcopper
Simple copper robbery for QBCore

# Dependencies:
qb-core: https://github.com/qbcore-framework/qb-core
qb-target: https://github.com/BerkieBb/qb-target
qb-lock: qb-lock: https://github.com/M-Middy/qb-lock

# Preview
https://youtu.be/Zu9TovZG6cE

# Discord
https://discord.gg/AQHbsahZsV 

# Add to init.lua on qb-target:
```
	["stealcopper"] = {
        models = {
            1709954128,
			1131941737,
			-1625667924,
			-2007495856,
			-1620823304,
			-2008643115,
        },
        options = {
            {
                type = "client",
                event = "mt-stealcopper:client:RoubarCobre",
                icon = "fas fa-mask",
                label = "Steal Copper",
            },
        },
        distance = 1.5,
    },
```
