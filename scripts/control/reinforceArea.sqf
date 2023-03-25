missionNameSpace setVariable ["TOUR_detected", true, true];
[[],{TOUR_siren say3d ['TOUR_snd_airraid', 1500];}] remoteExecCall ["BIS_fnc_spawn", 0, false];
sleep 5;

_tank1 = false;
_tank2 = false;
_tank3 = false;
_tank4 = false;

for "_i" from 1 to (count TOUR_barrackSpawnSpare) do 
{
	if (((!_tank1 or !_tank2 or !_tank3 or !_tank4)&&(count TOUR_barrackSpawnSpare <= 4))or(ceil random 2 > 1)) then 
	{
		if (!_tank1) exitWith 
		{
			TOUR_armour_1 spawn TOUR_fnc_tankCrew;
			_tank1 = true;
		};
		if (!_tank2) exitWith 
		{
			TOUR_armour_2 spawn TOUR_fnc_tankCrew;
			_tank2 = true;
		};
		if (!_tank3) exitWith 
		{
			TOUR_armour_3 spawn TOUR_fnc_tankCrew;
			_tank3 = true;
		};
		if (!_tank4) exitWith 
		{
			TOUR_armour_4 spawn TOUR_fnc_tankCrew;
			_tank4 = true;
		};
	}else 
	{
		[if (random 3 > 1) then {true} else {false}] spawn TOUR_fnc_guards;
	};
};

for "_i" from 1 to (count TOUR_barrackSpawnSpare2) do 
{
	[if (random 3 > 1) then {true} else {false}] spawn TOUR_fnc_guards2;
};

{
	_gp = _x;
	if (!isNull _gp) then 
	{
		if ({alive _x} count units _gp > 0) then 
		{
			for "_i" from count waypoints _gp - 1 to 0 step -1 do
			{
				deleteWaypoint [_gp, _i];
			};
			_gp setSpeedMode "FULL";
			_wp5 = _gp addWaypoint [getMarkerPos format ["TOUR_mkr_guard_%1", ceil random 19], 30];
			_wp5 setWaypointSpeed "NORMAL";
			_wp5 setWaypointType "GUARD";
		};
	};
}ForEach TOUR_grpPatrols;

sleep 5;

[30, TOUR_GAZ_1, false] call TOUR_fnc_GAZResponse;

[31, TOUR_GAZ_2, false] call TOUR_fnc_GAZResponse;

if (("TOUR_objComms" call BIS_fnc_TaskState) != "SUCCEEDED") then 
{
	sleep (100 + (ceil random 200));
	_pos = [getMarkerPos "TOUR_mkr_heliSpawn" select 0, getMarkerPos "TOUR_mkr_heliSpawn" select 1, 100 ];
	_unit = createvehicle ["rhs_mi24v_vdv", _pos, [], 180, "FLY"];
	_grp = createVehicleCrew _unit;
	_unit setPos _pos;
	waitUntil {count units _grp > 0};
	{
		_x call TOUR_fnc_skillAI;
	}forEach units _grp;
	_unit flyInHeight 50;
	_wp1 = _grp addWaypoint [getMarkerPos "TOUR_mkr_objAirStrip", 150];
	_wp1 setWaypointType "MOVE";

	_wp2 = _grp addWaypoint [getMarkerPos "TOUR_mkr_patrol_5", 50];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointSpeed "LIMITED";

	_wp3 = _grp addWaypoint [getMarkerPos "TOUR_mkr_patrol_8", 50];
	_wp3 setWaypointType "MOVE";

	_wp4 = _grp addWaypoint [getMarkerPos "TOUR_mkr_patrol_13", 50];
	_wp4 setWaypointType "MOVE";

	_wp5 = _grp addWaypoint [getMarkerPos "TOUR_mkr_patrol_2", 50];
	_wp5 setWaypointType "CYCLE";
};


