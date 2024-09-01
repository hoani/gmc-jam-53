/// @description Insert description here
// You can write your code in this editor


if joint != -1 {
	var _c =  c_white;
	
	if gamestate() == STATE_BUILD {
		_c = BUILD_C_JOIN
		if obj_build.delete_detector.candidate == id {
			_c = BUILD_C_DELETE	
		}
	}
	
	draw_joint(image_angle, circles, joint, _c)
}
