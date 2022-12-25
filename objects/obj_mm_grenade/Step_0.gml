/// @description Insert description here
// You can write your code in this editor
depth = obj_mega_man.depth-100;
if x<=(spacing_w+dest_x*(cell_w))
{
	x+=3*scale;
	if x<=(spacing_w+dest_x*(cell_w))/2 height+=0.25*scale;
	else height-=0.25*scale;
}
else 
{
	var enemy = instance_place(x,y,oEnemyParent)
		if enemy!=noone
		{
			with  enemy hp-=dmg;
		}
		if lvl=2
		{
			var enemy2 = instance_place(x,y-cell_h,oEnemyParent)
			if enemy2!=noone
			{
				with  enemy2 hp-=dmg;
			}
			var enemy3 = instance_place(x,y+cell_h,oEnemyParent)
			if enemy3!=noone
			{
				with  enemy3 hp-=dmg;
			}
			instance_create_depth(x,y-cell_h,oExplosionFX,1);
			instance_create_depth(x,y+cell_h,oExplosionFX,1);
		}
	instance_change(oExplosionFX,1);
	
}