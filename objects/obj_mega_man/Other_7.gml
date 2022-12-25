/// @description Insert description here
// You can write your code in this editor



if state="move"		
{
	if buffered_state="" state=""; 
	else 
	{
		state=buffered_state; 
		buffered_state="";
		image_index=0;
	}
}
else if state="shoot"		{state ="";attack_connected=0;}
else if state="chargea"	{state ="";attack_connected=0;}
else if state="chargeb"	{state ="";attack_connected=0;}
else if state="hurt"		{state ="";attack_connected=0;}
else if state="cannon0"	
{
	if		selected_chips[# 0, 0]=1 state="cannon1";
	else if selected_chips[# 0, 0]=2 state="cannon2";
	else if selected_chips[# 0, 0]=3 state="cannon3";
}
else   if state="cannon1"		||state="cannon2"		||state="cannon3"	
		||state="airshot1"		||state="airshot2"		||state="airshot3"	
		||state="volcano1"		||state="volcano2"		||state="volcano3"		||state="volcano4"	
		||state="shotgun"		||state="vgun"			||state="sidegun"		||state="spreader"
		||state="bubbler"		||state="bubblev"		||state="bubbleside"
		||state="heatshot"		||state="heatv"			||state="heatside"
		||state="grenade1"		||state="grenade2"		||state="grenade3"		||state="grenade4"	
		||state="cannonball1"	||state="cannonball2"	||state="cannonball3"
		||state="bomb1"			||state="bomb2"			||state="bomb3"
		||state="sword"			||state="widesword"		||state="longsword"	
		
		||state="recover10"		||state="recover30"		||state="recover50"	
		||state="panelout1"		||state="panelout3"
		{state="";selected_chips[# 0,0]=0;ds_grid_translate(selected_chips,0,-1);attack_connected=0; buffered_state="";}