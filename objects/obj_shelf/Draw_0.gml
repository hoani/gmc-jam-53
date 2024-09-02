/// @description Draw line

var _c = c_white;

if gamestate() == STATE_BUILD {
	_c = BUILD_C_LINE
	if obj_build.delete_detector.candidate == id {
		_c = BUILD_C_DELETE	
	}
}

show_debug_message($"{length}")
	
draw_shelf(x, y, length, lines, _c)

//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, -phy_rotation, c_white, 1)
