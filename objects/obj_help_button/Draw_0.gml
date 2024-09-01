/// @description Insert description here
// You can write your code in this editor

if !visible {
	exit
}

var _col = c_gray

if hover {
	_col = c_white
}



draw_sprite_ext(sprite_index, 0, x, y, obj_camera.scale, obj_camera.scale, 0, _col, image_alpha)

if hover {
	draw_sprite_ext(spr_help, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), obj_camera.scale, obj_camera.scale, 0, c_white, image_alpha)
}



