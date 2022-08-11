private ["_pos", "_grp", "_unit", "_number", "_type", "_types", "_building", "_repeat"];
if (count TOUR_barrackSpawnSpare == 0) exitWith {};

_repeat = _this select 0;
if (count _this > 1) then 
{
	_number = _this select 1;
}else 
{
	_number = TOUR_barrackSpawnSpare call BIS_fnc_selectRandom;
	TOUR_barrackSpawnSpare = TOUR_barrackSpawnSpare - [_number];
};

if (!_repeat) then 
{
	_pos = getMarkerPos format ["TOUR_mkr_guard_%1", _number];
}else 
{
	_pos = getMarkerPos format ["TOUR_mkr_guard_%1", _number + 10];
};

_grp = createGroup EAST;
_building = call compile format ["TOUR_barrackSpawn_%1", _number];

_types = if (random 3 < 2) then 
{
	[
		"rhs_vdv_rifleman",
		"rhs_vdv_rifleman",
		"rhs_vdv_rifleman",
		"rhs_vdv_arifleman_rpk",
		"rhs_vdv_arifleman_rpk",
		"rhs_vdv_arifleman",
		"rhs_vdv_AT",
		"rhs_vdv_medic",
		"rhs_vdv_marksman",
		"rhs_vdv_machinegunner",
		"rhs_vdv_grenadier",
		"rhs_vdv_LAT"
	];
}else 
{
	[
		"rhsgref_ins_specialist_aa",
		"rhsgref_ins_grenadier_rpg",
		"rhsgref_ins_grenadier_rpg",
		"rhsgref_ins_arifleman_rpk",
		"rhsgref_ins_arifleman_rpk",
		"rhsgref_ins_arifleman_rpk",
		"rhsgref_ins_militiaman_mosin",
		"rhsgref_ins_medic",
		"rhsgref_ins_rifleman",
		"rhsgref_ins_rifleman_akm",
		"rhsgref_ins_rifleman",
		"rhsgref_ins_rifleman_akm",
		"rhsgref_ins_rifleman_aks74",
		"rhsgref_ins_rifleman_aksu",
		"rhsgref_ins_grenadier",
		"rhsgref_ins_grenadier",
		"rhsgref_ins_rifleman_rpg26",
		"rhsgref_ins_rifleman_rpg26",
		"rhsgref_ins_saboteur",
		"rhsgref_ins_engineer",
		"rhsgref_ins_sniper",
		"rhsgref_ins_spotter",
		"rhsgref_ins_squadleader"
	];
};



for "_i" from 1 to 5 do 
{
	call compile format ["_unit = _grp createUnit [""%2"", (%1 buildingPos %3), [], 0, ""NONE""]; _unit setPos (%1 buildingPos %3); ", _building, _types call BIS_fnc_selectRandom, _i];
	sleep 0.5;
	call compile format ["_unit setPosATL (%1 buildingPos %2); ", _building, _i];
	_unit call TOUR_fnc_skillAI;
	_unit setSkill ["courage", 1];
	_unit allowFleeing 0;
};

_wp = _grp addWaypoint [_pos, ceil random 40];
_wp setWaypointType "MOVE";

_wp1 = _grp addWaypoint [_pos, ceil random 40];
_wp1 setWaypointType "GUARD";

if (_repeat) then 
{
	waitUntil {{(_x distance _building < 30)}count units _grp == 0};
	[false, _number] spawn TOUR_fnc_guards;
};




