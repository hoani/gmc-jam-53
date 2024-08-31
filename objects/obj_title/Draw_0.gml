/// @description Insert description here
// You can write your code in this editor

var _yoff = 0;

if state.current == TITLE_END {
	_yoff = state.step
}

draw_sprite_alpha(spr_title, 0, room_width/2, y-_yoff*8, image_alpha)

draw_sprite_alpha(spr_credits, 0, room_width/2, y + 480+_yoff, image_alpha)

