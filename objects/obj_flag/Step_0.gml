/// @description Insert description here
// You can write your code in this editor

if image_alpha < 1 {
	image_alpha = min(image_alpha + 1/32, 1)
}


if gamestate() == STATE_BUILD {
	instance_destroy()
}