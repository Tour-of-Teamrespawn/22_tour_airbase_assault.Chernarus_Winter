
if (isServer) then 
{
	[] spawn 
	{
		sleep 3;
		{ 
			if (side _x == WEST) then 
			{
				_position = _x call TOUR_fnc_startPos;
				sleep 1;
				_x  setpos (TOUR_C130 modeltoworld _position);
				[[_x], {sleep 1; (_this select 0) switchMove "stand"; sleep 1; doStop (_this select 0);}] remoteExec ["BIS_fnc_Spawn", 0, false];
			};
		}forEach (playableUnits + switchableUnits);
	}; 
	
	if (isDedicated) then 
	{
		TOUR_snowAllow = true;
	};
};

if (!isDedicated) then 
{
	if (side player != WEST) exitWith {};
	player allowDamage false;
	cutText ["","BLACK FADED", 0];
	0 fadeSound 0;
	waituntil {player == player};

	if (time > 5) then 
	{
		_position = player call TOUR_fnc_startPos;
		player setpos (TOUR_C130 modeltoworld _position);
		player setDir ((getDir TOUR_C130) - 180);
		[[player], {sleep 1; (_this select 0) switchMove "stand"; sleep 1; doStop (_this select 0);}] remoteExec ["BIS_fnc_Spawn", 0, false];
	};

	private ["_cam1"];
	if (TOUR_introEnable) then 
	{
		cutText ["Loading Intro","BLACK FADED", 0];
		sleep 5;
		_cam1 = "camera" camCreate getPosATL TOUR_C130Intro;
		T_cam1 = _cam1;
		_cam1 camSetTarget TOUR_C130Intro;
		_cam1 camCommit 0;
		_newPos = [-40,40,-15];
		T_cam1 camSetTarget TOUR_C130Intro;
		T_cam1 camCommit 0;
		T_cam1 camsetrelpos [-40,40,-15];
		T_cam1 camCommit 0;
		_cam1 cameraEffect ["internal", "back"];

		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [5];
		"dynamicBlur" ppEffectCommit 0;
		[TOUR_C130Intro] spawn TOUR_fnc_noiseC130;
		[TOUR_C130] spawn TOUR_fnc_noiseC130;
		[TOUR_C130Intro] spawn TOUR_fnc_moveC130;
		sleep 3;
		T_cam1 camSetTarget TOUR_C130Intro;
		T_cam1 camCommit 0;
		T_cam1 camsetrelpos [-40,40,-15];
		T_cam1 camCommit 0;
		cutText [" ","BLACK IN", 5];
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 8;
		5 fadeSound 1;
		playsound "WEDintro";	
		[]spawn 
		{
			sleep 8;
			_text = ["C","h","e","r","n","a","r","u","s","\n","S","o","u","t","h"," ","O","f"," ","O","l","s","h","a"," ","A","i","r","s","t","r","i","p","\n","0","0","0","0"," ","H","o","u","r","s"];
			_display = "";
			_pointer = 0;
			_sleepTime = 0.1;

			while {_pointer < count _text} do
			{
				_display = _display + (_text select _pointer);
				titleText [_display,"PLAIN down",_sleepTime];
				_pointer = _pointer + 1;
				if (_pointer == count _text) then
				{
					cutText [_display,"PLAIN down",1];
				}
				else
				{
					playSound "TOUR_key_noise";
				};
				sleep _sleepTime;
			};		
			
			sleep 12.5;
				cutText ["","WHITE IN", 3];
				[format ["<t color='#4985a3' size = '2'>Altitude: 10000m</t>", "asdf"],-1,0.5,2,0,0,789] spawn BIS_fnc_dynamicText;
			sleep 7.2;			
				cutText ["","WHITE IN", 3];
				[format ["<t color='#4985a3' size = '2'>Welcome to...</t>", "asdf"],-1,0.5,2,0,0,789] spawn BIS_fnc_dynamicText;
			sleep 4.2;
				cutText ["","WHITE IN", 3];
				[format ["<t color='#4985a3' size = '2'>The Tour of Teamrespawn's...</t>", "asdf"],-1,0.5,2,0,0,789] spawn BIS_fnc_dynamicText;
		};
			
		sleep 5;

		sleep 5;

		sleep 5;

		sleep 5;

		// spin to front of plane
		_newPos = TOUR_C130Intro modelToWorld [0,-30,-6];
		_cam1 camsetTarget TOUR_C130Intro;
		_cam1 camCommit 0;
		_cam1 camsetrelpos [0,-30,-7];
		_cam1 camCommit 10;
		_cam1 camCommitprepared 10;

		sleep 12.5;

		//move forward under plane
		_newPos = TOUR_C130Intro modelToWorld [0,20,-6];
		_cam1 camSetPos _newPos;
		_cam1 camCommit 10;
		_cam1 camPrepareTarget _newPos;
		_cam1 camCommitprepared 7;
		
		sleep 8;

		"dynamicBlur" ppEffectAdjust [5];
		"dynamicBlur" ppEffectCommit 2.5;
		cutText ["","BLACK OUT", 2];	

		sleep 2.5;
		_newPos = TOUR_C130 modelToWorld [0,20,-6];
		_cam1 camSetPos _newPos;
		_cam1 camCommit 0;

		//face rear of plane
		_newPos = TOUR_C130 modelToWorld [0,0,-3];
		_cam1 camSetPos _newPos;
		_cam1 camCommit 15;
		_cam1 camprepareTarget _newPos;
		_cam1 camCommitprepared 0;

		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 2.5;
		cutText ["","BLACK IN", 2];

		sleep 4.5;
		[format ["<t color='#4985a3' size = '2'>AIRBASE ASSAULT</t>", "asdf"],-1,0.5,7.5,2,0,789] spawn BIS_fnc_dynamicText;
		sleep 2;
		TOUR_C130 animate ["ramp_bottom",1];
		TOUR_C130 animate ["ramp_top",1];
		execVM "scripts\general\lighting.sqf";
		sleep 5.5;
		"dynamicBlur" ppEffectAdjust [5];
		"dynamicBlur" ppEffectCommit 2.5;
		cutText ["","BLACK OUT", 2];
		
		sleep 3;
		cutText ["","BLACK FADED", 0];	
		_cam1 cameraEffect ["TERMINATE", "back"];		
	
	}else 
	{
		cutText ["Skipping Intro","BLACK FADED", 0];
		[TOUR_C130] spawn TOUR_fnc_noiseC130;
		//[TOUR_C130] spawn TOUR_fnc_moveC130;
	};

	_date = date;
	_year = _date select 0;
	_month = _date select 1;
	_day = _date select 2;
	_hour = _date select 3;
	_min = _date select 4;
	_text_date = [];
	
	if (_min < 10) then 
	{ 
		_text_date = format ["%1-%2-%3  %4h0%5m", _month, _day, _year, _hour, _min]; 
	} 
	else 
	{  
		if (_min == 60) then
		{
			_hour = _hour + 1;
			_min = 0;
			_text_date = format ["%1-%2-%3  %4h0%5m", _month, _day, _year, _hour, _min];
		}
		else
		{
			_text_date = format ["%1-%2-%3  %4h%5m", _month, _day, _year, _hour, _min]; 
		};
	};
	if !(TOUR_introEnable) then 
	{

		execVM "scripts\general\lighting.sqf";
	};
	_text_1 = "10000m Above Mt.Klen";
	_text_2 = "HALO Insertion";
	sleep 2;
	cutText ["", "BLACK FADED", 0];
	[_text_1, _text_date, _text_2] spawn TOUR_fnc_infoText;
	{_x enableSimulation true;}forEach (playableUnits + switchableUnits);
	sleep 5;
	TOUR_introcomplete = true;
	cutText ["", "BLACK IN", 5];
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 3;
	sleep 2;
	if (TOUR_introEnable) then 
	{
		camdestroy _cam1;
	}else 
	{
		TOUR_C130Intro animate ["ramp_bottom",1];
		TOUR_C130Intro animate ["ramp_top",1];
		execVM "scripts\general\lighting.sqf";
	};

	waitUntil {(((player worldtomodel getposATL TOUR_c130) select 2) > 0.3)};
	player setDir 180;
	sleep 0.2;
	if (((player worldtomodel getposATL TOUR_c130) select 2) > 0.5) then 
	{
			hint "ran";
		player setvelocity [0,270*1.0,0]; // was 270*0.8 
	};

	waitUntil {((getPosATL player) select 2) < 1000 && ((getPosATL player) select 1) > 11305.9};

	private _text = "<t font='PuristaBold' size='1.6'>22 [Tour] Airbase Assault</t><br />by Mr.Ben";
	[parseText _text, true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;

	waitUntil {((getPosASL player) select 2) < 500 or (vehicle player != player)};
	TOUR_snowAllow = true;

	if (TOUR_autoChute) then 
	{
		waitUntil {((getposATL player) select 2) < 150};
		if (((getposATL player) select 2) > 10) then 
		{
			player action ["OpenParachute", player];
		};
	};
	
};