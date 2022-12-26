/// @description Insert description here
// You can write your code in this editor
if sprite_index=spr_buster_effect audio_play_sound(snd_buster_hit,2,0);
else if sprite_index=spr_buster_effect_1
	 || sprite_index=spr_buster_effect_2 audio_play_sound(snd_buster_hit_2,2,0);
else if sprite_index=spr_panl_out_smoke audio_play_sound(snd_poof_smoke,2,0);
else if sprite_index=spr_debug_explosion audio_play_sound(snd_explosion,2,0);
 

