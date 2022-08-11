private ["_pos1","_pos2","_pos3","_pos4", "_grp", "_unit", "_number", "_types", "_types", "_building", "_car", "_onFoot"];
_number = _this select 0;

_pos1 = getMarkerPos (format ["TOUR_mkr_uralReinf_%1", _number]);
_pos2 = getMarkerPos (format ["TOUR_mkr_uralReinf_%1_1", _number]);
_pos3 = getMarkerPos (format ["TOUR_mkr_uralReinf_%1_2", _number]);
_pos4 = getMarkerPos (format ["TOUR_mkr_uralReinf_%1_3", _number]);

_types = [
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

_unit = createvehicle ["rhs_ural_vdv_01", _pos1, [], markerDir (format ["TOUR_mkr_uralReinf_%1", _number]) , "NONE"];
_grp = createVehicleCrew _unit;
_unit setPos _pos1;
sleep 1;

{
	_unit call TOUR_fnc_skillAI;
	_unit setSkill ["courage", 1];
	_unit allowFleeing 0;
}forEach units _grp;

_wp = _grp addWaypoint [_pos2, 0];
_wp setWaypointType "MOVE";

_wp = _grp addWaypoint [_pos3, 0];
_wp setWaypointType "MOVE";

_wp = _grp addWaypoint [_pos4, 0];
_wp setWaypointType "GUARD";

waitUntil {(isNull _grp) or ({alive _x} count units _grp == 0) or ( _unit distance _pos4 < 20)};

if (!(isNull _grp) && !({alive _x} count units _grp == 0)) then 
{
	{
		unassignVehicle _x;
	}forEach units _grp; 
};

