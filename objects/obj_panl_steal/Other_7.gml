/// @description Insert description here
// You can write your code in this editor
if sprite_index=spr_debug_tile_steal_fx
{
	var enemy=instance_place(x,y,obj_enemy_parent);
	if enemy=noone tile_owner[grid_x,grid_y]=1;
	else enemy.hp-=10;
	stage_effect=2;
	stage_effect_type=0;
	instance_destroy();
}