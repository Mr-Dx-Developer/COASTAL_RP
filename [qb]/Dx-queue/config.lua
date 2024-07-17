-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local seconds = 1000
Config = {}

Config.checkForUpdates = false -- Check for updates?

Config.DiscordInfo = {
    botToken = 'MTI0NzQ1ODg3NzE5MzE5MTQ0Ng.GZwDeZ.ClIMgcFK6yzZxrPEJ-4TWewMi92Z4xTEa3Sx0o', -- Your Discord bot token here
    guildID = '835233053823205427', -- Your Discord's server ID here(Aka Guild ID)
}

Config.DiscordWhitelist = { -- Restrict if someone can fly in if they lack specific Discord role(s)
    enabled = true, -- Enable?
    deniedMessage = 'https://discord.gg/SvEqTuPBPH : Join our Discord server and verify to play!', -- Message for those who lack whitelisted role(s)
    whitelistedRoles = {
      --'ROLE_ID_HERE',
        '1148329617376170044', -- Maybe like a civilian role or whitelisted role(can add multiple to table)
    }
}

Config.DiscordQueue = {
    enabled = true, -- Enable? Requires
    refreshTime = 2.5 * seconds, -- How long between queue refreshes(Default: 2.5 * seconds)
    maxConnections = GetConvar('sv_maxclients', 140), -- How many slots do you have avaliable in total for server
    title = 'Bangladesh RolePlay', -- Maybe server name here?

    image = { -- Image shown on adaptive card
        link = 'https://i.ibb.co/W2fY1Cr/BRPS-1.gif', -- Link to image, maybe like a server logo?
        width = '600px', -- Width of image(would not go much higher than this)
        height = '338px' -- Height
    },

    currentQueueText = 'Current queue', -- Title above queue but below image

    currentSpotText = 'Current queue: %s | Online Total: %s/%s', -- Current queue place text

    footerText = 'Visit our discord to reserve a priority queue!', -- The text right above the buttons on the adaptive card

    overflowQueueText = 'and %s more players!\n',

    buttons = { -- The little buttons at the bottom of the screen
        button1 = { -- Webstore button config
            title = 'WebStore',
            iconUrl = 'https://i.imgur.com/8msLEGN.png', -- Little button icon image link
            url = 'https://discord.gg/SvEqTuPBPH' -- Link button goes to
        },
        button2 = {
            title = 'Discord',
            iconUrl = 'https://i.imgur.com/4a1Rdgf.png',
            url = 'https://discord.gg/SvEqTuPBPH'
        }
    },
    roles = {

        { -- This ones provided by default are purely for example
            name = 'Member', -- Name you want displayed as role on queue card
            roleId = '1148329617376170044', -- Role ID of role
            points = 0 -- Points to add to queue(Higher the number, higher the queue)
        },

        {
            name = 'Booster',
            roleId = '852850650299236413',
            points = 10
        },

        {
            name = 'DEV',
            roleId = '1148329440309428224',
            points = 60
        },
    }
}

strings = {
    verifyConnection = '[CRP] Verifying connection...',
    verifyLauncher = '[CRP] Verifying Launcher...',
    verifyDiscord = '[CRP] Verifying Discord...',
    verifyQueue = '[CRP] Adding to queue...',
    notInDiscord = '[CRP] You must join the discord: https://discord.gg/SvEqTuPBPH to fly in!',
    noDiscord = '[CRP] You must have Discord downloaded, installed, and running to connect!',
    error = '[CRP] An error has occured, please try again!',
    noSteam = '[CRP] You must have Steam downloaded, installed and running to connect!',
}
