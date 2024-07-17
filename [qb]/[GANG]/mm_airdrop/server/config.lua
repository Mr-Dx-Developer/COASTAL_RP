if Shared.Ready then
    lib.addCommand('airdrop', {
        help = 'Call an Airdrop',
        params = {},
        restricted = 'group.admin'
    }, function(source)
        ExecuteAirdropCommand(source)
    end)
end

-- remove item used to open crate (ref client/config.lua -> line 21)
RegisterNetEvent('mm_airdrop:server:removeitem', function()
    Airdrop:RemoveItem(source, 'wrench', 1)
end)

---@class logdata
---@field type 'loot' | 'landed' | 'explode' | 'start' | 'stop' | 'drop' | 'open'
---@field title string
---@field msg string
---@field color number

---@param data logdata
RegisterNetEvent('mm_airdrop:server:generatelog', function(data)
    local webhook = ''
    local embedData = {
        {
            ['title'] = data.title,
            ['color'] = data.color,
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = data.msg,
            ['author'] = {
                ['name'] = 'Airdrop Log',
                ['icon_url'] = '',
            },
        }
    }
    PerformHttpRequest(webhook, function() end, 'POST', json.encode({ username = 'Airdrop Log', embeds = embedData}), { ['Content-Type'] = 'application/json' })
end)