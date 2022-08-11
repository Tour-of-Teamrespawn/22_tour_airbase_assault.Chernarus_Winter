_player = _this select 0;
_officer = _this select 1;
_action = _this select 2;

if (!isDedicated) then
{
	TOUR_officer removeAction _action;
	TOUR_mission_ending = true;
	publicVariable "TOUR_mission_ending";
};

_player directSay "TOUR_reportingback";
sleep 5;
_officer directSay "TOUR_welcomeback";
sleep 5;

_success = if 
				(
					("TOUR_objAirstrip" call A2S_taskState == "SUCCEEDED")
				) 
				then {true} else {false};

if (!_success) then
{
	_player directSay "TOUR_playernotgood";
	sleep 5;
	_officer directSay "TOUR_officernotgood";
}else
{
	_player directSay "TOUR_playergood";
	sleep 5;
	_officer directSay "TOUR_officergood";
};