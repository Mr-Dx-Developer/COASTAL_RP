-----------------For support, scripts, and more----------------
--------------- https://discord.gg/VGYkkAYVv2  -------------
---------------------------------------------------------------
CreateThread(function ()
    local meetingroom = BoxZone:Create(vector3(437.552, -997.73, 31.307), 11.4, 11.2, {
        name="mrpdmeetingroom",
        heading=0,
        -- debugPoly=true,
        minZ=30.97,
        maxZ=32.77,
    })
    local classroom =  BoxZone:Create(vector3(625.47, 5.08, 87.73), 10.0, 10.0, {
        name="mrpdmeetingroom",
        heading=0,
        -- debugPoly=true,
        minZ=86.73,
        maxZ=88.73
    })
    meetingroom:onPlayerInOut(function(isPointInside)
        if isPointInside then
            inMeetingRoom = true
            GetDui("mrpdmeeting")
        else
            inMeetingRoom = false
            DestroySpawnedDui("mrpdmeeting")
        end
    end, 500)

    classroom:onPlayerInOut(function(isPointInside)
        if isPointInside then
            inClassRoom = true
            GetDui("classroom")
        else
            inClassRoom = false
            DestroySpawnedDui("classroom")
        end
    end, 500)
end)
