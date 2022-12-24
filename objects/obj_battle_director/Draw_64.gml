/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_mega_man)&&(battle_menu+battle_intro=0)
{
	var font = font_add_sprite_ext(spr_font_debug_numbers_green, "1234567890", true, 2);
	draw_set_halign(fa_left);
	draw_set_font(font);
	draw_set_color(c_white);
	draw_sprite_ext(spr_status_icon,0,0,0,scale,scale,0,c_white,1);
	draw_text_transformed_color(160,12,string(obj_mega_man.hp),scale,scale,0,c_white,c_white,c_white,c_white,1);
}

var chip_width;
chip_width = 16*scale;
var gauge_val = ((custom_gauge_timer_max-(custom_gauge_timer_max-custom_gauge_timer))/custom_gauge_timer_max)*100
//draw_sprite_ext(spr_debug_HUD_text,display_text,rm_w/2,2*chip_width,scale,scale,0,c_white,1);
draw_sprite_ext(spr_special_gauge,0,rm_w/2,0,scale,scale,0,c_white,1);

if gauge_val!=100 
	draw_healthbar(scale*79-2,scale*8,scale*206,scale*14-1,gauge_val,c_black,make_color_rgb(212,244,244),make_color_rgb(212,244,244),0,0,0);
else 
	draw_sprite_ext(spr_special_gauge_full,round(custom_gauge_subimage),rm_w/2,0,scale,scale,0,c_white,1);

// Current Chip Selection Text
	var font = font_add_sprite_ext(spr_font_debug_chip_info, "ABCDEFGHIJKLMNOPQRSTUVWXYZ+1234567890", true, 2);
	draw_set_halign(fa_left);
	draw_set_font(font);
	draw_set_color(c_white);
	var active_chip = selected_chips[# 0, 0]
	var chip_text=0; if active_chip=1 chip_text="CANNON";	if active_chip=2 chip_text="HICANNON";	if active_chip=3 chip_text="MCANNON";	if active_chip=4 chip_text="AIRSHOT1";	if active_chip=5 chip_text="AIRSHOT2";	if active_chip=5 chip_text="AIRSHOT3";
	if chip_text!=0 draw_text_transformed_color(16,rm_h-16*scale,chip_text,scale,scale,0,c_white,c_white,c_white,c_white,1);


//Chip selection window

	draw_sprite_ext(spr_debug_chip_select_screen_HUD_BG,-1,battle_menu_x,0,scale,scale,0,c_white,1);
	#region DEBUG
	/*
	if battle_menu = 1
	{
		draw_set_color(c_grey);
		draw_rectangle(600,40,1300,700,0);
		draw_set_color(c_black);

		draw_set_font(fnt_default);
		for (var i=0;i<ds_grid_height(chip_folder);i++)
		{
			draw_text(600+20,40+20*i,string(chip_folder[# 0, i])+string(chip_folder[# 1, i]));
	
			draw_text(600+80,40+20*i,string(battle_folder_temp[# 0, i])+string(battle_folder_temp[# 1, i])+string(battle_folder_temp[# 2, i]));
		}
		for (var i=0;i<ds_grid_height(selected_chips);i++)
		{
			draw_text(800+20,40+20*i,string(selected_chips[# 0, i]));
	
			//draw_text(600+80,40+20*i,string(battle_folder_temp[# 0, i])+string(battle_folder_temp[# 1, i])+string(battle_folder_temp[# 2, i]));
		}
		draw_set_color(c_red);
		draw_rectangle(680,40,760,140,1);
	}*/
	#endregion
	#region Chip Selection Random Pull Icons
	for (var i=0;i<=4;i++)
	{
		if battle_folder_temp[# 2,i]=0
		{
			if battle_folder_temp[# 2,i]=0&&(battle_folder_temp[# 1,i]=selected_code||selected_code="*"||battle_folder_temp[# 1,i]="*"||battle_folder_temp[# 0,i]=selected_chips[# 0, 0])
			var color = c_white;	else var color = c_dkgray;
			draw_sprite_ext(spr_debug_chips_icons, battle_folder_temp[# 0, i], battle_menu_x+16*scale+16*scale*i,112*scale,scale,scale,0,color,1);
		
			var font = font_add_sprite_ext(spr_font_chip_type, "ABCDEFGHIJKLMNOPQRSTUVWXYZ*", true, 2);
			draw_set_font(font);
			draw_set_color(c_white);
			draw_text_transformed_color(battle_menu_x+10*scale+16*scale*i,118.25*scale,string(battle_folder_temp[# 1, (i)]),scale-1,scale-1,0,c_white,c_white,c_white,c_white,1);	
		}
	}
//	draw_text_transformed_color(battle_menu_x+14*scale+16*scale,128*scale,string(selected_code),scale-1,scale-1,0,c_white,c_white,c_white,c_white,1);
	#endregion
	#region Selected Chip Icons
	for (var i=0;i<=4;i++)
	{
		if selected_chips[# 0, i] != undefined
		{
			draw_sprite_ext(spr_debug_chips_icons, selected_chips[# 0, i], battle_menu_x+104*scale,32*scale+16*scale*i,scale,scale,0,c_white,1);
		}
	}
	#endregion
	
	#region Big Chip Display
	// Big Chip Display
		if chip_menu_sel>=0&&chip_menu_sel<5 
		{
			draw_sprite_ext(spr_debug_chips,battle_folder_temp[# 0, (chip_menu_sel)], battle_menu_x+(11*scale), (14*scale),scale,scale,0,c_white,1);
		}
		draw_sprite_ext(spr_chip_outer,-1, battle_menu_x+(4*scale), (7*scale),scale,scale,0,c_white,1);
	#endregion
	draw_sprite_ext(spr_debug_chip_select_screen_HUD,-1,battle_menu_x,0,scale,scale,0,c_white,1);


	#region Selection Blinker
	if chip_menu_sel<5
	draw_sprite_ext(spr_debug_chip_select_HUD_selector_1, blink, battle_menu_x+16*scale+16*scale*chip_menu_sel,112*scale,scale,scale,0,c_white,1);
	if chip_menu_sel=5
	draw_sprite_ext(spr_debug_chip_select_HUD_selector_2, blink, battle_menu_x+103*scale,122 *scale,scale,scale,0,c_white,1);
	#endregion