function StartElectricianAnim()
    local plyPed = PlayerPedId()
	TaskStartScenarioInPlace(plyPed, 'WORLD_HUMAN_WELDING', 0, true)
end