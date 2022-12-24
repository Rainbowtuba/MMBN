/// @description Insert description here
// You can write your code in this editor
if battle_menu=1||battle_intro=1 exit;

if battle_menu=0&&stage_effect=0
{
	// Inherit the parent event
	event_inherited();
	
	if state=""
	{
		if state_alarm>0		state_alarm-=1;
		else if state_alarm=0	
		{
			// Find out which direction we should go, up or down
			var dir_dest=sign(grid_y-obj_mega_man.grid_y);
			// Check if there is another enemy in the row we want to go to
			var enemy = collision_line(spacing_w+1*(cell_w),spacing_h+(grid_y-dir_dest)*(cell_h),spacing_w+6*(cell_w),spacing_h+(grid_y-dir_dest)*(cell_h),obj_mettaur,0,1)
			//Are we in the same row as the player, or is another Mettaur in the row?
			if (grid_y!=obj_mega_man.grid_y)&&(enemy=noone&& hit=0)
			{
				if(tile_owner[grid_x,grid_y-dir_dest]=2&&place_empty(x,spacing_h+(grid_y-dir_dest)*(cell_h),obj_enemy_parent)&&state=""&&tile_type[grid_x,grid_y-dir_dest]!=0)		 {grid_y-=dir_dest;image_index=0;}		
			}
			else if grid_y=obj_mega_man.grid_y||enemy!=noone
			{
				state="attack";
				image_index=0;
			}
			state_alarm=irandom_range(120/ai_level,160/ai_level);
		}
	}
	
	if state="" 	{sprite_index=spr_mettaur_stand;	}
	
	if state="attack"	
	{
		sprite_index=spr_mettaur_attack;
		if 	attack_timer<attack_timer_max{attack_timer+=1;}
		else if grid_x!=0&&hit=0&&my_wave=noone&&tile_type[grid_x-1,grid_y]!=0
		{
			var ob;
			ob = instance_create_depth(x,y,depth-10,obj_mettaur_shockwave);
			ob.grid_x=grid_x-1;
			ob.grid_y=grid_y;ob.creator=id;	my_wave = ob.id;
		}
	}
	
}


