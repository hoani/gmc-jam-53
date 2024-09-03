/// @description Insert description here
// You can write your code in this editor

if snd == -1 {
	instance_destroy()
	exit
}


sfx = new_sfx()
sfx_gain(sfx, gain)
snd_id = sfx_play(sfx, snd)


sfx_update(sfx, x, y)
