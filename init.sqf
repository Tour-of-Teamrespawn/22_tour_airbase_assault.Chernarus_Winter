_d = execVM "scripts\general\debugRPT.sqf";
waitUntil {scriptDone _d};

_p = execVM "params.sqf";
waitUntil {scriptDone _p};

_a = TOUR_logic execVM "a2s_multitask.sqf";
waitUntil {scriptDone _a};

enableRadio false;
{
	_x setVariable ["BIS_noCoreConversations",true];
} forEach allUnits;

TOUR_HQ = [WEST, "HQ"];

_f = execVM "scripts\functions\fn_init.sqf";
waitUntil {scriptDone _f};

TOUR_C130 enableDynamicSimulation false;

if (isServer) then 
{
//	TOUR_C130 setPosASL [11500, 11300, 10000];
//	TOUR_C130 setVectorUp [0,0,1];
	TOUR_lamp_1 setpos (TOUR_C130 modelToWorld [-0.0205078,-6.7,-1.1]); TOUR_lamp_1 setVectorUp  [0,0,-1];
	TOUR_lamp_2 setpos (TOUR_C130 modelToWorld [-0.00585938,2.38184,-1.1]); TOUR_lamp_2 setVectorUp  [0,0,-1.1];
};

[true, 6000, 15, true, 10, false, true, true, false, true] execvm "AL_snowstorm\al_snow.sqf";

execVM "scripts\general\intro.sqf";

_siAction = if (true) then
{
	"(alive player) && ([player, ""ACRE_PRC148""] call acre_api_fnc_hasKindOfRadio)"
}else
{
	"(alive player) && (""ItemRadio"" in (assignedItems player))"
};

_si = 
[
	TOUR_logic,
	WEST,
	_siAction,
	"(alive player) && (player == leader group player) && (player distance TOUR_Officer < 2.5) && (isNil ""TOUR_mission_ending"")",
	true,
	[
		[
			"artillery",
			"Thunder One",
			[
				["6rnd_155mm_mo_smoke", 50],
				["2rnd_155mm_mo_lg", 1]
			]
		],
		[
			"helicopter",
			TOUR_chopper_1,
			"Dusty One",
			[
				"Circle",
				"Land",
				"Land (Engine Off)",
				"Move To",
				"Pickup",
				"Return To Base",
				"toggle engine"
			],
			getPosATL TOUR_chopper_1
		],
		[
			"helicopter",
			TOUR_chopper_2,
			"Dusty Two",
			[
				"Circle",
				"Land",
				"Land (Engine Off)",
				"Move To",
				"Pickup",
				"Return To Base",
				"toggle engine"
			],
			getPosATL TOUR_chopper_2
		]
	],
	"TOUR_fnc_callPara",
	{true}
] execVM "scripts\TOUR_SI\TOUR_SI_init.sqf";

TOUR_init_complete = true;