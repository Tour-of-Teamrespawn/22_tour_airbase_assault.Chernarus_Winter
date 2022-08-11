private ["_pos", "_grp", "_unit", "_number", "_type", "_types", "_building", "_car", "_onFoot"];
_number = _this select 0;
_car = _this select 1;
_onFoot = _this select 2;

_pos = getMarkerPos "TOUR_mkr_objComms";
_grp = createGroup EAST;
_building = call compile format ["TOUR_barrackSpawn_%1", _number];

_types = [
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

for "_i" from 1 to 3 do 
{
	call compile format ["_unit = _grp createUnit [""%2"", (%1 buildingPos %3), [], 0, ""NONE""]; _unit setPos (%1 buildingPos %3); ", _building, _types call BIS_fnc_selectRandom, _i];
	sleep 0.5;
	call compile format ["_unit setPos (%1 buildingPos %2); ", _building, _i];
	_unit call TOUR_fnc_skillAI;
	_unit setSkill ["courage", 1];
	_unit allowFleeing 0;
	_unit additem "NVGoggles_OPFOR";
	_unit assignItem "NVGoggles_OPFOR";
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

_wp = _grp addWaypoint [_pos, ceil random 40];
_wp setWaypointType "MOVE";

_wp1 = _grp addWaypoint [_pos, ceil random 40];
_wp1 setWaypointType "GUARD";

if !(_onFoot) then 
{
	units _grp orderGetIn true;
};



