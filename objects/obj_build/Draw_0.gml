/// @description Insert description here
// You can write your code in this editor




if gamestate() != STATE_BUILD {
	exit
}

build_draw(obj0, x0, y0, detector, state, selection)


if global.debug {
	if keyboard_check_pressed(ord("J")) {
		if detector.candidate != noone {
			var _vp = detector.position;
		
			draw_circle_color(_vp.x, _vp.y, 10, c_red, c_red, true)	
			show_debug_message("candidate at {0} {1}", _vp.x, _vp.y)	
		} else {
			show_debug_message("no candidate")	
		}
	}
}
