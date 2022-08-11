waitUntil {!isNil "TOUR_init_complete"};

TOUR_barrackSpawnSpare = [];
for "_i" from 1 to 12 do 
{
	TOUR_barrackSpawnSpare pushBack _i;
};

TOUR_barrackSpawnSpare2 = [];
for "_i" from 13 to 17 do 
{
	TOUR_barrackSpawnSpare2 pushBack _i;
};

execVM "scripts\control\setupObjectives.sqf";

execVM "scripts\control\setupEnemy.sqf";

TOUR_initServer_complete = true;