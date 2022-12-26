/// @description Insert description here
// You can write your code in this editor

scr_button_layout();
depth=-y;

if !(battle_menu+battle_intro=0)//&&stage_effect=0
exit;

	if state=""
		{
			state_change=0;
			if (rr&&grid_x<stage_col&&tile_owner[grid_x+1,grid_y]=1&&tile_type[grid_x+1,grid_y]=1)		 {state="move";grid_x+=1;image_index=0;}
			else if (uu&&grid_y>1&&tile_owner[grid_x,grid_y-1]=1&&tile_type[grid_x,grid_y-1]=1)			 {state="move";grid_y-=1;image_index=0;}
			else if (ll&&grid_x>1&&tile_owner[grid_x-1,grid_y]=1&&tile_type[grid_x-1,grid_y]=1)			 {state="move";grid_x-=1;image_index=0;}
			else if (dd&&grid_y<stage_row&&tile_owner[grid_x,grid_y+1]=1&&tile_type[grid_x,grid_y+1]=1)	 {state="move";grid_y+=1;image_index=0;}
		}
	else if state="move"
		{
		//	if (rrp&&grid_x<stage_col&&tile_owner[grid_x+1,grid_y]=1)		 {state="move";grid_x+=1;image_index=0;}
		//	else if (uup&&grid_y>1&&tile_owner[grid_x,grid_y-1]=1)		 {state="move";grid_y-=1;image_index=0;}
		//	else if (llp&&grid_x>1&&tile_owner[grid_x-1,grid_y]=1)		 {state="move";grid_x-=1;image_index=0;}
		//	else if (ddp&&grid_y<stage_row&&tile_owner[grid_x,grid_y+1]=1)	 {state="move";grid_y+=1;image_index=0;}
		}
	if state!="" image_speed = 1;

	#region Buster
		if (buster_cooldown<buster_cooldown_time)	buster_cooldown+=1;
		else										buster_cooldown=buster_cooldown_time;
		if bb	
		{
			buster_charge+=1;	
			if buster_charge=charge_a 	audio_play_sound(snd_buster_charge_1,1,0); 
			if buster_charge=charge_b 	audio_play_sound(snd_buster_charge_2,1,0);
			
		}
		if bbp 
		{
			if ((bbp&&buster_type=0)||(bb&&buster_type=1))&&(buster_cooldown=buster_cooldown_time)
			{
				if state=""||state="shoot"
				{
					state="shoot";
					image_index=0;
					attack_connected=0;
					state_change=0;
				} 
				else if state="move"
				{
					buffered_state="shoot";
					
				}
			}	
		}
		if bbr 
		{
			if state=""&&buffered_state=""
			{
					if buster_charge>=charge_a&&buster_charge<charge_b
					{
						state="chargea";
						image_index=0;
					}
					else if buster_charge>=charge_b
					{
						state="chargeb";
						image_index=0;
						buster_cooldown=0;
						buster_charge=0;
					}
			}
			else if state="move"
			{
				if buster_charge>=charge_a&&buster_charge<charge_b
				{
					buffered_state="chargea";
				}
				else if buster_charge>=charge_b
				{
					buffered_state="chargeb";
				}
			}
		}
		if state="shoot"
		{
			if state_change=0
			{
				buster_cooldown=0;
				buster_charge=0;
				state_change=1;
				audio_play_sound(snd_buster_small,2,0);
			}
			var enemy = collision_line_first(x,y,rm_w,y,obj_enemy_parent,0,1)
			if enemy!=noone&&attack_connected=0 
			{
				with enemy 
				{
				hp-=1; //	hurt = 1;  event_user(0);
				var fx=instance_create_depth(x-sprite_width,y,depth-1,obj_buster_dmg);
				fx.sprite_index=spr_buster_effect;
				}
				attack_connected=1;
				if enemy.grid_x-grid_x=1	buster_cooldown_time=15;
				else						buster_cooldown_time=10+5*(enemy.grid_x-grid_x);
			}
			else if enemy=noone&&attack_connected=0 buster_cooldown_time=45;
		}
		if state="chargea"
		{
			if state_change=0
			{
				buster_cooldown=0;
				buster_charge=0;
				state_change=1;
				audio_play_sound(snd_buster_charged,2,0);
			}
			var enemy = collision_line_first(x,y,rm_w,y,obj_enemy_parent,0,1)
			if enemy!=noone&&attack_connected=0 
			{
				with enemy 
				{
				hp-=5; //	hurt = 1;  event_user(0);
				var fx=instance_create_depth(x-sprite_width,y,depth-1,obj_buster_dmg);
				fx.sprite_index=spr_buster_effect_1;
				}
				attack_connected=1;
				if enemy.grid_x-grid_x=1	buster_cooldown_time=15;
				else						buster_cooldown_time=10+5*(enemy.grid_x-grid_x);
			}
			else if enemy=noone&&attack_connected=0 buster_cooldown_time=45
		}
		if state="chargeb"
		{
			if state_change=0
			{
				buster_cooldown=0;
				buster_charge=0;
				state_change=1;
				audio_play_sound(snd_buster_charged,2,0);
			}
			var enemy = collision_line_first(x,y,rm_w,y,obj_enemy_parent,0,1)
			if enemy!=noone&&attack_connected=0 
			{
				with enemy 
				{
				hp-=10; //	hurt = 1;  event_user(0);
				var fx=instance_create_depth(x-2*scale-sprite_width,y,depth-1,obj_buster_dmg);
				fx.sprite_index=spr_buster_effect_2;
				}
				attack_connected=1;
				if enemy.grid_x-grid_x=1	buster_cooldown_time=15;
				else						buster_cooldown_time=10+5*(enemy.grid_x-grid_x);
			}
			else if enemy=noone&&attack_connected=0 buster_cooldown_time=45
		}
	#endregion
	#region Chip Attacks
	 active_chip = selected_chips[# 0, 0]

	#region Cannons 
	if active_chip=1||active_chip=2||active_chip=3
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""&&buffered_state=""
			{
				state="cannon0";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				buffered_state="cannon0"
			}
		}
	}
	#endregion
	#region AirShots
	else if active_chip=4||active_chip=5||active_chip=6
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""&&buffered_state=""
			{
				if active_chip = 4 state="airshot1";
				else if active_chip = 5 state="airshot2";
				else if active_chip = 6 state="airshot3";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip = 4 buffered_state="airshot1";
				else if active_chip = 5 buffered_state="airshot2";
				else if active_chip = 6 buffered_state="airshot3";
			}
		}
		if state ="airshot1"||state ="airshot2"||state ="airshot3"{buster_charge = 0;}
	}
	
	#endregion	
	#region Volcano
	else if active_chip = 7||active_chip = 8||active_chip = 9||active_chip = 10
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""&&buffered_state=""
			{
				if active_chip = 7 state="volcano1";
				else if active_chip = 8 state="volcano2";
				else if active_chip = 9 state="volcano3";
				else if active_chip =10 state="volcano4";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip = 7 buffered_state="volcano1";
				else if active_chip = 8 buffered_state="volcano2";
				else if active_chip = 9 buffered_state="volcano3";
				else if active_chip =10 buffered_state="volcano4";
			}
		}
			
		if state ="volcano1"||state ="volcano2"||state ="volcano3"
		{
	
			buster_charge = 0;
		}
		else if state="volcano4"
		{
		
			buster_charge = 0;
		}
	}
	#endregion
	#region Spread Guns
	else if active_chip=11||active_chip=12||active_chip=13||active_chip=14
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""&&buffered_state=""
			{
				if active_chip = 11		 state="shotgun";
				else if active_chip = 12 state="vgun";
				else if active_chip = 13 state="sidegun";
				else if active_chip = 14 state="spreader";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip = 11		 buffered_state="shotgun";
				else if active_chip = 12 buffered_state="vgun";
				else if active_chip = 13 buffered_state="sidegun";
				else if active_chip = 14 buffered_state="spreader";
			}
		}
		if state ="shotgun"||state ="vgun"||state ="sidegun"||state ="spreader"
		{
			buster_charge = 0;				
		}
	}
	#endregion
	#region Bubbler
	else if active_chip=15||active_chip=16||active_chip=17
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""&&buffered_state=""
			{
				if active_chip = 15 state="bubbler";
				else if active_chip = 16 state="bubblev";
				else if active_chip = 17 state="bubbleside";
			
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip = 15		 buffered_state="bubbler";
				else if active_chip = 16 buffered_state="bubblev";
				else if active_chip = 17 buffered_state="bubbleside";
			}
		}
		if state ="bubbler"||state ="bubblev"||state ="bubbleside"
		{
			buster_charge = 0;				
		}
	}
	#endregion
	#region Heatshot
	else if active_chip=18||active_chip=19||active_chip=20
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""&&buffered_state=""
			{
				if active_chip = 18 state="heatshot";
				else if active_chip = 19 state="heatv";
				else if active_chip = 20 state="heatside";
			
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip = 18		 buffered_state="heatshot";
				else if active_chip = 19 buffered_state="heatv";
				else if active_chip = 20 buffered_state="heatside";
			}
		}
		if state ="heatshot"||state ="heatv"||state ="heatside"
		{
			buster_charge = 0;				
		}
	}
	#endregion
	#region Grenades
	else if active_chip=21||active_chip=22||active_chip=23||active_chip=24
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""
			{
				if active_chip=21			state="grenade1";
				else if active_chip=22		state="grenade2";
				else if active_chip=23		state="grenade3";
				else if active_chip=24		state="grenade4";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip=21		buffered_state="grenade1";
				else if active_chip=22  buffered_state="grenade2";
				else if active_chip=23  buffered_state="grenade3";
				else if active_chip=24  buffered_state="grenade4";
			}
		}
		if state="grenade1"||state="grenade2"||state="grenade3"||state="grenade4"
		{	
			buster_charge = 0;
		}
	}
	#endregion
	#region Cannonball
	else if active_chip=25||active_chip=26||active_chip=27
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""
			{
				if active_chip=25		state="cannonball1";
				else if active_chip=26  state="cannonball2";
				else if active_chip=27  state="cannonball3";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip=25		buffered_state="cannonball1";
				else if active_chip=26  buffered_state="cannonball2";
				else if active_chip=27  buffered_state="cannonball3";
			}
		}
		if state="cannonball1"||state="cannonball2"||state="cannonball3"
		{	
			buster_charge = 0;
		}
	}
	#endregion
	#region Bombs
	else if active_chip=28||active_chip=29||active_chip=30
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""
			{
				if active_chip=28		state="bomb1";
				else if active_chip=29  state="bomb2";
				else if active_chip=30  state="bomb3";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip=28		buffered_state="bomb1";
				else if active_chip=29  buffered_state="bomb2";
				else if active_chip=30  buffered_state="bomb3";
			}
		}
		if state="bomb1"||state="bomb2"||state="bomb3"
		{	
			buster_charge = 0;
		}
	}
	#endregion
	#region Swords
	else if active_chip=31||active_chip=32||active_chip=33
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""
			{
				if active_chip=31 state="sword";
				if active_chip=32 state="widesword";
				if active_chip=33 state="longsword";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip=31 buffered_state="sword";
				if active_chip=32 buffered_state="widesword";
				if active_chip=33 buffered_state="longsword";
			}
		}
		if state="sword"||state="widesword"||state="longsword"
		{
			buster_charge = 0;
		}
	}
	#endregion
	#region Healing Chips
	else if active_chip=147||active_chip=148||active_chip=149//154
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""
			{
				if active_chip=147 state="recover10";
				if active_chip=148 state="recover30";
				if active_chip=149 state="recover50";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip=147 buffered_state="recover10";
				if active_chip=148 buffered_state="recover30";
				if active_chip=149 buffered_state="recover50";
			}
		}
		if state="recover10"||state="recover30"||state="recover50"
		{
			buster_charge = 0;
			if hp<max_hp&&attack_connected=0
			{
				if active_chip=147 hp+=10;
				if active_chip=148 hp+=30;
				if active_chip=149 hp+=50;
				attack_connected=1;
				audio_play_sound(snd_health_up,22,0);
			}
		}
	}
	#endregion
	#region Panel Out 
	else if active_chip=134||active_chip=135
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""&&buffered_state=""
			{
				if active_chip=134 state="panelout1";
				if active_chip=135 state="panelout3";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip=134 buffered_state="panelout1";
				if active_chip=135 buffered_state="panelout3";
			}
		}
	}
	#endregion
	#region Area Steal 
	else if active_chip=136||active_chip=137
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""&&buffered_state=""
			{
				if active_chip=136 state="panelgrab";
				if active_chip=137 state="areagrab";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				if active_chip=136 buffered_state="panelgrab";
				if active_chip=137 buffered_state="areagrab";
			}
		}
	}
	#endregion
	#region Attack+ 
	if active_chip=195
	{
		if aap&&(item_cooldown=item_cooldown_time) 
		{
			if state=""&&buffered_state=""
			{
				state="attack+";
				image_index=0;
				item_cooldown=0; 
			}
			else if state="move"
			{
				buffered_state="attack+"
			}
		}
	}
	#endregion

	
	
	
	
	if (item_cooldown<item_cooldown_time)		item_cooldown+=1;
	else										item_cooldown=item_cooldown_time;
	#endregion // Chip Attacks

	#region Chip Attack States
	
	// Attack +10 code
	if selected_chips[# 0, 1]=195 damage_modifier=10;
	else damage_modifier=0;
	
	if state="cannon1"||state="cannon2"||state="cannon3"
	{
		var enemy = collision_line_first(x,y,rm_w,y,obj_enemy_parent,0,1)
		if enemy!=noone && attack_connected=0 
		{
			if state="cannon1"		enemy.hp-=40+damage_modifier; 
			else if state="cannon2" enemy.hp-=60+damage_modifier; 
			else if state="cannon3" enemy.hp-=80+damage_modifier; 
			var fx=instance_create_depth(enemy.x,y,depth-1,obj_buster_dmg);
			fx.sprite_index=spr_debug_explosion;
			
			attack_connected=1;
		}
		buster_charge = 0;	
	}
	else if state="airshot1"||state="airshot2"||state="airshot3"
	{
		var enemy = collision_line_first(x,y-1,rm_w,y+1,obj_enemy_parent,0,1)
		if enemy!=noone && attack_connected=0 
		{
			var behind=instance_place(enemy.x+cell_w,enemy.y,obj_enemy_parent)
				
			if state="airshot1"		 {enemy.hp-=20+damage_modifier;}// hurt = 1;  event_user(0);
			else if state="airshot2" {enemy.hp-=30+damage_modifier;;} // hurt = 1;  event_user(0);
			else if state="airshot3" {enemy.hp-=40+damage_modifier;;} // hurt = 1;  event_user(0);
			var fx=instance_create_depth(x,y,depth-1,obj_buster_dmg);
			fx.sprite_index=spr_debug_explosion;
			if enemy.grid_x<stage_col&&behind=noone&&hp>0&&tile_type[enemy.grid_x+1,enemy.grid_y]!=0 enemy.grid_x+=1;
			attack_connected=1;
		}
		buster_charge = 0;	
	}
	else if state="shotgun" 
	{
		var enemy = collision_line_first(x,y,rm_w,y,obj_enemy_parent,0,1)
		if enemy!=noone && attack_connected=0 
		{
			enemy.hp-=30+damage_modifier;// hurt = 1;  event_user(0);
			var fx=instance_create_depth(enemy.x,y,depth-1,obj_buster_dmg);
			fx.sprite_index=spr_spreadgun_effect;
			var fx=instance_create_depth(enemy.x+cell_w,y,depth-1,obj_buster_dmg);
			fx.sprite_index=spr_spreadgun_effect;
				
			var enemy2 = instance_place(enemy.x+cell_w,enemy.y,obj_enemy_parent)
			if enemy2!=noone
			{
				enemy2.hp-=30+damage_modifier;
			}
			attack_connected=1;
		}
		buster_charge = 0;	
	}
	else if state="vgun" 
	{
		var enemy = collision_line_first(x,y,rm_w,y,obj_enemy_parent,0,1)
		if enemy!=noone && attack_connected=0 
		{

				enemy.hp-=30+damage_modifier;// hurt = 1;  event_user(0);
				var fx=instance_create_depth(enemy.x,enemy.y,depth-1,obj_buster_dmg);
				fx.sprite_index=spr_spreadgun_effect;
				var fx=instance_create_depth(enemy.x+cell_w,enemy.y+cell_h,depth-1,obj_buster_dmg);
				fx.sprite_index=spr_spreadgun_effect;
				var fx=instance_create_depth(enemy.x+cell_w,enemy.y-cell_h,depth-1,obj_buster_dmg);
				fx.sprite_index=spr_spreadgun_effect;
				
				var enemy2 = instance_place(enemy.x+cell_w,enemy.y+cell_h,obj_enemy_parent)
				if enemy2!=noone 	{ enemy2.hp-=30+damage_modifier;	}
				var enemy3 = instance_place(enemy.x+cell_w,enemy.y-cell_h,obj_enemy_parent)
				if enemy3!=noone 	{ enemy3.hp-=30+damage_modifier;	}

			attack_connected=1;
		}
		buster_charge = 0;	
	}
	else if state="sidegun" 
	{
		var enemy = collision_line_first(x,y-1,rm_w,y+1,obj_enemy_parent,0,1)
		if enemy!=noone && attack_connected=0 
		{

			enemy.hp-=30;// hurt = 1;  event_user(0);
			var fx=instance_create_depth(enemy.x,enemy.y,depth-1,obj_buster_dmg);
			fx.sprite_index=spr_spreadgun_effect;
			var fx=instance_create_depth(enemy.x,enemy.y+cell_h,depth-1,obj_buster_dmg);
			fx.sprite_index=spr_spreadgun_effect;
			var fx=instance_create_depth(enemy.x,enemy.y-cell_h,depth-1,obj_buster_dmg);
			fx.sprite_index=spr_spreadgun_effect;
				
			var enemy2 = instance_place(enemy.x,enemy.y+cell_h,obj_enemy_parent)
			if enemy2!=noone
			{
				enemy2.hp-=30+damage_modifier;
			}
			var enemy3 = instance_place(enemy.x,enemy.y-cell_h,obj_enemy_parent)
			if enemy3!=noone
			{
				enemy3.hp-=30+damage_modifier;
			}
				
			
			attack_connected=1;
		}
		buster_charge = 0;	
	}
	else if state="grenade1"||state="grenade2"||state="grenade3" 
	{
		if  attack_connected=0&&image_index>3
		{
			instance_create_depth(x,y,depth-1,obj_mm_grenade);
			attack_connected=1;
		}
		buster_charge = 0;	
	}
	else if state="sword"
	{
		if attack_connected=0 
		{
			var fx=instance_create_depth(x+cell_w,y,depth-1,obj_buster_dmg);
			fx.sprite_index=spr_mm_sword_1;
			var enemy = instance_place(x+cell_w,y,obj_enemy_parent);
			if enemy!=noone
			{
				enemy.hp-=80+damage_modifier;
			}
		attack_connected=1;
		}
		buster_charge = 0;	
		
	}
	else if state="widesword"
	{
		if attack_connected=0 
		{
			var fx=instance_create_depth(x+cell_w,y,depth-1,obj_buster_dmg);
				fx.sprite_index=spr_mm_sword_1;
			var enemy = instance_place(x+cell_w,y,obj_enemy_parent);
			var enemy2 = instance_place(x+cell_w,y+cell_h,obj_enemy_parent);
			var enemy3 = instance_place(x+cell_w,y-cell_h,obj_enemy_parent);
			
			if enemy!=noone   { enemy.hp-=80+damage_modifier; }
			if enemy2!=noone  { enemy2.hp-=80+damage_modifier; }
			if enemy3!=noone  { enemy3.hp-=80+damage_modifier; }
		attack_connected=1;
		}
		buster_charge = 0;	
	}
	else if state="longsword"
	{
		if attack_connected=0 
		{
			var fx=instance_create_depth(x+cell_w,y,depth-1,obj_buster_dmg);
				fx.sprite_index=spr_mm_sword_1;
			var enemy = instance_place(x+cell_w,y,obj_enemy_parent);
			var enemy2 = instance_place(x+2*cell_w,y,obj_enemy_parent);
			
			
			if enemy!=noone   { enemy.hp-=80+damage_modifier; }
			if enemy2!=noone  { enemy2.hp-=80+damage_modifier; }

		attack_connected=1;
		}
		buster_charge = 0;	
	}
	else if state="panelout1"||state="panelout3"
	{
		if  attack_connected=0&&image_index>4
		{
			#region Center Panel
			var enemy = instance_place(x+cell_w,y,obj_enemy_parent);
			if enemy!=noone
			{
				enemy.hp-=10+damage_modifier;
				attack_connected=1;
			}
			else 
			{
				tile_type[grid_x+1,grid_y]=0;
				attack_connected=1;
			}
			var fx=instance_create_depth(x+cell_w,y-cell_h,depth-1,obj_buster_dmg);
			fx.sprite_index=spr_panl_out_smoke;
			#endregion
			#region Upper Panel
			if grid_y!=1
			{
				var enemy1 = instance_place(x+cell_w,y-cell_h,obj_enemy_parent);
				if enemy1!=noone
				{
					enemy1.hp-=10+damage_modifier;
				}
				else 
				{
					tile_type[grid_x+1,grid_y-1]=0;
				}
				var fx=instance_create_depth(x+cell_w,y,depth-1,obj_buster_dmg);
				fx.sprite_index=spr_panl_out_smoke;
			}
			#endregion
			#region Lower Panel
			if grid_y!=stage_row
			{
				var enemy2 = instance_place(x+cell_w,y+cell_h,obj_enemy_parent);
				if enemy2!=noone
				{
					enemy2.hp-=10+damage_modifier;
				}
				else 
				{
					tile_type[grid_x+1,grid_y+1]=0;
				}
				var fx=instance_create_depth(x+cell_w,y+cell_h,depth-1,obj_buster_dmg);
				fx.sprite_index=spr_panl_out_smoke;
			}
			#endregion
		}
		buster_charge = 0;	
	}
	else if state="panelgrab"||state="areagrab"
	{
		if  attack_connected=0
		{
			stage_effect_type=state; stage_effect=1;		
			if state="panelgrab"
			{
				var selected=0;
				for (var i=1;i<=stage_col;i++)	{	if tile_owner[i,grid_y]=2 	{selected=i; break;}	}
				var steal = instance_create_depth(x,y,depth-1000,obj_panl_steal);
				steal.grid_x=selected;		steal.grid_y=grid_y;
			}
			if state="areagrab"
			{
				var selected=0;
				for (var i=1;i<=stage_col;i++)	{	if tile_owner[i,grid_y]=2 	{selected=i; break;}	}		
				
				var steal = instance_create_depth(x,y,depth-1000,obj_panl_steal);
				steal.grid_x=selected; steal.grid_y=1;
				
				var steal1 = instance_create_depth(x,y,depth-1000,obj_panl_steal);
				steal1.grid_x=selected; steal1.grid_y=2;
				
				var steal2 = instance_create_depth(x,y,depth-1000,obj_panl_steal);
				steal2.grid_x=selected;	steal2.grid_y=3;
			}
			attack_connected=1;
			{state="";selected_chips[# 0,0]=0;ds_grid_translate(selected_chips,0,-1);attack_connected=0; buffered_state="";}
		}
	}
	else if state="attack+"
	{
		if  attack_connected=0&&image_index>1
		{
			var fx=instance_create_depth(x+8*scale,y-40*scale,depth-1,obj_buster_dmg);
			fx.sprite_index=spr_panl_out_smoke;
			attack_connected=1;
		}
		buster_charge = 0;	
	}
	#endregion
	
	#region Damage  Blink
	if damage_invinsibility>=1 
	{	
		damage_invinsibility-=1;
		if (damage_invinsibility mod 4)=0 damage_blinker=!damage_blinker; 
	}
	else damage_blinker=0;
	#endregion
	
	#region Sprites

	if state=""				sprite_index=spr_mm_stand;
	if state="move"			sprite_index=spr_mm_move;
	if state="hurt"			sprite_index=spr_mm_hurt;
	if state="shoot"		sprite_index=spr_mm_shoot;
	if state="chargea"		sprite_index=spr_mm_shoot_charge_a;
	if state="chargeb"		sprite_index=spr_mm_shoot_charge_b;
		
	if state="cannon0"		sprite_index=spr_mm_cannon_ready;
	if state="cannon1"		sprite_index=spr_mm_cannon_1_fire;
	if state="cannon2"		sprite_index=spr_mm_cannon_2_fire;
	if state="cannon3"		sprite_index=spr_mm_cannon_3_fire;
		
	if state="airshot1"||state="airshot2"||state="airshot3"	
		sprite_index=spr_mm_air_shot;
		
	if state="volcano1"		sprite_index=spr_mm_volcano_1;
	if state="volcano2"		sprite_index=spr_mm_volcano_2;
	if state="volcano3"		sprite_index=spr_mm_volcano_3;
	if state="volcano4"		sprite_index=spr_mm_volcano_4;
		
	if state="shotgun"||state="vgun"||state="sidegun"||state="spreader"
		sprite_index=spr_mm_shoot;
		
	if state="bubbler"||state="bubblev"||state="bubbleside"
		sprite_index=spr_mm_shoot;
		
	if state="heatshot"||state="heatv"||state="heatside"
		sprite_index=spr_mm_shoot;

	if state="grenade1"||state="grenade2"||state="grenade3"||state="grenade4"
		sprite_index=spr_mm_throw;
		
	if state="cannonball1"||state="cannonball2"||state="cannonball3"
		sprite_index=spr_mm_throw;
		
	if state="bomb1"||state="bomb2"||state="bomb3"
		sprite_index=spr_mm_throw;	
		
	if state="sword"||state="widesword"||state="longsword"
		sprite_index=spr_mm_sword_swing;
		
	if state="recover10"||state="recover30"||state ="recover50"
		sprite_index=spr_mm_recover;
		
	if state="panelout1"||state="panelout3"
		sprite_index=spr_mm_panel_out;
		
	if state="attack+"
		sprite_index=spr_mm_stand_3_frame;
	#endregion