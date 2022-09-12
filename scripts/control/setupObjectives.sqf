[WEST, "TOUR_objAirstrip", ["Assist the British paratroopers in securing <marker name=""TOUR_mkr_objAirstrip"">Olsha Airstrip</marker>, by eliminating enemy forces and armored targets, in the immediate area.", "Capture Airstrip", "TOUR_mkr_objAirstrip"],  objNull, "ASSIGNED", -1, false, "attack"] call BIS_fnc_taskCreate;
[WEST, "TOUR_objComms", ["Destroy the <marker name=""TOUR_mkr_objComms"">Communication Tower</marker> to prevent distress calls.", "Disrupt Communications", "TOUR_mkr_objComms"],  objNull, "CREATED", -1, false, "destroy"] call BIS_fnc_taskCreate;
[WEST, "TOUR_objZU23", ["Search for and disable the ZU-23 to help the airborne troops to begin the assault.", "Disable ZU-23", "TOUR_mkr_objAirstrip"],  objNull, "CREATED", -1, false, "scout"] call BIS_fnc_taskCreate;
[WEST, "TOUR_objReturn", ["Leave the area in a helicopter to move back to <marker name=""TOUR_mkr_objReturn"">HMS Queen Elizabeth</marker>. Make sure you have smokes, and are away from the enemy. The evac choppers will fly in from the east.", "Return To Ship", "TOUR_mkr_objReturn"],  objNull, "CREATED", -1, false, "boat"] call BIS_fnc_taskCreate;

TOUR_trg_detect = createTrigger["EmptyDetector", getMarkerPos "TOUR_mkr_objAirstrip"]; 
TOUR_trg_detect setTriggerArea[500,350,198,true];
TOUR_trg_detect setTriggerActivation["WEST","EAST D",false];
TOUR_trg_detect setTriggerTimeout [5, 7.5, 10, true];
TOUR_trg_detect setTriggerStatements["this or ({damage _x > 0.1}count [TOUR_armour_1, TOUR_armour_2, TOUR_armour_3, TOUR_armour_4, TOUR_ZU23] > 0) or (!isNil {missionNameSpace getVariable ""TOUR_assaultWaveArrived""})", "null = [] execVM ""scripts\control\reinforceArea.sqf""; null = [] execVM ""scripts\control\reinforceUral.sqf""; ", ""];

TOUR_trg_capture = createTrigger["EmptyDetector", getMarkerPos "TOUR_mkr_objAirstrip"]; 
TOUR_trg_capture setTriggerArea[450,150,198,true];
TOUR_trg_capture setTriggerActivation["WEST","PRESENT",false];
TOUR_trg_capture setTriggerStatements["this && (({(side _x == EAST)&&(alive _x)&&(_x in thislist)} count allunits) < 3) && ({canMove _x or ({alive _x}count crew _x > 0)}count [TOUR_armour_1, TOUR_armour_2, TOUR_armour_3, TOUR_armour_4] == 0)", "missionNameSpace setVariable [""TOUR_captured"", true, true];", ""];

TOUR_grp_telek = createGroup EAST;
TOUR_grp_telek = [getMarkerPos "TOUR_mkr_objComms", EAST, (configFile >> "CfgGroups" >> "East">> "rhsgref_faction_chdkz" >> "rhsgref_group_chdkz_insurgents_infantry" >> (["rhsgref_group_chdkz_infantry_mg", "rhsgref_group_chdkz_infantry_at", "rhsgref_group_chdkz_infantry_patrol"]call BIS_fnc_selectRandom))] call BIS_fnc_spawnGroup;
waitUntil {(count units TOUR_grp_telek > 0)};
{
	_x call TOUR_fnc_skillAI;
}forEach units TOUR_grp_telek;

_wp = TOUR_grp_telek addWaypoint [getMarkerPos "TOUR_mkr_objComms", 15];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";	
_wp setWaypointBehaviour "SAFE";
_wp setWaypointCombatMode "YELLOW";	
_wp setWaypointFormation "COLUMN";

