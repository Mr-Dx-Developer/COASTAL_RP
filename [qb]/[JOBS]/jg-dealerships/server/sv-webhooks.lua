--
-- Discord Webhooks
--
Webhooks = {}
Webhooks.TestDrive = "https://discord.com/api/webhooks/1255864711744979017/eGtlof_J46QS0bxuOLmPhs4hUiQvlhDyoMThZKMPnSUhkHxIAGzYxZ7MniqRpgk2m3S-"
Webhooks.Purchase = "https://discord.com/api/webhooks/1255864778136489989/W_AxNi1bbWs4_IXkCrV575YYw22g5LqAzz9sECXsy6dLjWgixhnRKEXjKJbVcnPLMcff"
Webhooks.Finance = "https://discord.com/api/webhooks/1255864842611462194/Tf4qN1CsNR_j2PQeDhmBURHbQaljjoMaM7LgWKAvAXktpRDYFMewa1gQ89J-mWH7rbCX"
Webhooks.Dealership = "https://discord.com/api/webhooks/1255864938526801951/IeYB_LHmtNRrobKWjR4jzXmJo6uOb9nhIs6b6CcoOCCMPB2yZONy4sB2deJSHH7yawDo"
Webhooks.Admin = "https://discord.com/api/webhooks/1255865000451375146/_PYGSjsaP8pEDMNbuiQQLwWIrRRQ8OSfFUqe4dT45UXU8brtLXMXiYGn2FfNHWq86kI6"

--[[
  EXAMPLE WEBHOOK CALL

  Functions.SendWebhook(src, Webhooks.Admin, "Webhook Title", "success", {
    { key = "Data fields", value = "Data value" },
    { key = "Data fields 2", value = "Data value 2" }
  })
]]--

function Functions.SendWebhook(playerId, webhookUrl, title, type, data)
  if not webhookUrl then return end

  local player = Framework.Server.GetPlayerInfo(playerId)
  if not player then return false end

  local color = 0xff6700
  if type == "success" then color = 0x2ecc71 end
  if type == "danger" then color = 0xe74c3c end

  local fields = {
    {
      name = "Player",
      value = string.format("%s (id: %s)", player.name, tostring(playerId)),
      inline = false
    }
  }
  for _, row in pairs(data) do
    fields[#fields + 1] = {
      name = row.key,
      value = tostring(row.value),
      inline = true
    }
  end

  local body = {
    username = "JG Dealerships Webhook",
    avatar_url = "https://forum.cfx.re/user_avatar/forum.cfx.re/jgscripts/288/3621910_2.png",
    content = "",
    embeds = {
      {
        type = "rich",
        title = title,
        description = "",
        color = color,
        fields = fields
      }
    }
  }

  PerformHttpRequest(
    webhookUrl,
    function(err, text, header) end,
    "POST",
    json.encode(body),
    {["Content-Type"] = "application/json"}
  )
end

-- For sending from client files...
RegisterNetEvent("jg-dealerships:server:send-webhook", function(event, ...)
  local src = source
  Functions.SendWebhook(src, Webhooks[event], ...)
end)
