/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

hp = 30;
display_hp = hp;

ai_level = 1;
state_alarm = irandom_range(120/ai_level,160/ai_level);
attack_timer_max = 30; // Delay before the attack animation starts and when the attack comes out
attack_timer=0;
my_wave=noone;


