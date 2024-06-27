local WebHooks = {
    ["exploit"] = "https://discord.com/api/webhooks/1255888943053017108/B792XXxvOkVUOZ0WWA7VWeIy42_hgq0V7CIkDv2YA0PTFDl1oP4mMYLbvtSkyO2tymH2",
    ["triggered"] = "https://discord.com/api/webhooks/1255889000326234112/ng_QNR3ZGsd6XXlktoYQyyzqIra7E4RVqOoZ3DV7CAGW4h_tbaaxyRvwOXxAGboj0PQG",
    ["report"] = "https://discord.com/api/webhooks/1255889056122802318/5OwQmjB53LL2u8lgjjeQu7FRdNRYYzDIYc0ldqGqSK1y8lVMx_5Ts26WLhgrABUtMO7C",
    ["transcript"] = "https://discord.com/api/webhooks/1255889117347319868/5m33IgCojSss061ne6zYleDR_1CMaub2Mypt8naARmwr98HFMt29dmA2DZqKcBYk0ag4",
    ["bans"] = "https://discord.com/api/webhooks/1255889173471301672/MsZJAfw_JcMWqhKwn6SVN_PXZ0pFRqct49waI1TLSsH_ZKhZ2J5k0hfFEoTaRJ7TubAz",
    ["duty"] = "https://discord.com/api/webhooks/1255889231683911681/tuZQyyu0Q0li5_z-obI6HNvgyFh0ao1dZBzekkDAqeus8VwYC9qZ5ic5EE8tAVX9d3dm", -- when they player logs in on duty
    ["dutylog"] = "https://discord.com/api/webhooks/1255889231683911681/tuZQyyu0Q0li5_z-obI6HNvgyFh0ao1dZBzekkDAqeus8VwYC9qZ5ic5EE8tAVX9d3dm" -- when they player logs off duty
}

function SendLogs(source, type, message)
    local colorcode = 5763719
    if type == "exploit" then
        colorcode = 16711680
    end
    local description = ""
    if source == 0 then
        description = "**"..message.."**"
    else
        description = "**"..GetPlayerName(source).."** ("..source..")\n"..message
    end
    if type == "report" then
        description = "**"..GetPlayerName(source).."** ".. message
    end
    local embedData = {
        {
            ["title"] = "Admin Menu Logs" ,
            ["color"] = colorcode,
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            ["description"] = description,
            ["author"] = {
            ["name"] = 'Snipe Admin Menu Logs',
            },
        }
    }
    if type == "transcript" then
        embedData[1].title = "Chat Transcript (Closed by "..GetPlayerName(source)..")"
        embedData[1].footer.text = "Closed on "..os.date("%c")
        embedData[1].description = message
        description = ""
    end
    PerformHttpRequest(WebHooks[type], function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end

function SendDutyLogs(source, isOnDuty, timeDiff)
    local colorcode = 5763719
    local webhook = WebHooks["duty"]
    if not isOnDuty then
        colorcode = 16711680
        webhook = WebHooks["dutylog"]
    end
    local name = GetPlayerName(source) or "Player Dropped"
    local status = isOnDuty and "On Duty" or "Off Duty"
    local embedData = {
        {
            ["title"] = "Snipe Duty Logs" ,
            ["color"] = colorcode,
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            -- ["description"] = description,
            ["fields"] = {
                {
                    ["name"] = "Player Info",
                    ["value"] = "```"..source.." | "..name.."```",
                    ["inline"] = false,
                },
                {
                    ["name"] = "Status",
                    ["value"] = "```"..status.."```",
                    ["inline"] = true,
                },

            },
            ["author"] = {
                ["name"] = 'Snipe Admin Menu Logs',
            },
        }
    }

    if not isOnDuty then
        local timeSpentString = ""
        if timeDiff >= 60 then
            local minutes = math.floor(timeDiff / 60)
            local seconds = timeDiff - (minutes * 60)
            timeSpentString = minutes.." minutes and "..seconds.." seconds"
        else
            timeSpentString = timeDiff.." seconds"
        end
        embedData[1].fields[3] = {
            ["name"] = "Time Spent",
            ["value"] = "```"..timeSpentString.."```",
            ["inline"] = true,
        }
    end

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end


RegisterServerEvent("snipe-menu:server:sendLogs", function(type, message)
    local source = source
    if type == "exploit" then
        SendLogs(source, type, message)
    elseif type == "triggered" then
        SendLogs(source, type, message)
    end
end)