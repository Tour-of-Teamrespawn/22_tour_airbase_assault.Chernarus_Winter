private ["_n", "_n2"];
_n = 0;
_n2 = 0;
while {isNil "TOUR_introcomplete"} do 
{
    sleep 0.01;
    (_this select 0) setVectorUp [(sin _n)/36,(sin _n)/36,1];
    _n = _n + random 1;
    (_this select 0) setVectorUp [(sin _n2)/36,(sin _n2)/36,1];
    _n2 = _n2 + random 1;
};