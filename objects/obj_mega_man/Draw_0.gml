/// @description Insert description here
// You can write your code in this editor


draw_sprite_ext(sprite_index,-1,x,y,scale,scale,0,c_white,(1-fade)-damage_blinker);

if (buster_charge>=charge_a&&buster_charge<charge_b)
{
	draw_sprite_ext(spr_mm_charge_1,-1,x,y,scale,scale,0,c_white,1);
}
else if (buster_charge>=charge_b)
{
	draw_sprite_ext(spr_mm_charge_2,-1,x,y,scale,scale,0,c_white,1);
}


if battle_menu = 0
{
	for (var i=ds_grid_height(selected_chips)-1;i>=0;i--)
	{
		draw_sprite_ext(spr_debug_chips_icons,selected_chips[# 0, i],x+(scale*5)-i*(scale*2),y-48*scale-i*(scale*2),scale,scale,0,c_white,1);
	}
}
