if (isServer) then
{
	[_this] remoteExecCall ["TOUR_SI_fnc_radioEndSpeech", 0, false];
	missionNameSpace setVariable ["TOUR_assaultWave", true, true];		
	[]spawn
	{	
		TDMC_mission_complete = true;
		sleep 15;
		TDMC_mission_running = false;
		TOUR_SI_core setVariable ["TOUR_SI_inuse", nil, true];		
	};
};


