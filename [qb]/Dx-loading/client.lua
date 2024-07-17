local spawned = false						

AddEventHandler("playerSpawned", function ()
	if not spawned then
		spawned = true
		ShutdownLoadingScreenNui()
	end
end)