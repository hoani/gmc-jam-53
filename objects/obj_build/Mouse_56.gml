/// @description Insert description here
// You can write your code in this editor

state = BUILD_STATE_IDLE
var _x1 = mouse_x
var _y1 = mouse_y

var _r = point_distance(x0, y0, _x1, _y1)

if _r < 32 {
	return	
}

switch selection {
	case BUILD_LINE:
		var _obj1 = detector.candidate
		var _line = add_line(x0, y0, _x1, _y1);
		if obj0 != noone {
			weld_objects(_line, obj0, x0, y0)
		}
		if _obj1 != obj0 && _obj1 != noone {
			weld_objects(_line, _obj1, _x1, _y1)
		}
		break;
	case BUILD_CIRCLE:
		var _r = point_distance(x0, y0, _x1, _y1)
		add_ball(x0, y0, _r);
		break;
}
