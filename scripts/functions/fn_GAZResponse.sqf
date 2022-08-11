private ["_pos", "_grp", "_unit", "_number", "_type", "_types", "_building", "_car", "_onFoot"];
_number = _this select 0;
_car = _this select 1;
_onFoot = _this select 2;

_pos = getMarkerPos "TOUR_mkr_GAZGuard";
_grp = createGroup EAST;
_grp deleteGroupWhenEmpty false;
_building = call compile format ["TOUR_barrackSpawn_%1", _number];

_types = [
	"rhs_vdv_rifleman",
	"rhs_vdv_arifleman_rpk",
	"rhs_vdv_LAT"
];

for "_i" from 1 to 4 do 
{
	call compile format ["_unit = _grp createUnit [""%2"", (%1 buildingPos %3), [], 0, ""NONE""]; _unit setPos (%1 buildingPos %3); ", _building, _types call BIS_fnc_selectRandom, _i];
	sleep 0.1;
	_unit call TOUR_fnc_skillAI;
	_unit setSkill ["courage", 1];
	_unit allowFleeing 0;
};

if !(_onFoot) then 
{
	units _grp allowGetin true;
	{
		switch (_forEachIndex) do 
		{
			case 0: {_x assignAsDriver _car};
			case 1: {_x assignAsGunner _car};
			default {_x assignAsCargo _car};
		};
	}forEach units _grp;
	units _grp orderGetIn true;
};

while {{alive _x}count units _grp > 0} do 
{
	(units _grp) orderGetIn true;
	sleep 5;
	if ({alive _x && (vehicle _x != _car)} count units _grp == 0) exitWith
	{
		_wp = _grp addWaypoint [_pos, (ceil random 40)];
		_wp setWaypointType "MOVE";

		_wp1 = _grp addWaypoint [_pos, (ceil random 40)];
		_wp1 setWaypointType "GUARD";
	};
};


