/// @description Draw circle


var _c = c_white;

if gamestate() == STATE_BUILD {
	_c = BUILD_C_LINE
	if obj_build.delete_detector.candidate == id {
		_c = BUILD_C_DELETE	
	}
}

draw_bearing(x, y, -phy_rotation, circles, _c)
