private ["_tank", "_grp", "_unit", "_number", "_building"];
_tank = _this;

_grp = createGroup EAST;
_grp deleteGroupWhenEmpty false;
_number = TOUR_barrackSpawnSpare call BIS_fnc_selectRandom;
TOUR_barrackSpawnSpare = TOUR_barrackSpawnSpare - [_number];

for "_i" from 1 to 3 do 
{
	call compile format ["_unit = _grp createUnit [""rhsgref_ins_crew"", (TOUR_barrackSpawn_%1 buildingPos _i), [], 0, ""NONE""]; _building = TOUR_barrackSpawn_%1", _number];
	sleep 1;
	call compile format ["_unit setPosATL (TOUR_barrackSpawn_%1 buildingPos _i)", _number];
	switch (_i) do 
	{
		case 1: {_unit assignAsCommander _tank};
		case 2: {_unit assignAsDriver _tank};
		case 3: {_unit assignAsGunner _tank};
	};
	_unit call TOUR_fnc_skillAI;
	_unit setSkill ["courage", 1];
	_unit allowFleeing 0;
	_unit additem "NVGoggles_OPFOR";
	_unit assignItem "NVGoggles_OPFOR";
};

(units _grp) allowGetIn true;
(units _grp) orderGetIn true;

[_building, _grp, _number] spawn 
{
	waitUntil {{(_x distance (_this select 0) < 30)}count units (_this select 1) == 0};
	[false, (_this select 2)] spawn TOUR_fnc_guards;
};

while {{alive _x}count units _grp > 0} do 
{
	(units _grp) orderGetIn true;
	(units _grp) allowGetIn true;
	sleep 5;
	if ({vehicle _x != _tank} count units _grp == 0) exitWith
	{
		_wp = _grp addWaypoint [getMarkerPos "TOUR_mkr_objAirstrip", 15];
		_wp setWaypointType "MOVE";

		_wp1 = _grp addWaypoint [getMarkerPos "TOUR_mkr_objAirstrip", 50];
		_wp1 setWaypointType "GUARD";
	};
};
