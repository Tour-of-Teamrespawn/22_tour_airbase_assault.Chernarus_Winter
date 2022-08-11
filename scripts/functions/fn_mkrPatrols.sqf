private ["_radius", "_rnd", "_faction", "_marker", "_types_array", "_class_type", "_group_type", "_type", "_number", "_rndpos", "_safepos", "_grp", "_pat_distance", "_initdone", "_guardpos", "_side"];

_safepos = [0,0,0];
_min = _this select 0;
_max = _this select 1;
_markers = _this select 2;
_faction = _this select 3;
_side = _this select 4;
_group_type = _this select 5;	
_radius = _this select 6;		

if (_max > count _markers) exitWith {hint "There are not enough marker positions for the max value"};
if (_min > _max) exitWith {hint "The minimum value should be less than the maximum value"};

_rnd = _min + (ceil (random (_max - _min)));
TOUR_grpPatrols = [];

for "_i" from 1 to _rnd do
{
	_spawn = _markers call BIS_fnc_selectRandom;
	_markers = _markers - [_spawn];
	_type = _group_type call BIS_fnc_selectRandom;
	_grp = [getMarkerPos _spawn, EAST, (configFile >> "CfgGroups" >> (str _side) >> _faction >> (_type select 0) >> (_type select 1))] call BIS_fnc_spawnGroup;
	waitUntil {(count units _grp > 0)};
	TOUR_grpPatrols pushBackUnique _grp;
	{
		//sort out accuracy and skill and loadouts if needed
		_x call TOUR_fnc_skillAI;
	}forEach units _grp;
	[_grp, getMarkerPos _spawn, _radius]spawn TOUR_fnc_rndpatrol;
	sleep 0.1;
};