QBCore = exports['qb-core']:GetCoreObject()

Camera = nil
Object = nil
menu = false
Licenses = {}

Citizen.CreateThread(function()
    if Config.School.blip.toggle then
        local blip = AddBlipForCoord(Config.School.coords.x, Config.School.coords.y, Config.School.coords.z)
        SetBlipSprite(blip, Config.School.blip.id)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Config.School.blip.scale)
        SetBlipColour(blip, Config.School.blip.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.School.blip.title)
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 1000
        local playerPed = PlayerPedId()
        local pedCoords = GetEntityCoords(playerPed)
        if #(Config.School.coords - pedCoords) <= 3.0 then
            wait = 5
            helpText(Config.Translations.enter)
            if IsControlJustPressed(0,38) then
                Wait(10)
                FreezeEntityPosition(playerPed, true)
                NetworkSetEntityInvisibleToNetwork(playerPed, true)
                SetEntityVisible(playerPed, false)
                SetEntityInvincible(playerPed, true)
                dmvmenu()
            end
        end
    Citizen.Wait(wait)
    end
end)

function dmvmenu()
    TriggerServerEvent('east_dmv:getLicenses')
    local k = 1
    menu = true
    local playerPed = PlayerPedId()
    spawnMenu(k)
    while menu do
        if Config.Objects[k].isVehicle then
            local text = Config.Translations.noTheory
            if Licenses['dmv'] and not Licenses[Config.Objects[k].category] then
                text = Config.Translations.beginExam
            elseif Licenses[Config.Objects[k].category] then
                text = Config.Translations.completed
            end
            helpText((Config.Translations.menu):format(Config.Objects[k].label, Config.Objects[k].price, text))
            if IsControlJustPressed(0,176) and Licenses['dmv'] and not Licenses[Config.Objects[k].category] then
                local check = nil
                QBCore.Functions.TriggerCallback('east_dmv:hasMoney', function(paid)
                    if paid then 
                        check = true
                    else
                        notify(Config.Translations.notEnough)
                        check = false
                    end
                end, Config.Objects[k].price)
                while check == nil do Wait(1) end
                if check then startExam(Config.Objects[k]) end
            end
        else
            local text = Config.Translations.beginExam
            if Licenses['dmv'] then
                text = Config.Translations.passedTheory
            end
            helpText((Config.Translations.menu):format(Config.Objects[k].label, Config.Objects[k].price, text))
            if IsControlJustPressed(0,176) and not Licenses['dmv'] then
                local check = nil
                QBCore.Functions.TriggerCallback('east_dmv:hasMoney', function(paid)
                    if paid then 
                        check = true
                    else
                        notify(Config.Translations.notEnough)
                        check = false
                    end
                end, Config.Objects[k].price)
                while check == nil do Wait(1) end
                if check then startTheory(Config.Objects[k].label) end
            end
        end
        if IsControlJustPressed(0,177) then
            menu = false
        elseif IsControlJustPressed(0,174) then
            if (k-1) <= 0 then k = #Config.Objects else k = k - 1 end
            spawnMenu(k)
        elseif IsControlJustPressed(0,175) then
            if (k+1) > #Config.Objects then k = 1 else k = k + 1 end
            spawnMenu(k)
        end
    Wait(5)
    end
    menu = false
    leave()
    DeleteEntity(Object)
    Object = nil
end

function spawnMenu(k)
    local hash = GetHashKey(Config.Objects[k].name)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
       Wait(1)
    end
    if Object then DeleteEntity(Object) Object = nil end
    if not Object then
        if Config.Objects[k].isVehicle then
            Object = CreateVehicle(hash, Config.Preview.coords, Config.Preview.heading, false, false)
            SetEntityAlpha(Object, 204, false)
        else
            Object = CreateObject(hash, vec3(Config.Preview.coords), false, false, false)
            SetEntityHeading(Object, Config.Preview.heading)
            SetEntityAlpha(Object, 204, false)
        end
        PlaceObjectOnGroundProperly(Object)
    end
    SetModelAsNoLongerNeeded(hash)
    createCamera()
end

function helpText(text)
    AddTextEntry(GetCurrentResourceName(), text)
    DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
