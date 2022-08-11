private ["_zupos", "_obj", "_angle", "_grp", "_unit"];

_zupos = call compile format ["TOUR_ZUpos_%1", (ceil random 11)]; 
_obj = nearestobjects [TOUR_zu23, [], 20];

for "_i" from 0 to ((count _obj) - 1) do
{
	if ((_obj select _i) != TOUR_zu23) then 
	{
		_angle = getDir (_obj select _i);
		_offset = TOUR_zu23 worldToModel (getpos (_obj select _i));
		_pos = _zupos modelToWorld _offset;
		(_obj select _i) setPosATL [_pos select 0, _pos select 1, 0];
		(_obj select _i) setDir _angle;
	};
};

TOUR_zu23 setPosAtl [getPosAtl _zupos select 0, getPosAtl _zupos select 1, 0];

_grp = createGroup EAST;
_grp deleteGroupWhenEmpty false;
_count = 0;

while {(_count < 5)&&(damage TOUR_ZU23 < 0.8)&&({_x distance (getMarkerPos "TOUR_mkr_ZU23ManSpawn") < 50}count (playableUnits + switchableUnits) == 0)} do 
{
	_unit = _grp createUnit ["rhsgref_ins_rifleman_akm", (TOUR_barracksSpawn buildingPos 0), [], 0, "NONE"];
	_count = _count + 1;
	sleep 2;
	_unit setVariable ["lambs_danger_disableAI", true];
	_unit assignAsGunner TOUR_ZU23;
	(units _grp) allowGetIn true;
	(units _grp) orderGetIn true;
	_unit call TOUR_fnc_skillAI;
	_unit setSkill ["courage", 1];
	_unit allowFleeing 0;
	_unit additem "NVGoggles_OPFOR";
	_unit assignItem "NVGoggles_OPFOR";
	waitUntil {{alive _x} count units _grp == 0};
	TOUR_objZU23_start = true;
};


