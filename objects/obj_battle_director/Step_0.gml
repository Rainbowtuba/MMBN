/// @description Insert description here
// You can write your code in this editor


scr_button_layout();



if battle_menu=1&&battle_intro=0
{	
	#region Boring Chip Rules
	if selected_chips[# 0,0]=0																														// No chips Selected
	{
		selected_code="*"; 
	}
	else if selected_chips[# 1,0]="*"&&selected_chips[# 1,1]!=0																						// 1 Wildcard
	{
		selected_code=selected_chips[# 1,1];
	}
	else if selected_chips[# 1,0]="*"&&selected_chips[# 1,1]="*"&&selected_chips[# 1,2]!=0															// 2 Wildcards
	{
		selected_code=selected_chips[# 1,2];
	}
	else if selected_chips[# 1,0]="*"&&selected_chips[# 1,1]="*"&&selected_chips[# 1,2]="*"&&selected_chips[# 1,3]!=0								// 3 Wildcards
	{
		selected_code=selected_chips[# 1,3];
	}
	else if selected_chips[# 1,0]="*"&&selected_chips[# 1,1]="*"&&selected_chips[# 1,2]="*"&&selected_chips[# 1,3]="*"&&selected_chips[# 1,4]!=0	// 4 Wildcards
	{
		selected_code=selected_chips[# 1,4];
	}
	else if (selected_chips[# 1,0]!=0&&selected_chips[# 1,0]!="*")																					// No Wildcards
	{
		selected_code=selected_chips[# 1,0];
	}
	#endregion
	
	if battle_menu_x<0 battle_menu_x+=20; else battle_menu_x=0
	
	if custom_gauge_timer=custom_gauge_timer_max {event_user(0); chip_menu_sel=0;}
	custom_gauge_timer=0;
	
	#region Pressing Right
	if rrp chip_menu_sel+=1
	if chip_menu_sel>=6 chip_menu_sel-=6;
	#endregion
	#region Pressing Left
	if llp chip_menu_sel-=1
	if chip_menu_sel<0 chip_menu_sel+=6;
	#endregion
	#region Pressing "Accept"
	//First Row
		if aap && chip_menu_sel <= 4
		{
			if battle_folder_temp[# 2,chip_menu_sel]=0&&(battle_folder_temp[# 1,chip_menu_sel]=selected_code||selected_code="*"||battle_folder_temp[# 1,chip_menu_sel]="*"||battle_folder_temp[# 0,chip_menu_sel]=selected_chips[# 0, 0])
			{
				battle_folder_temp[# 2, chip_menu_sel] = 1;
				#region	Determine Next empty space in chip selection
				var empty_space=0;
				for (var i=0;i<ds_grid_height(selected_chips);i++)
				{
					if selected_chips[# 0, i] = 0
					{
						empty_space = i; 
						selection_order[empty_space]=chip_menu_sel;
						break;
					}
				}
				#endregion
				selected_chips[# 0,empty_space]=battle_folder_temp[# 0,chip_menu_sel];
				selected_chips[# 1,empty_space]=battle_folder_temp[# 1,chip_menu_sel]
			}
		}
	// End
		else if aap && chip_menu_sel = 5
		{
			battle_menu+=1;
		}
	#endregion
	#region Pressing "Back"
		if bbp
		{	
			var recent_selection=-1;
				for (var j=4;j>=0;j--)
				{
					if selected_chips[# 0, j] != 0
					{
						recent_selection = j; 	break;
					}
				}
		if recent_selection>-1&&selection_order[recent_selection]!=-1
			{
				selected_chips[# 0, recent_selection]=0; selected_chips[# 1, recent_selection]=0;
				battle_folder_temp[# 2, selection_order[recent_selection]] = 0;	selection_order[recent_selection]=-1;
			}
		}
	#endregion
	#region Blink Timer
	blink_timer+=1;
	if blink_timer>=blink_timer_max 
	{
		blink=!blink;
		blink_timer-=blink_timer_max;
	}
	#endregion
	
	
}
if battle_menu=2 
{
	// Exit animation
if battle_menu_x>-sprite_get_width(spr_debug_chip_select_screen_HUD)*scale battle_menu_x-=20; 
else {battle_menu_x=-sprite_get_width(spr_debug_chip_select_screen_HUD)*scale; battle_menu=0;}
}
if battle_menu=0&&stage_effect=0
{
	if custom_gauge_timer<custom_gauge_timer_max
	custom_gauge_timer+=1;	
	else 
	{
		custom_gauge_subimage+=0.1
		if custom_gauge_subimage >4 custom_gauge_subimage-=4
	}
}

if stage_effect=1
{
	if stage_effect_alpha>0.25 stage_effect_alpha-=0.1;
}
if stage_effect=2&&stage_effect_type=0
{
	if stage_effect_alpha<=1 stage_effect_alpha+=0.1;
	else stage_effect=0;
	
}