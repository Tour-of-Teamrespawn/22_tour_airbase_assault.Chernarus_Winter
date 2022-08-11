missionNameSpace setVariable ["TOUR_detectedTelek", true, true];

[5, TOUR_UAZ_1, false] call TOUR_fnc_telekResponse;

[6, TOUR_UAZ_2, [true, false]call BIS_fnc_selectRandom] call TOUR_fnc_telekResponse;

if (random 2 > 1) then 
{
	[7, TOUR_UAZ_3, [true, false]call BIS_fnc_selectRandom] call TOUR_fnc_telekResponse;
};

if (random 2 > 1) then 
{
	[8, TOUR_UAZ_3, false] call TOUR_fnc_telekResponse;
};
