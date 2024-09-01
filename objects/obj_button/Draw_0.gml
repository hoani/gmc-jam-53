/// @description Insert description here
// You can write your code in this editor

if !visible {
	exit
}

var _col = c_gray
if hover {
	_col = c_white
}



draw_sprite_ext(sprite_index, image_index, x, y, obj_camera.scale, obj_camera.scale, 0, _col, image_alpha)
