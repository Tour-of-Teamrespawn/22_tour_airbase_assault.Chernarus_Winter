if (!isDedicated) then
{
	_this spawn
	{
		private ["_unit", "_group", "_groupstring", "_mission"];
		_unit = _this select 0;
		_mission = _this select 1;
		enableRadio true;
		sleep 2;
		_group = group _unit;
		_groupstring = (str _group) call TOUR_SI_fnc_groupNameFix;
		_unit sideChat format ["Command this is %1, do you read? OVER", _groupstring];
		sleep 5;
		TOUR_HQ sideChat format ["Loud and clear %1, go ahead. OVER", _groupstring];
		sleep 5;
		_unit sideChat format ["Command, green light for papa tango, repeat green light for papa tango. OVER", _groupstring];
		sleep 5;
		TOUR_HQ sideChat format ["Roger %1, best of luck to you, papa tango is oscar mike, 2 minutes out. OVER", _groupstring];
		sleep 2;
		_unit sideChat format ["Copy, %1. OUT", _groupstring];
		sleep 2;
		enableRadio false;
	};
};

if (isServer) then 
{
	execVM "scripts\control\para1.sqf";
	execVM "scripts\control\para2.sqf";
};