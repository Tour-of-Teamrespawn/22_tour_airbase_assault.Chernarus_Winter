waitUntil {!isNil "TOUR_init_complete"};
waitUntil {player == player};

#include "briefing.hpp"

TOUR_officer addAction ["Report In", "scripts\control\endingAction.sqf", 0, 10, true, false, "", "(isNil {missionNameSpace getVariable 'TOUR_reportIn'}) && (player==leader group player) && (player distance _target < 2)"];

player call TOUR_fnc_playerLoadouts;
[player] call zade_boc_fnc_actionOnChest;
player addBackpack "B_Parachute";
execVM "scripts\general\radioChannelSetup.sqf";

sleep 0.1;
_goggles = goggles player;
removeGoggles player;

waitUntil {!isNil "TOUR_introcomplete"};
player allowDamage true;
player addGoggles _goggles;