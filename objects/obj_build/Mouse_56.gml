/// @description Insert description here
// You can write your code in this editor

if gamestate() != STATE_BUILD || state != BUILD_STATE_DRAG {
	exit
}

state = BUILD_STATE_IDLE
var _x1 = mouse_x
var _y1 = mouse_y

var _r = point_distance(x0, y0, _x1, _y1)

if _r < 32 {
	return	
}

function do_welds(_inst, _x1, _y1) {
	if obj0 != noone {
		weld_objects(_inst, obj0, x0, y0)
	}
	var _obj1 = detector.candidate
	if _obj1 != obj0 && _obj1 != noone {
		weld_objects(_inst, _obj1, _x1, _y1)
	}
}

switch selection {
	case BUILD_LINE:
		var _line = add_line(x0, y0, _x1, _y1);
		do_welds(_line, _x1, _y1)
		break;
	case BUILD_CIRCLE:
		var _ball = add_ball(x0, y0, _r);
		do_welds(_ball, _x1, _y1)
		break;
}
