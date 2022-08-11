private ["_staticPos", "_obj", "_angle", "_grp", "_unit", "_pos", "_staticArray"];

_staticArray = [];
for "_r" from 1 to 22 do 
{
	_staticPos = call compile format ["TOUR_staticPos_%1", _r]; 
	_staticArray pushBackUnique _staticPos;
};

{
	_obj = nearestobjects [_x, [], 20];
	_staticPos = _staticArray call BIS_fnc_selectRandom;
	_staticArray = _staticArray - [_staticPos];
	
	for "_i" from 0 to ((count _obj) - 1) do
	{
		if ((_obj select _i) != _x) then 
		{
			_angle = getDir (_obj select _i);
			_offset = _x worldToModel (getpos (_obj select _i));
			_pos = _staticPos modelToWorld _offset;
			(_obj select _i) setPos [_pos select 0, _pos select 1, 0];
			(_obj select _i) setDir _angle;
		};
	};
	_x setPosATl [getPosAtl _staticPos select 0, getPosAtl _staticPos select 1, 0];

	_grp = createVehicleCrew _x;
	sleep 0.1;
	{
		_x call TOUR_fnc_skillAI;
		_x setSkill ["courage", 1];
		_x allowFleeing 0;
	}forEach units _grp;

	deleteVehicle _staticPos;
}forEach [TOUR_static_1, TOUR_static_2, TOUR_static_3, TOUR_static_4];

{deleteVehicle _x}forEach _staticArray;

