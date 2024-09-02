/// @description Draw line

var _c = c_white;

if gamestate() == STATE_BUILD {
	_c = BUILD_C_SCAFFOLDING
	if obj_build.delete_detector.candidate == id {
		_c = BUILD_C_DELETE	
	}
}
	
draw_scaffold(x, y, length, -phy_rotation, lines, _c)

//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, -phy_rotation, c_white, 1)
