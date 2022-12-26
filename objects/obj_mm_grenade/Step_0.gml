/// @description Insert description here
// You can write your code in this editor




if x_n<=x
{
	throw_height+=3.5*scale*dcos((x_n-x_0)/(dist)*180)
	x_n+=2.5*scale
	
}
else 
{
	var enemy = instance_place(x,y,obj_enemy_parent)
		if enemy!=noone
		{
			with  enemy hp-=other.dmg;
		}
		if lvl=2
		{
			var enemy2 = instance_place(x,y-cell_h,obj_enemy_parent)
			if enemy2!=noone
			{
				with  enemy2 hp-=other.dmg;
			}
			var enemy3 = instance_place(x,y+cell_h,obj_enemy_parent)
			if enemy3!=noone
			{
				with  enemy3 hp-=other.dmg;
			}
			instance_create_depth(x,y-cell_h,1,obj_explosion_effect);
			instance_create_depth(x,y+cell_h,1,obj_explosion_effect);
		}
		instance_change(obj_explosion_effect,1);
	
}