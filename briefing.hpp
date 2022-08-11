player createDiarySubject ["About", "About"];

player createDiaryRecord 
["Diary", ["About", 
	"
		Tour of Teamrespawn
		<br />
		<br />
		Mission Design: Mr.Ben and YEAR 2022
		<br />
		<br />
		This is a remake of the original mission made for Arma 2.
		<br />
		<br />
		Thanks to all Tour members for testing and feedback.
		<br />
	"
]];

// give information about the actual mission itself, such as any unique mechanisms to the missions, and how to abort and complete the mission.
player createDiaryRecord 
["Diary", ["Mission", 
	"
		You can access the support menu using a PRC148, available to group leaders only.
		<br />
		<br />
		Walk out of the back of the C130 to begin your HALO jump. You will need to manually open the chute around 150m above ground level. Your watch will indicate height above sea level, so be sure to use the reading with care in relation to your landing zones elevation from the map data. Once you land, drop the parachute from your inventory and add the backpack using the ACE self interaction to switch your equipment backpack from your front to your back. You can then access its inventory... AND WALK NORMALLY!
		<br />
		<br />
		The mission can be ended at any point by returning and reporting in the the <marker name=""TOUR_mkr_objReturn"">officer</marker>, whether the objectives are completed or not. Use the extraction choppers via the support menu to return to base. If the helictopers are destroyed, you will fail the mission!
		<br />
		<br />
		The main objective is to secure the airstrip. The additional tasks will aid you massively in doing so.
	"
]];

// give any information about assets here, do you have vehicles, which ones are available, how many, support systems such as medical facilities, artillery etc.
player createDiaryRecord 
["Diary", ["Assets", 
	"
		<font size='20' align='center' color='#0080ff'>Artillery</font>
		<br />
		<br />
		 Smokes can be called via the support menu providing you have a PRC148 radio. You can also call ONE laser guided artillery, however you will need a FAC with a laser marker.
		 <br />
		<br />
		<font size='20' align='center' color='#0080ff'>Weapons</font>
		<br />
		<br />
		 You have only what you bring with you. Remember, when you land to drop your parachute and move your backpack from your front to your back.
	"
]];

// Add information for settings required for radio channels
player createDiaryRecord 
["Diary", ["Radio Channels", 
	"
		<font size='20' align='center' color='#0080ff'>Default Radio Channels</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Lead:</font> PRC152 - Channel 1
		<br />
		<br />	
		<font size='16' color='#ffa500'>Broadsword One:</font> PRC152 - Channel 2
		<br />
		<br />
		<font size='16' color='#ffa500'>Broadsword Two:</font> PRC152 - Channel 3
		<br />
		<br />
		<font size='16' color='#ffa500'>Broadsword Three:</font> PRC152 - Channel 4
		<br />
		<br />
		<font size='16' color='#ffa500'>Broadsword Four:</font> PRC152 - Channel 5
		<br />
		<br />
		<font size='16' color='#ffa500'>Shrew One:</font> PRC152 - Channel 6		
		<br />
		<br />
		<font size='16' color='#ffa500'>Shrew Two:</font> PRC152 - Channel 7		
		<br />
		<br />
		Long range intersquad communications PRC148 set to channel 1
	"
]];

// give all callsign details of groups, including AI support units if used
player createDiaryRecord 
["Diary", ["Callsigns", 
	"
		<font size='20' align='center' color='#0080ff'>Special Forces</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Lead:</font> Mission Lead
		<br />
		<br />	
		<font size='16' color='#ffa500'>Broadsword One:</font> Special Forces Team
		<br />
		<br />
		<font size='16' color='#ffa500'>Broadsword Two:</font> Special Forces Team
		<br />
		<br />	
		<font size='16' color='#ffa500'>Broadsword Three:</font> Special Forces Team
		<br />
		<br />	
		<font size='16' color='#ffa500'>Broadsword Four:</font> Special Forces Team
		<br />
		<br />	
		<font size='16' color='#ffa500'>Shrew One:</font> Recon and Sharpshooter Team
		<br />
		<br />
		<font size='16' color='#ffa500'>Shrew Two:</font> Recon and Sharpshooter Team
		<br />
		<br />		
		<font size='20' align='center' color='#0080ff'>Main Assault Force</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Papa Tango:</font> 6 Weapons Sections
		<br />
		<br />		
		<font size='20' align='center' color='#0080ff'>Support</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Thunder One:</font> Artillery
		<br />
		<br />	
		<font size='16' color='#ffa500'>Dusty One:</font> Merlin
		<br />
		<br />	
		<font size='16' color='#ffa500'>Dusty Two:</font> Merlin
	"
]];

// sumarries the mission details, for background info for immersion, any intel on enemy etc. Keep it to the point and spaced out, nobody likes a wall of text!!!
player createDiaryRecord 
["Diary", ["Briefing", 
	"
		<font size='20' align='center' color='#0080ff'>Overview</font>
		<br />
		<br />
		 Gentlemen, the war is intensifying dramatically. Our forces are stretched thin on the ground and in the air. Resources are scarce. With an increasing number of enemy forces in this region, Command has ordered the recapture of an Airstrip in an attempt to make a dent in the influx of enemy troops and supplies.
		 <br />
		 <br />
		 Your special forces team has been released to help tip the balance for paratroopers in retaking an <marker name=""TOUR_mkr_objAirstrip"">Olsha Airstrip</marker>.
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Intel</font>
		<br />
		<br />
		 Intel from our spies in the area has indicated supplies and equipment being brought in by other sympathetic nations to the enemies cause, and are bolstering their units. The <marker name=""TOUR_mkr_objAirstrip"">Airstrip</marker> will be well equiped and well armed with masses of infantry. Recent reconnaissance indicates armoured targets inside the base, and a ZU-23 anti-aircraft gun.
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Execution</font>
		<br />
		<br />
		You will enter the AO via HALO jump from a C130 south of <marker name=""TOUR_mkr_objAirstrip"">Olsha Airstrip</marker>, around 10,000m above <marker name=""TOUR_mkr_start"">Mt.Klen</marker>.
		<br />
		<br />
		 The overall objective is to capture the airbase. Your role will be to assist the paratroopers in taking the base. Your additional tasks are to destroy the <marker name=""TOUR_mkr_objComms"">comms tower</marker> to prevent any reinforcements being brought in, and most importantly, disable/prevent any anti-air from firing at the Chinooks as they drop off the main assault force at <marker name=""TOUR_mkr_para1_2"">alpha</marker> and <marker name=""TOUR_mkr_para2_2"">bravo</marker>. Make sure you are not detected to prevent the enemy from scrambling forces to early.
		<br />
		On completion or if aborting the mission, return to the <marker name=""TOUR_mkr_objReturn"">HMS Queen Elizabeth</marker> who is stationed to the east. You can use 2 Merlins that have been assigned to your team.
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Support</font>
		<br />
		<br />
		 We wish to capture and reuse the airstrip. Because of this, minimal heavy fire can be given. Smoke artillery and a precision laser guided artillery strike are available.
		<br />
	"
]];