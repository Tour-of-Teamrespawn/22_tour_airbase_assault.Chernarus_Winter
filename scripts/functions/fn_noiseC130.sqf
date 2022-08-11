while {!isNull (_this select 0)} do
{
    if ((player distance TOUR_C130 < 1500)) then 
    {
        (_this select 0) say3d ["TOUR_snd_c130noisemate", 150, 1];
        sleep 5.8;
    };
};