_wp2 = TOUR_grp_telek addWaypoint [[12756, 12703], 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointCompletionRadius (ceil random 50);

_wp3 = TOUR_grp_telek addWaypoint [getMarkerPos "TOUR_mkr_objComms", 15];
_wp3 setWaypointType "MOVE";

_wp4 = TOUR_grp_telek addWaypoint [(getMarkerPos "TOUR_mkr_objComms") getPos [(random (30 + 20)), ceil random 360], 0];
_wp4 setWaypointType "MOVE";
_wp4 setWaypointType "CYCLE";

TOUR_telek = nearestObject [(getMarkerPos "TOUR_mkr_objComms"), "Land_Telek1"];

TOUR_trg_detect2 = createTrigger["EmptyDetector", getpos TOUR_telek]; 
TOUR_trg_detect2 setTriggerArea[200,200,0,false];
TOUR_trg_detect2 setTriggerActivation["WEST","EAST D",false];
TOUR_trg_detect2 setTriggerTimeout [5, 10, 15, true];
TOUR_trg_detect2 setTriggerStatements["this", "if ({alive _x} count units TOUR_grp_telek > 0) then {null = true execVM ""scripts\control\reinforceTelek.sqf""};", ""];

TOUR_objZU23_start = false;
execVM "scripts\control\getInZU23.sqf";

waitUntil {count (playableUnits + switchableUnits) > 0};
sleep 1;

while {!TOUR_RC_WEST_DEAD} do
{
	if (("TOUR_objComms" call BIS_fnc_taskState) != "SUCCEEDED") then 
	{
		if ((isNil {missionNameSpace getVariable "TOUR_detectedTelek"})&&(isNil {missionNameSpace getVariable "TOUR_detectedArea"})) then 
		{
			if (damage TOUR_telek > 0.8) then 
			{
				sleep 2;
				["TOUR_objComms", "SUCCEEDED", true] call BIS_fnc_tasksetState;
				[] execVM "scripts\control\reinforceTelek.sqf";
				[] execVM "scripts\control\reinforceUral.sqf";
			};
		}else 
		{
			if (("TOUR_objComms" call BIS_fnc_taskState) != "FAILED") then 
			{
				sleep 3;
				["TOUR_objComms", "FAILED", true] call BIS_fnc_tasksetState;	
			};
		};
	};

	if (("TOUR_objZU23" call BIS_fnc_taskState) != "SUCCEEDED") then 
	{
		if (TOUR_objZU23_start) then 
		{
			if (damage TOUR_ZU23 > 0.7) then 
			{
				["TOUR_objZU23", "SUCCEEDED", true] call BIS_fnc_tasksetState;
			}else 
			{
				if (!alive gunner TOUR_ZU23) then 
				{
					if (("TOUR_objZU23" call BIS_fnc_taskState) != "SUCCEEDED") then 
					{
						["TOUR_objZU23", "SUCCEEDED", true] call BIS_fnc_tasksetState;
					};	
				}else 
				{
					if (("TOUR_objZU23" call BIS_fnc_taskState) != "ASSIGNED") then 
					{
						["TOUR_objZU23", "ASSIGNED", true] call BIS_fnc_tasksetState;
					};		
				};
			};
		};
	};	

	if ((!isNil {missionNameSpace getVariable "TOUR_captured"}) && (("TOUR_objAirstrip" call BIS_fnc_taskState) != "SUCCEEDED")) then 
	{
		["TOUR_objAirstrip", "SUCCEEDED", true] call BIS_fnc_tasksetState;
	};	

	if (!TOUR_RC_WEST_DEAD &&({alive _x && ((vehicle _x) distance TOUR_carrier > 100)}count (playableUnits + switchableUnits) == 0)&&(("TOUR_objReturn" call BIS_fnc_taskState) != "SUCCEEDED")) then 
	{
		["TOUR_objReturn", "SUCCEEDED", true] call BIS_fnc_tasksetState;
	};	

	if ({canMove _x}count [TOUR_chopper_1, TOUR_chopper_2] == 0) exitWith
	{
		["TOUR_objReturn", "FAILED", true] call BIS_fnc_taskSetState;
		sleep 2;	
	};

	if (!isNil {missionNameSpace getVariable "TOUR_reportIn"}) exitWith
	{

	};
	sleep 2;

};

if ("TOUR_objAirstrip" call BIS_fnc_taskState != "SUCCEEDED") then
{
	["TOUR_objAirstrip", "FAILED", false] call BIS_fnc_taskSetState;
};
if ("TOUR_objReturn" call BIS_fnc_taskState != "SUCCEEDED") then
{
	["TOUR_objReturn", "FAILED", false] call BIS_fnc_taskSetState;
};
if ("TOUR_objZU23" call BIS_fnc_taskState != "SUCCEEDED") then
{
	["TOUR_objZU23", "FAILED", false] call BIS_fnc_taskSetState;
};
if ("TOUR_objComms" call BIS_fnc_taskState != "SUCCEEDED") then
{
	["TOUR_objComms", "FAILED", false] call BIS_fnc_taskSetState;
};
sleep 5;

if (TOUR_RC_WEST_DEAD) then 
{
	["kia", false, true, false] remoteExecCall ["BIS_fnc_endMission"];
}else 
{
	if (!isNil {missionNameSpace getVariable "TOUR_reportIn"}) then 
	{
		sleep 20;
		if ("TOUR_objAirstrip" call BIS_fnc_taskState == "SUCCEEDED") then 
		{
			["complete", true, true, false] remoteExecCall ["BIS_fnc_endMission"];
		}else
		{
			["aborted", false, true, false] remoteExecCall ["BIS_fnc_endMission"];
		};
	}else 
	{
		["chopper", false, true, false] remoteExecCall ["BIS_fnc_endMission"];
	};
};
