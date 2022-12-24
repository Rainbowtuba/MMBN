/// @description Insert description here
// You can write your code in this editor
if battle_menu = 0
{
	image_speed = 1;
}
else image_speed = 0;



if image_index = sprite_get_number(sprite_index)-2
{
	if !grid_x=0&&(grid_x>1&&tile_type[grid_x-1,grid_y]!=0)&&hit=0
	{
		var ob;
		ob = instance_create_depth(x,y,depth-10,obj_mettaur_shockwave);
		ob.grid_x=grid_x-1;
		ob.grid_y=grid_y;
		if instance_exists(creator) 
		{
			ob.creator=creator;
			creator.my_wave=ob;
		}
	}	
}