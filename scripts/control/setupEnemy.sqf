execVM "scripts\control\setupStatic.sqf";

_types = ["rhsgref_ins_machinegunner","rhsgref_ins_arifleman_rpk"];

{
	if (ceil random 2 > 1) then 
	{
		_pos = _x modelToWorld [-0.114258,-0.428223,-0.78421];
		_grp = createGroup EAST;
		_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"]; 
		_unit setVariable ["lambs_danger_disableAI", true];
		_unit setDir ((getDir _x) + 180);
		_unit setUnitPos "middle";
		_unit setPos _pos;
		_unit call TOUR_fnc_skillAI;
		_unit setSkill ["courage", 1];
		_unit allowFleeing 0;
	}else 
	{
		deleteVehicle _x;
	};
}forEach nearestObjects [getMarkerPos "TOUR_mkr_objAirstrip", ["UK3CB_Nest_Win"], 1000];

_types = [
	"rhsgref_ins_specialist_aa",
	"rhsgref_ins_grenadier_rpg",
	"rhsgref_ins_grenadier_rpg",
	"rhsgref_ins_arifleman_rpk",
	"rhsgref_ins_arifleman_rpk",
	"rhsgref_ins_arifleman_rpk",
	"rhsgref_ins_machinegunner",
	"rhsgref_ins_machinegunner",
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

{
	if (ceil random 2 > 1) then 
	{
		_pos = _x modelToWorld [-0.101074,-1.96484,0.49498];
		_gun = "rhsgref_ins_dshkm" createVehicle _pos;
		_gun setpos _pos;
		_gun setDir ((getDir _x) + 270);
		_grp = createGroup EAST;
		_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"]; 
		_unit call TOUR_fnc_skillAI;
		_unit assignAsGunner _gun;
		_unit moveInGunner _gun;
	}else 
	{
		if (ceil random 3 > 1) then 
		{
			_pos = _x modelToWorld [0.126465,0.588867,-2.20859];
			_grp = createGroup EAST;
			_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"]; 
			_unit setVariable ["lambs_danger_disableAI", true];
			_unit setPos _pos;
			_unit setDir (random 360);
			_unit call TOUR_fnc_skillAI;
		};
	};
	if (ceil random 3 > 1) then 
	{
		_pos = _x modelToWorld [-0.483398,-1.21484,-2.20859];
		_grp = createGroup EAST;
		_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"];
		_unit setVariable ["lambs_danger_disableAI", true];
		_unit setPos _pos;
		_unit setDir (random 360);
		_unit call TOUR_fnc_skillAI;
	};	
}forEach nearestObjects [getMarkerPos "TOUR_mkr_objAirstrip", ["land_bagBunker_tower_f"], 1000];

{ 
	if (ceil random 3 > 1) then 
	{
		_pos = (_x buildingPos (ceil random 5));
		_grp = createGroup EAST;
		_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"]; 
		_unit setVariable ["lambs_danger_disableAI", true];
		_unit setPos _pos;
		_unit setDir (_x getRelDir _unit);
		_unit call TOUR_fnc_skillAI;
	};
}forEach nearestObjects [getMarkerPos "TOUR_mkr_objAirstrip", ["Land_GuardTower_01_F"], 1000];

{ 
	if (ceil random 4 > 1) then 
	{
		_pos = (_x buildingPos 0);
		_grp = createGroup EAST;
		_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"]; 
		_unit setVariable ["lambs_danger_disableAI", true];
		_unit setPos _pos;
		_unit setDir (getDir _X + 180);
		_unit call TOUR_fnc_skillAI;
	};
}forEach nearestObjects [getMarkerPos "TOUR_mkr_objAirstrip", ["Land_GuardTower_02_F"], 1000];

{ 
	if (ceil random 3 > 1) then 
	{
		_pos = (_x buildingPos 0);
		_grp = createGroup EAST;
		_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"]; 
		_unit setVariable ["lambs_danger_disableAI", true];
		_unit setPos _pos;
		_unit setDir (random 360);
		_unit call TOUR_fnc_skillAI;
	};
}forEach nearestObjects [getMarkerPos "TOUR_mkr_objAirstrip", ["Land_Sawmill_01_illuminati_tower_F"], 1000];

_ep = 	[
			7,
			10,
			[
				"TOUR_mkr_patrol_1",
				"TOUR_mkr_patrol_2",
				"TOUR_mkr_patrol_3",
				"TOUR_mkr_patrol_4",
				"TOUR_mkr_patrol_5",
				"TOUR_mkr_patrol_6",
				"TOUR_mkr_patrol_7",
				"TOUR_mkr_patrol_8",
				"TOUR_mkr_patrol_9",
				"TOUR_mkr_patrol_11",
				"TOUR_mkr_patrol_12",
				"TOUR_mkr_patrol_13",
				"TOUR_mkr_patrol_14",
				"TOUR_mkr_patrol_15",
				"TOUR_mkr_patrol_16",
				"TOUR_mkr_patrol_17"
			],
			"rhsgref_faction_chdkz",
			EAST,
			[
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_infantry_aa"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_infantry_at"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_infantry_mg"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_infantry_patrol"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_insurgents_squad"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_insurgents_squad"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_insurgents_squad"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_insurgents_squad"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_infantry_mg"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_infantry_mg"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_infantry_at"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_infantry_at"],
				["rhsgref_group_chdkz_insurgents_infantry", "rhsgref_group_chdkz_insurgents_squad"]
			],
			120
		] call TOUR_fnc_mkrPatrols;

{
	_pos = _x select 0;
	_unit = createvehicle [(["rhsgref_ins_uaz_dshkm", "rhsgref_ins_uaz_ags", "rhsgref_ins_uaz_open"] call BIS_fnc_selectRandom), _pos, [], 180, "NONE"];
	_grp = createVehicleCrew _unit;
	_unit setPos _pos;
	waitUntil {count units _grp > 0};
	{
		_x call TOUR_fnc_skillAI;
	}forEach units _grp;
	{
		_wp1 = _grp addWaypoint [_x,0];
		_wp1 setWaypointType "MOVE";
		_wp1 setWaypointSpeed "LIMITED";		
	}forEach _x;
	_wp1 = _grp addWaypoint [_x select 0,0];
	_wp1 setWaypointType "CYCLE";

}forEach [
			[[12249.8,12748.5,0],[11791.1,12890.5,0],[11630.1,12621.8,0],[11845.9,12533.2,0],[12003.5,12675.6,0],[12061.2,12671.4,0],[12471.1,12527.3,0],[12587.6,12509.8,0]],
			[[12294.3,12709.5,0],[12732.6,12256.8,0],[11453.2,12233,0],[11778.9,12884,0]]
		];