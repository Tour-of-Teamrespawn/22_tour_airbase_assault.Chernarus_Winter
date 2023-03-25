sleep (300 + (ceil (random 300)));

if (("TOUR_objComms" call BIS_fnc_taskState) != "SUCCEEDED") then 
{
	TOUR_uralSpare = [1,2,3];
	for "_i" from 1 to (1 + (ceil (random 2))) do 
	{
		_n = TOUR_uralSpare call BIS_fnc_selectRandom;
		TOUR_uralSpare = TOUR_uralSpare - [_n];
		[_n] spawn TOUR_fnc_uralResponse;
	};
};