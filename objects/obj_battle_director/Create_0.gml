/// @description Insert description here
// You can write your code in this editor
randomise();
globalvar   chip_folder, battle_folder_temp, selected_chips, battle_menu, 
			rm_w, rm_h, stage_w, stage_h, spacing_w, spacing_h, scale,
			tile_type, tile_owner, tile_highlight, stage_col, stage_row, cell_h, cell_w,
			custom_gauge_timer, custom_gauge_timer_max, selected_code, stage_effect,
			stage_effect_type, battle_intro;

battle_intro=1;

battle_menu = 1;
stage_effect=0;
stage_effect_type=0;
stage_effect_alpha = 1;
selected_chips = ds_grid_create(2,5);
selected_code = "*";
scale = 4.8;
color = c_white;
stage_col = 6;									stage_row = 3;
cell_w = 40*scale;							cell_h= 25*scale;
rm_w=room_width;							rm_h=room_height;
stage_w = stage_col*cell_w;					stage_h = stage_row*cell_h;
spacing_w = cell_w/2+(rm_w-stage_w)/2;		spacing_h = (rm_h-stage_h)-(cell_h);

custom_gauge_timer_max=60*12;
custom_gauge_timer=0;
battle_menu_x = -sprite_get_width(spr_debug_chip_select_screen_HUD)*scale;
custom_gauge_subimage = 0;
#region Selection Blinker
chip_menu_sel = 0;

blink = 0;
blink_timer = 0;
blink_timer_max = 30;
#endregion


#region BN3 Starting Chip Folder - Folder that each battle begins with. Stays in memory
chip_folder=ds_grid_create(2,30);

		
chip_create(0,1,"A");
chip_create(1,1,"A");
chip_create(2,1,"B");
chip_create(3,1,"B");

chip_create(4,11,"J");
chip_create(5,11,"J");
chip_create(6,11,"J");

chip_create(7, 1,"D");	
chip_create(8,12,"D");	
chip_create(9,12,"D");

chip_create(10,13,"S");

chip_create(11, 4,"*");	
chip_create(12, 4,"*");	
chip_create(13, 4,"*");	

chip_create(14,21,"B");	
chip_create(12,21,"B");	
chip_create(16,21,"S");

chip_create(17,31,"L");
chip_create(18,31,"L");	
chip_create(19,31,"L");

chip_create(20,32,"L");	

chip_create(21,13,"B");	
chip_create(22,135,"B");	

chip_create(23,137,"L");

chip_create(24,147,"A");	
chip_create(25,147,"A");
chip_create(26,147,"L");
chip_create(27,147,"L");

chip_create(28,195,"*");
chip_create(29,195,"*");
#endregion

#region battle_folder_temp is used per battle to randomize and edit contents before being deleted at the end of a battle
battle_folder_temp=ds_grid_create(3,30);

//battle_folder_temp=chip_folder;
for (var i=0;i<ds_grid_height(battle_folder_temp);i++)
{
	battle_folder_temp[# 0, i] = chip_folder[# 0, i];	battle_folder_temp[# 1, i] = chip_folder[# 1, i];	battle_folder_temp[# 2, i] = 0
}
battle_folder_temp=ds_grid_shuffle_adv(battle_folder_temp,0,1)
#endregion



for (var j=1;j<=stage_row;j++)
{
	for (var i=1;i<=stage_col;i++)
	{
		tile_type[i,j]=1;
		if i<4 tile_owner[i,j]=1; else tile_owner[i,j]=2;
		tile_highlight[i,j]=0; 
	}
}
