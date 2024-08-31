/// @description Insert description here
// You can write your code in this editor

if !visible {
	exit
}

var _col = c_gray
if hover {
	_col = c_white
}

var _alpha = image_alpha


draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, _col, _alpha)