end

function startTheory(label)
    local theory = true
    local correct = 0
    local vehicles = {}
    local k, past = 1, 0
    while theory do
        if past < k then
            DoScreenFadeOut(1000)
            Wait(1000)
            for k,v in pairs(vehicles) do
                DeleteVehicle(v)
                vehicles[k] = nil
            end
            for i = 1,#Config.Theory[k].vehicles do
                local hash = GetHashKey(Config.Theory[k].vehicles[i].model)
                RequestModel(hash)
                while not HasModelLoaded(hash) do
                Wait(1)
                end
                vehicles[i] = CreateVehicle(hash, vec3(Config.Theory[k].vehicles[i].coords.x, Config.Theory[k].vehicles[i].coords.y, Config.Theory[k].vehicles[i].coords.z), Config.Theory[k].vehicles[i].heading, false, false)
                SetVehicleCustomPrimaryColour(vehicles[i], Config.Theory[k].vehicles[i].color[1], Config.Theory[k].vehicles[i].color[2], Config.Theory[k].vehicles[i].color[3])
                SetVehicleEngineOn(vehicles[i], true, true, true)
                SetVehicleLights(vehicles[i], 2)
                SetVehicleSteeringAngle(vehicles[i], Config.Theory[k].vehicles[i].wheelAngle)
                SetVehicleIndicatorLights(vehicles[i], 1, Config.Theory[k].vehicles[i].lights.left)
                SetVehicleIndicatorLights(vehicles[i], 0, Config.Theory[k].vehicles[i].lights.right)
                SetVehicleSiren(vehicles[i], Config.Theory[k].vehicles[i].lights.sirens)
                PlaceObjectOnGroundProperly(vehicles[i])
                SetEntityCollision(vehicles[i], false)
                FreezeEntityPosition(vehicles[i], true)
                SetModelAsNoLongerNeeded(hash)
            end
            SetFocusArea(Config.Theory[k].camera.coords.x, Config.Theory[k].camera.coords.y, Config.Theory[k].camera.coords.z, Config.Theory[k].camera.coords.x, Config.Theory[k].camera.coords.y, Config.Theory[k].camera.coords.z)
            SetCamRot(Camera, Config.Theory[k].camera.tilt, 0.0, Config.Theory[k].camera.heading)
            SetCamCoord(Camera, Config.Theory[k].camera.coords.x, Config.Theory[k].camera.coords.y, Config.Theory[k].camera.coords.z)
            past = k
            DoScreenFadeIn(1000)
        end
        helpText('['..k..'/'..#Config.Theory..'] '..Config.Theory[k].question..'\n'..'\n'..Config.DisplayKeys.firstOption..' '..Config.Theory[k].answers[1].text..'\n'..Config.DisplayKeys.secondOption..' '..Config.Theory[k].answers[2].text..'\n'..Config.DisplayKeys.thirdOption..' '..Config.Theory[k].answers[3].text)
        if IsControlJustPressed(0,Config.Keys.firstOption) or IsDisabledControlJustPressed(0,Config.Keys.firstOption) then
            HudWeaponWheelIgnoreSelection()
            if Config.Theory[k].answers[1].correct then correct = correct + 1 end
            if k >= #Config.Theory then theory = false else k = k + 1 end
        elseif IsControlJustPressed(0,Config.Keys.secondOption) or IsDisabledControlJustPressed(0,Config.Keys.secondOption) then
            HudWeaponWheelIgnoreSelection()
            if Config.Theory[k].answers[2].correct then correct = correct + 1 end
            if k >= #Config.Theory then theory = false else k = k + 1 end
        elseif IsControlJustPressed(0,Config.Keys.thirdOption) or IsDisabledControlJustPressed(0,Config.Keys.thirdOption) then
            HudWeaponWheelIgnoreSelection()
            if Config.Theory[k].answers[3].correct then correct = correct + 1 end
            if k >= #Config.Theory then theory = false else k = k + 1 end
        end
        Wait(5)
    end
    if ((correct/#Config.Theory)*100) >= Config.Rates.theory then notify(Config.Translations.theory) TriggerServerEvent('east_dmv:addLicense', 'dmv') else notify(Config.Translations.tooManyMistakes) end
    for k,v in pairs(vehicles) do
        DeleteVehicle(v)
        vehicles[k] = nil
    end
    DoScreenFadeOut(1000)
    Wait(1000)
    Camera = nil
    createCamera()
    DoScreenFadeIn(1000)
    return
end

function startExam(info)
    local exam = true
    local k = 1
    local correct = 0
    local coords = GetOffsetFromEntityInWorldCoords(Object, -0.0, 8.0, 0.0)
    DoScreenFadeOut(1000)
    Wait(1000)
    SetEntityAlpha(Object, 255, false)
    SetCamCoord(Camera, coords.x, coords.y, coords.z + 3.0)
    SetCamRot(Camera, -20.0, 0.0, Config.Preview.heading - 180.0)
    DoScreenFadeIn(1000)
    while exam do
        helpText('['..tonumber(k)..'/'..#Config.ExamQuestions[info.category]..'] '..Config.ExamQuestions[info.category][k].question..'\n'..'\n'..Config.DisplayKeys.firstOption..' '..Config.ExamQuestions[info.category][k].answers[1].text..'\n'..Config.DisplayKeys.secondOption..' '..Config.ExamQuestions[info.category][k].answers[2].text..'\n'..Config.DisplayKeys.thirdOption..' '..Config.ExamQuestions[info.category][k].answers[3].text)
        if IsControlJustPressed(0,Config.Keys.firstOption) or IsDisabledControlJustPressed(0,Config.Keys.firstOption) then
            HudWeaponWheelIgnoreSelection()
            if Config.ExamQuestions[info.category][k].answers[1].correct then correct = correct + 1 end
            if k >= #Config.ExamQuestions[info.category] then exam = false else k = k + 1 end
        elseif IsControlJustPressed(0,Config.Keys.secondOption) or IsDisabledControlJustPressed(0,Config.Keys.secondOption) then
            HudWeaponWheelIgnoreSelection()
            if Config.ExamQuestions[info.category][k].answers[2].correct then correct = correct + 1 end
            if k >= #Config.ExamQuestions[info.category] then exam = false else k = k + 1 end
        elseif IsControlJustPressed(0,Config.Keys.thirdOption) or IsDisabledControlJustPressed(0,Config.Keys.thirdOption) then
            HudWeaponWheelIgnoreSelection()
            if Config.ExamQuestions[info.category][k].answers[3].correct then correct = correct + 1 end
            if k >= #Config.ExamQuestions[info.category] then exam = false else k = k + 1 end
        end
        Wait(5)
    end
    if ((correct/#Config.ExamQuestions[info.category])*100) >= Config.Rates.examQuestions then
        local driving = true
        if Object then DeleteEntity(Object) end
        local hash = GetHashKey(info.name)
        RequestModel(hash)
        while not HasModelLoaded(hash) do Wait(1) end
        Object = CreateVehicle(hash, Config.Preview.coords, Config.Preview.heading, true, false)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(Object))
        SetVehicleFuelLevel(Object, 100.0)
        SetModelAsNoLongerNeeded(hash)
        leave()
        TaskWarpPedIntoVehicle(PlayerPedId(), Object, -1)
        while not IsPedInVehicle(PlayerPedId(), Object, false) do Wait(1) end
        local i = 1
        local n = 1
        local m = 0
        local last = false
        local RouteBlip = nil
        local speed = 0.0
        local distance = 0.0
        local mistakes = 0
        while driving do
            if not IsPedInVehicle(PlayerPedId(), Object, false) then 
                if Config.TpBack then
                    DoScreenFadeOut(1000)
                    Wait(1000)
                    SetEntityCoords(PlayerPedId(), Config.School.coords, true, false, false, false)
                    DoScreenFadeIn(1000)
                end
                driving = false 
            end
            DrawMarker(1, Config.Driving[i].checkpoint.x, Config.Driving[i].checkpoint.y, Config.Driving[i].checkpoint.z -0.8, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.7, 255, 255, 255, 255, 0, 0, 2, 0)
            if i > 1 then n = i - 1 end
            if Config.Driving[n].text and not Config.Driving[n].shown then notify(Config.Driving[n].text) Config.Driving[n].shown = true end
            if Config.SpeedUnit == "kmh" then
                speed = math.ceil(GetEntitySpeed(Object)*3.6)
            else
                speed = math.ceil(GetEntitySpeed(Object)* 2.236936)
            end
            if Config.Driving[i].speedUntil and speed > Config.Driving[i].speedUntil and m == 0 then
                mistakes = mistakes + 1
                notify((Config.Translations.speeding):format(mistakes, Config.DrivingMistakes))
            end
            if #(GetEntityCoords(PlayerPedId()) - Config.Driving[i].checkpoint) > distance and m == 0 and i ~= 1 then
                mistakes = mistakes + 1
                notify((Config.Translations.tooFar):format(mistakes, Config.DrivingMistakes))
            end
            if #(Config.Driving[i].checkpoint - GetEntityCoords(PlayerPedId())) <= 3.0 and not last then
                if i < #Config.Driving then i = i + 1 else i = #Config.Driving last = true end
                if DoesBlipExist(RouteBlip) then
                    RemoveBlip(RouteBlip)
                end
                RouteBlip = AddBlipForCoord(Config.Driving[i].checkpoint.x, Config.Driving[i].checkpoint.y, Config.Driving[i].checkpoint.z)
				SetBlipRoute(RouteBlip, 1)
                distance = #(GetEntityCoords(PlayerPedId()) - Config.Driving[i].checkpoint) + 50.0
            elseif #(Config.Driving[i].checkpoint - GetEntityCoords(PlayerPedId())) <= 3.0 and last then
                TaskLeaveVehicle(PlayerPedId(), Object, 0)
                Wait(1000)
                driving = false
            end
            if mistakes > Config.DrivingMistakes then 
                notify(Config.Translations.kickedOut)
                if Config.TpBack then
                    DoScreenFadeOut(1000)
                    Wait(1000)
                    SetEntityCoords(PlayerPedId(), Config.School.coords, true, false, false, false)
                    DoScreenFadeIn(1000)
                end
                driving = false
            end
            if m < 400 then m = m + 1 else m = 0 end
            Wait(3)
        end
        if DoesBlipExist(RouteBlip) then
            RemoveBlip(RouteBlip)
        end
        if mistakes <= Config.DrivingMistakes and last then notify((Config.Translations.passed):format(info.label)) TriggerServerEvent('east_dmv:addLicense', info.category) end
        menu = false
    else
        notify(Config.Translations.tooManyMistakes)
        DoScreenFadeOut(1000)
        Wait(1000)
        SetEntityAlpha(Object, 204, false)
        SetCamCoord(Camera, coords.x, coords.y+3.0, coords.z + 4.0)
        SetCamRot(Camera, -20.0, 0.0, Config.Preview.heading - 195.0)
        DoScreenFadeIn(1000)
    end
end

function createCamera()
    if not Camera and Object then
        local coords = GetOffsetFromEntityInWorldCoords(Object, -0.0, 8.0, 0.0)
        Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        RenderScriptCams(1, 1, 1000, 1, 1)
        SetCamActive(Camera, true)
        SetFocusArea(coords.x, coords.y+3.0, coords.z + 4.0, coords.x, coords.y+3.0, coords.z + 4.0)
        SetCamRot(Camera, -20.0, 0.0, Config.Preview.heading - 195.0)
        SetCamFov(Camera, 60.0)
        SetCamCoord(Camera, coords.x, coords.y+3.0, coords.z + 4.0)
    end
end

function destroyCamera()
    if Camera then
        DestroyCam(Camera)
        RenderScriptCams(false, true, 500, 1, 0)
        SetFocusEntity(GetPlayerPed(PlayerId()))
        Camera = false
    end
end

function leave()
    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, false)
    NetworkSetEntityInvisibleToNetwork(playerPed, false)
    SetEntityVisible(playerPed, true)
    SetEntityInvincible(playerPed, false)
    destroyCamera()
end

RegisterNetEvent('east_dmv:loadLicenses')
AddEventHandler('east_dmv:loadLicenses', function(licenses)
	Licenses = licenses
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    leave()
    if Object then DeleteEntity(Object) end
end)