/// @description Insert description here
// You can write your code in this editor
depth = -y;


tile_highlight[grid_x,grid_y]=1;

if (obj_mega_man.grid_x=grid_x)&&(obj_mega_man.grid_y=grid_y)&&hit=0&&sprite_get_number(sprite_index)-1//&&obj_mega_man.invincible=0
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
