/// @description Insert description here
// You can write your code in this editor

if !(battle_menu=0&&stage_effect=0)
{	
	image_speed = 0;
	exit;
}

event_inherited();
	
if hit_alarm != 0 hit_alarm-=1;
if hit_alarm = 0 hit=0;
	
if state = ""
{
	sprite_index=spr_cannon;
	reticle_x = grid_x;
		
	if reticle_wait>=1 reticle_wait -= 1;
		
	if obj_mega_man.grid_y=grid_y&&reticle_wait < 1
	{
		state="seek";
		reticle_timer=60/ai_level;
	}
}
if state = "seek"
{	
	if reticle_x=obj_mega_man.grid_x&&grid_y=obj_mega_man.grid_y 
	{
		enemy_sighted=1;
		reticle_fire=20
		state="attack";
	}
	//reticle_x = grid_x;
	reticle_timer-=1;
	if reticle_timer<0
	{
		if reticle_x>1
		{
			reticle_x-=1;
			reticle_timer=20/ai_level;
		}
		else 
		{
			reticle_x = grid_x;
			reticle_wait = 20/ai_level;
			state = "";
			enemy_sighted=0;
		}
	}
}
if state = "attack"
{
	image_speed = 1;
	sprite_index=spr_cannon_fire;
	if reticle_fire>=1 reticle_fire-=1
	else if reticle_fire<1
	{
		if grid_y=obj_mega_man.grid_y&&hit=0
		{
				hit=1;
				with obj_mega_man
				{
					if damage_invinsibility=0
					{
						hp-=other.dmg;
						event_user(0);
					}
				}
		}
	}	
}	



