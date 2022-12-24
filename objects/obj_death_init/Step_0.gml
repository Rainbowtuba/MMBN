/// @description Insert description here
// You can write your code in this editor
depth=-y;
if battle_menu=0&&stage_effect=0
{
	if alarm_explosion=0 
	{
		if count<5
		{
			instance_create_depth(x+irandom_range(-15*scale,15*scale),y+irandom_range(-15*scale,15*scale),-10,obj_explosion_effect);
			count+=1;
			alarm_explosion=irandom_range(5,15);
		} 
		else instance_destroy();
		if creator!=noone with creator instance_destroy();
	} 
	else 
	{
			alarm_explosion-=1;
	}
	image_speed = 1;
}
else image_speed = 0;