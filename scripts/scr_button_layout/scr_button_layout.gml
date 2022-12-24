// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_button_layout()
{
#region Keys
rr=keyboard_check(ord("D"));
	rrp=keyboard_check_pressed(ord("D"));
	rrr=keyboard_check_released(ord("D"));

uu=keyboard_check(ord("W"));
	uup=keyboard_check_pressed(ord("W"));
	uur=keyboard_check_released(ord("W"));

ll=keyboard_check(ord("A"));
	llp=keyboard_check_pressed(ord("A"));
	llr=keyboard_check_released(ord("A"));

dd=keyboard_check(ord("S"));
	ddp=keyboard_check_pressed(ord("S"));
	ddr=keyboard_check_released(ord("S"));

aa = keyboard_check(ord("K"))+mouse_check_button(mb_left);
aap = keyboard_check_pressed(ord("K"))+mouse_check_button_pressed(mb_left);
aar = keyboard_check_released(ord("K"))+mouse_check_button_released(mb_left);

bb = keyboard_check(ord("J"))+mouse_check_button(mb_right);
bbp = keyboard_check_pressed(ord("J"))+mouse_check_button_pressed(mb_right);
bbr = keyboard_check_released(ord("J"))+mouse_check_button_released(mb_right);


st_p = keyboard_check_pressed(vk_enter);
#endregion
}