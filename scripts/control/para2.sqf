_pos = [getMarkerPos "TOUR_mkr_para2_1" select 0, getMarkerPos "TOUR_mkr_para2_1" select 1, 100 ];
_unit = createvehicle ["UK3CB_BAF_Chinook_HC2_Arctic", _pos, [], 112, "FLY"];
TOUR_paraChopper2 = _unit;
_grp = createVehicleCrew _unit;
_unit setPos _pos;

waitUntil {count units _grp > 0};
{
	_x call TOUR_fnc_skillAI;
	_x allowFleeing 0;
	_x setSkill ["courage", 1];
	_x disableAI "autotarget";
	_x disableAI "target";
	_x disableAI "FSM";
	_x setVariable ["lambs_danger_disableAI", true];
}forEach units _grp;
_unit flyInHeight 75;

TOUR_paraUnits2 = [];
{
	_grpPara = [getMarkerPos "TOUR_mkr_para2_1", WEST, (configFile >> "CfgGroups" >> "West" >> "UK3CB_BAF_Faction_Army_Arctic" >> "Infantry" >> _x)] call BIS_fnc_spawnGroup;
	
	{
		_x assignAsCargo _unit;
		_x moveInCargo [_unit, _forEachIndex];
		_x call TOUR_fnc_skillAI;
		TOUR_paraUnits2 pushBackUnique _x;
	}forEach units _grpPara;
}forEach ["UK3CB_BAF_Army_Arctic_HWAT","UK3CB_BAF_Army_Arctic_HWAT","UK3CB_BAF_Army_Arctic_HWAT"];

TOUR_paraChopper2 doMove getMarkerPos "TOUR_mkr_para2_2";

waitUntil {TOUR_paraChopper2 distance getMarkerPos "TOUR_mkr_para22" < 2000};

missionNameSpace setVariable ["TOUR_assaultWaveArrived", true, true];

waitUntil {TOUR_paraChopper2 distance getMarkerPos "TOUR_mkr_para2_2" < 300};
TOUR_paraChopper2 land "get out";

{unassignVehicle _x;}forEach TOUR_paraUnits2;

while {((getposATL TOUR_paraChopper2) select 2) > 10} do 
{
	sleep 20;
	TOUR_paraChopper2 land "get out";
};

{
	if (_x == leader group _x) then 
	{
		_wpp = group _x addWaypoint [getMarkerPos "TOUR_mkr_objAirstrip", 50];
		_wpp setWaypointType "MOVE";
		_wpp = group _x addWaypoint [getMarkerPos "TOUR_mkr_objAirstrip", 50];
		_wpp setWaypointType "GUARD";
	};
}forEach TOUR_paraUnits2;

waitUntil {{alive _x && vehicle _x == TOUR_paraChopper2} count TOUR_paraUnits == 0};

while {getMarkerPos "TOUR_mkr_para2_4" distance _unit < 500} do 
{
	TOUR_paraChopper2 doMove getMarkerPos "TOUR_mkr_para2_4";
	sleep 10;
};

waitUntil {getMarkerPos "TOUR_mkr_para2_4" distance _unit < 500};

deleteVehicle _unit;
{
	deleteVehicle _x;
}forEach units _grp;