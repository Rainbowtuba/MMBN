/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprite_index,-1,x,y+2*scale,scale,scale,0,c_white,1-fade);
var hp_height = sprite_get_height(sprite_index)*scale;
var font = font_add_sprite_ext(spr_font_debug_numbers_silver, "1234567890", true, 0);
var hp_disp=string(display_hp)
if display_hp<=0 hp_disp="00"
	draw_set_halign(fa_right);
	draw_set_font(font);
	draw_set_color(c_white);
	draw_text_transformed_color(x,y-hp_height,hp_disp,scale,scale,0,c_white,c_white,c_white,c_white,1-fade);