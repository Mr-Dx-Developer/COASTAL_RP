local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1255871011044462727/kM3TtZQrSgAAaFvZZ7Xx3zsgPjz2Wg3jHshhbrPy0lVX8vVhvCVkl2PgsHH76kw-Bwdn**',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1255871482861588702/qJ6PYysjckuyxFfF-UTgXr7bNx-MVxQpEmLIfN6yEJwhFuXoT2iieyzr2P78ro94BtHv',
    ['playermoney'] = 'https://discord.com/api/webhooks/1255871723685806191/6TEgPXVzBFRLhUfxHR2HxCKHNL_8_KxCchEhPo3BzlDPDazbAEDQEhOEu3n0YTCMdZC5',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1255871874571833444/tHLXCppC5_JKotDhVbcA_0rkGltgNkgNZKD2Phmk0s96_eqYnt6YPPxxGjpIRVxTRtf0',
    ['robbing'] = 'https://discord.com/api/webhooks/1255871985955766343/7CyshEKIuzNiXMAWrLK0REcnBUU_yAEUe-J10-W5JrGHvj7-n5TGxlPTlGa6uST1h_Ns',
    ['cuffing'] = 'https://discord.com/api/webhooks/1255872141765640233/p84ekPUthZ6q6Y7bCAzRvnRZ6HghFjbRbFAHKjA-aWelCpLXlbZcezt_S1aEvXOjntqq',
    ['drop'] = 'https://discord.com/api/webhooks/1255872239148994590/tL0xyEG_Iv0-bRu29Vi3gHN0uhpUnqgF4sXpEwOw_x4KVOneOZ9Yk9ii0cBhdjN-IxtV',
    ['trunk'] = 'https://discord.com/api/webhooks/1255872352164515871/ovPK48xJtCLzdp2LHYrHWvmw3rHHszpZhmL-Kr3tY0J2GX2xml97YpmzupytaO75UB4U',
    ['stash'] = 'https://discord.com/api/webhooks/1255872455906430987/QAOjrQIttRvxFpqy1xIMu-PsEMB9qpd2cwWx5K9NyyOq-gBdztZSYlfFK18l9aeeyhkc',
    ['glovebox'] = 'https://discord.com/api/webhooks/1255872567202418692/s93yML3APzQpzEsdU-MUf8MkNX1fsN4yVtRL2o4exp5Pfb97cwtg74e0CX90lE-dYIv4',
    ['banking'] = 'https://discord.com/api/webhooks/1255873123123855370/UCMTlDOZu4faw8uQuvsuFTBUfizm_fMP8Eku2eOLkjNe8obNSQHbMZoQdG3A_czCA2jQ',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1255873212504604773/OaftLEbtfh04VeC6bd_GhPkEUgtZGOIeDgBnvo-iqpQgh3oMhT-kOuR0P5cynxwkXOd6',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1255873322093383831/LABLZCkIC6XNF0Sq6k1jOz0obmg-wvV5GuECSfoB9K4Tu4P0x7hyImm9il2vKtGP8kT2',
    ['shops'] = 'https://discord.com/api/webhooks/1255873504453070888/xXIQYJRiNmmmHyhYC0BLQbkAxd3ysI_60aXoMM0EDNTRc6YjBwuhtCw1k4-izWu9ybrm',
    ['dealers'] = 'https://discord.com/api/webhooks/1255873598565122229/wa-JCNhlFAsZFrvk7aQPUfh1mJbgQXIFVPHbbfrEAB-T75OTUt2AOO0K1rsLyZY-ef58,
    ['storerobbery'] = 'https://discord.com/api/webhooks/1255873729448378428/yzGo5aPts1D4zvYQNrKESoVSF3VsK84h9972GTnt0nIx98IZYUxobiBKIwcZtzhvdpcx',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1255873832674136135/NkHHee06Wig7RNtAjV0qZ4RI4EBAIm2PQMdUTi4DA5Mpb-E5RQr9ksCK8j5WvZmUbhK2',
    ['powerplants'] = 'https://discord.com/api/webhooks/1255874041181503488/cVwK86Q5_B_A3qvvxuCiNLwyXUOmtCLZknQ3GOpZVypyYWQc5W6N8qqQ_lZ5roNv1u-c',
    ['death'] = 'https://discord.com/api/webhooks/1255874160970698802/ibC2RpJhRpMChP53QaYC7eYb_XqmjjwNYx8iJTN1OD6hzDFmwEgyqTC2TZ97lLwbGCzz',
    ['joinleave'] = 'https://discord.com/api/webhooks/1255874268059926688/yOMDNaES1syFHPkmTHgN-BT1rwehqra040UxUisKrmv3tSFRZLEbaoAVawvU-0EGUoJ9',
    ['ooc'] = 'https://discord.com/api/webhooks/1255874550881849395/qfyn0efrghYUMIJYW8qNXH5dtoiKFS27UN6J_B2oOKIv5n2ew1I70HTtHfR3fbPuWVJI',
    ['report'] = 'https://discord.com/api/webhooks/1255874654762045470/P-YNvp7eJWR64ELnra8RSnDl3XEl7aATp5M71DlDkWe66y_23UuMQkj1tgmC6yURvwVN',
    ['me'] = 'https://discord.com/api/webhooks/1255874760110505994/rRu8FEIPaYpQXqt2HFwAVOviMcPMj34C3D4eXJ7oMOgQfi7MENA-FwDqhAnTUS4LE9KW',
    ['pmelding'] = 'https://discord.com/api/webhooks/1255874904923045950/qxTamfcJg2SMSj2diIvvwdJ9k-kAXahBeAYMIjbt4s9zbQF-92hX9B2NT9BhACj7UcT7',
    ['112'] = 'https://discord.com/api/webhooks/1255875016445394965/o6wKpSKfHIQkdSrs2I1ZllzXtWgpdPRBjl952dxs3NfY8kPtZyxjgEK4YZ2gke5cqxFs',
    ['bans'] = 'https://discord.com/api/webhooks/1255875165322084434/_5H_fDqvL6yYjyp0Dabfbca0LkbcmzEtAIXWHWw4WrLjzJYkm42g7rv0fXl6leNcE5HE',
    ['anticheat'] = 'https://discord.com/api/webhooks/1255875328824447037/CFSpuDclKdrQ75tokWXibx4Xg6M78tNmpJ1yt3BGgOF81eXzB3XivQhlId2CjWywpqCD',
    ['weather'] = 'https://discord.com/api/webhooks/1255875437142474762/ZxrJYdW9D13JXnUWLo86WafJeEOLQ8e0b9Ta-jZ6RB-gUeaEeU3NCVYXPP4iY0SzIcf0',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1255875748019966043/ayZ83Lg3AXES4vwy3vK3ThhQ4XcZs9W72Za6Uww3AUj3dqRRp8ccoTNzqBRVjDaP3YbK',
    ['bennys'] = 'https://discord.com/api/webhooks/1255875860804665364/aHZoYrclQIJyTyVLmOMGxFNh-U4f0Y1bMbSOqrFQ3oyHNeVvtOKPfSIxxmzuSkHSRB2w',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1255876276192022539/wD8bxoWJrTgB5Xuxr0EOcQ4aOaoebeyJzzXXtgAMCagODkD216_VSmVn_iiLN7uudhSG',
    ['robbery'] = 'https://discord.com/api/webhooks/1255876414356328510/UP5SYVSEREwy-MZM_e5r4AGqODeg17wZfQ92dUOjkR6qoDs-x_QBLtb7IWmPu8RUEOlg',
    ['casino'] = 'https://discord.com/api/webhooks/1255876505326850070/mmswSu6BFlAcxw8O7RyaYK0QSM3VU4JuOG8jwUN7f-x05k2Tn6H_NtnDQwqOsEc7KVVA',
    ['traphouse'] = 'https://discord.com/api/webhooks/1255876566412693565/ZbPNcMqJxK0B002g672csxHyxDiIlE9MpOg74majkRX7a86esfQ8tvM31TxlWi1O4z33',
    ['911'] = 'https://discord.com/api/webhooks/1255876637510336644/KBmqQq8X6BJoO9I6hNO-vpK0ZK8M-8H9JXbFkY39Vi6_XdM4YiRQAHuuWh_iRzE45lXT',
    ['palert'] = 'https://discord.com/api/webhooks/1255876705164329073/-6JqTQ2rI3d32NMoskYA1-X0pwbPmarvFZy27rW0BQjU_uHps0Pn9kzrvX9AMgcZxvr1',
    ['house'] = 'https://discord.com/api/webhooks/1255876760143138906/SDjEaozzFeltYtckeiMgFsXOPOiDnSq1QyLOVAEBCCKaZb9gT5ApGlYvGAxM2OByC8-d',
    ['qbjobs'] = 'https://discord.com/api/webhooks/1255876835397341276/h0HuNpel3l411_hfiDbExcY8oO9OJ6746zzXBa51tMzk0MD0w3pAvOcTG6PTMOfPMXBP',
}

local colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone, imageUrl)
    local postData = {}
    local tag = tagEveryone or false

    if Config.Logging == 'discord' then
        if not Webhooks[name] then
            print('Tried to call a log that isn\'t configured with the name of ' .. name)
            return
        end
        local webHook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']
        local embedData = {
            {
                ['title'] = title,
                ['color'] = colors[color] or colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = 'QBCore Logs',
                    ['icon_url'] = 'https://raw.githubusercontent.com/GhzGarage/qb-media-kit/main/Display%20Pictures/Logo%20-%20Display%20Picture%20-%20Stylized%20-%20Red.png',
                },
                ['image'] = imageUrl and imageUrl ~= '' and { ['url'] = imageUrl } or nil,
            }
        }

        if not logQueue[name] then logQueue[name] = {} end
        logQueue[name][#logQueue[name] + 1] = { webhook = webHook, data = embedData }

        if #logQueue[name] >= 10 then
            if tag then
                postData = { username = 'QB Logs', content = '@everyone', embeds = {} }
            else
                postData = { username = 'QB Logs', embeds = {} }
            end
            for i = 1, #logQueue[name] do postData.embeds[#postData.embeds + 1] = logQueue[name][i].data[1] end
            PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
            logQueue[name] = {}
        end
    elseif Config.Logging == 'fivemanage' then
        local FiveManageAPIKey = GetConvar('FIVEMANAGE_LOGS_API_KEY', 'false')
        if FiveManageAPIKey == 'false' then
            print('You need to set the FiveManage API key in your server.cfg')
            return
        end
        local extraData = {
            level = tagEveryone and 'warn' or 'info', -- info, warn, error or debug
            message = title,                          -- any string
            metadata = {                              -- a table or object with any properties you want
                description = message,
                playerId = source,
                playerLicense = GetPlayerIdentifierByType(source, 'license'),
                playerDiscord = GetPlayerIdentifierByType(source, 'discord')
            },
            resource = GetInvokingResource(),
        }
        PerformHttpRequest('https://api.fivemanage.com/api/logs', function(statusCode, response, headers)
            -- Uncomment the following line to enable debugging
            -- print(statusCode, response, json.encode(headers))
        end, 'POST', json.encode(extraData), {
            ['Authorization'] = FiveManageAPIKey,
            ['Content-Type'] = 'application/json',
        })
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'QB Logs', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds + 1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
