function notification(icon,appname,title, message, time ,sound)
	if sound == nil then
		sound = 'default'
	end
	SendNUIMessage({
		action = 'open',
		sound = sound,
		icon = icon,
		title = title,
		message = message,
		time = time,
		appname = appname
	})
end

function Show(data)
    notification(data.icon, data.appname, data.title, data.message, data.time ,data.sound)
end

RegisterNetEvent('ataNotification:show')
AddEventHandler('ataNotification:show', function(data)
    Show({
        icon = data.icon,
        appname = data.appname,
        title = data.title,
        time = data.time,
        message = data.message,
        sound = data.sound
    })
end)

---- Example cmd 
--- Tuturial 
--[[

 color : https://getbootstrap.com/docs/4.0/utilities/colors/
 icon : https://fontawesome.com/v5.15/icons/keyboard


--SERVER:

TriggerClientEvent('ataNotification:show', source, {
    sound = 'not1',
    icon = 'fas fa-exclamation-circle text-danger',
    title = 'Nastala chyba',
    message = 'hi world',
    time = 7000,
    appname = 'Server'
})

CLIENT:

exports['ataNotification']:Show({
    sound = 'not1',
    icon = 'fas fa-exclamation-circle text-danger',
    title = 'Nastala chyba',
    message = 'hi world',
    time = 7000,
    appname = 'Server'
})

	time = 5000 - 15000 good

	sound = default or not1 or not2 and you can add new sound to html/sound
	


]]--
RegisterCommand('long', function()
	exports['ataNotification']:notification('far fa-keyboard text-primary','Long text test',"This is long text test", "Lorem, ipsum dolor sit amet consectetur adipisicing elit. odio harum explicabo eligendi quibusdam pariatur temporibus ducimus, ea iste! Fugit temporibus aliquam tempore sint ipsum? Beatae, sed. Perspiciatis mollitia voluptatum aperiam est!		", 15000,'not1')
end)

RegisterCommand('gmail', function()
	exports['ataNotification']:notification('far fa-envelope-open text-danger','GMAIL',"", "You have been accepted to Harvard University. Click on the link below to see more information", 15000)
end)

RegisterCommand('error', function()
	exports['ataNotification']:notification('fas fa-exclamation-circle text-danger','Server',"ERROR", "You do not have permission to do this", 15000)
end)
RegisterCommand('whatsapp', function()
	exports['ataNotification']:notification('fab fa-whatsapp text-success','WHATSAPP',"Carl Johnson", "Hello Where Are You ??", 15000,'not2')
end)


RegisterCommand('visa', function()
	exports['ataNotification']:notification('fab fa-cc-visa text-info','Visa',"Transfer Money", "You Have Sent 300$ To Ata!", 15000,"not1")
end)

RegisterCommand('test', function()
	exports['ataNotification']:notification('far fa-check-circle text-success','Your Server Name',"SUCCESS", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia.", 15000)
end)


RegisterCommand("startscenescaner", function()
TriggerEvent("utku:hackinganim")

end)



RegisterNetEvent("utku:hackinganim")
AddEventHandler("utku:hackinganim", function()
    local animDict = "anim@heists@ornate_bank@hack"

    RequestAnimDict(animDict)
    RequestModel("hei_prop_hst_laptop")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("hei_prop_heist_card_hack_02")

    while not HasAnimDictLoaded(animDict)
        or not HasModelLoaded("hei_prop_hst_laptop")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
        or not HasModelLoaded("hei_prop_heist_card_hack_02") do
        Citizen.Wait(100)
    end
    local ped = PlayerPedId()
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
    local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", 253.34, 228.25, 101.39, 253.34, 228.25, 101.39, 0, 2) -- Animasyon kordinatları, buradan lokasyonu değiştirin // These are fixed locations so if you want to change animation location change here
    local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", 253.34, 228.25, 101.39, 253.34, 228.25, 101.39, 0, 2)
    local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", 253.34, 228.25, 101.39, 253.34, 228.25, 101.39, 0, 2)
    -- part1
    FreezeEntityPosition(ped, true)
    local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), targetPosition, 1, 1, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
    local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
    NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
    local card = CreateObject(GetHashKey("hei_prop_heist_card_hack_02"), targetPosition, 1, 1, 0)
    NetworkAddEntityToSynchronisedScene(card, netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)
    -- part2
    local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)
    -- part3
    local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)
    --event başlangıç
    SetPedComponentVariation(ped, 5, 0, 0, 0) -- çantayı yok ediyoruz eğer varsa // removes bag from ped so no 2 bags
    SetEntityHeading(ped, 63.60) -- Animasyon düzgün oturması için yön // for proper animation direction

    NetworkStartSynchronisedScene(netScene)
    Citizen.Wait(4500) -- Burayı deneyerek daha iyi hale getirebilirsiniz // You can try editing this to make transitions perfect
    NetworkStopSynchronisedScene(netScene)

    NetworkStartSynchronisedScene(netScene2)
    Citizen.Wait(4500)
    NetworkStopSynchronisedScene(netScene2)

    NetworkStartSynchronisedScene(netScene3)
    Citizen.Wait(4500)
    NetworkStopSynchronisedScene(netScene3)

    DeleteObject(bag)
    DeleteObject(laptop)
    DeleteObject(card)
    FreezeEntityPosition(ped, false)
    SetPedComponentVariation(ped, 5, 45, 0, 0) -- çantayı pede geri veriyor // gives bag back to ped
end)




