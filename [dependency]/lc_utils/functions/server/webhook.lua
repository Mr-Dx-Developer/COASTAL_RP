Utils.Webhook = {}

function Utils.Webhook.sendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "https://discord.com/api/webhooks/1255877312562331729/-EBAtqIVGhNyDg9_LKbmB4l_Ods-3ePJZrylrVw4fSar-jP5LXOMGoxCiwwrsymi9OBn" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end