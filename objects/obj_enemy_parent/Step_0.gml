/// @description Insert description here
// You can write your code in this editor

depth=-y;

if battle_menu=1||battle_intro=1 exit;

if hurt_alarm!=0 hurt_alarm=int64(hurt_alarm-(abs(hurt_alarm)/hurt_alarm));
if hurt_alarm=0 hurt=0;

if hp!=display_hp
{
	display_hp = display_hp + sign(hp-display_hp)
}

if hp<=0
{
	if death=0
	{
		death=1;
		var explosion =	instance_create_depth(x,y,depth-1,obj_death_init);
		explosion.creator=id;
	}
}

