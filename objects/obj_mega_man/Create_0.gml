/// @description Insert description here
// You can write your code in this editor

hp = 60;
max_hp = 100;
grid_x=2;
grid_y=2;

state="";
buffered_state="";
state_change=0;

buster_type = 1; // 0 = Machine Gun, 1 = Charge Shot
item_cooldown_time=12;
buster_cooldown_time=30;
item_cooldown=30;
attack_connected=0;

buster_cooldown=0;
buster_charge=0;
active_chip=0
damage_base=0;
damage_modifier=0;

charge_a = 100;
charge_b = 300;
state_change=0;

damage_invinsibility=0;
damage_blinker=0;

if battle_intro=1
fade=1;
else fade=0;