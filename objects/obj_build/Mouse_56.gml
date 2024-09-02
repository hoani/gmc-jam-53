/// @description Insert description here
// You can write your code in this editor

if gamestate() != STATE_BUILD || state != BUILD_STATE_DRAG {
	exit
}

state = BUILD_STATE_IDLE
var _x1 = mouse_x
var _y1 = mouse_y

var _r = point_distance(x0, y0, _x1, _y1)

var _selection = selections[selection]

if !can_build(_selection, _r) {
	return	
}

function do_welds(_inst, _x1, _y1) {
	if obj0 != noone {
		var _x = (x0 + v0.x)/2;
		var _y = (y0 + v0.y)/2;
		if join0 == JOIN_TYPE_WELD {
			weld_objects(_inst, obj0, _x, _y)
		} else if join0 = JOIN_TYPE_REV {
			revolute_objects(_inst, obj0, _x, _y)
		}
	}
	var _obj1 = detector.candidate
	var _v1 = detector.position
	var _join1 = detector.join
	if _obj1 != obj0 && _obj1 != noone {
		var _x = (_x1 + _v1.x)/2;
		var _y = (_y1 + _v1.y)/2;
		if _join1 == JOIN_TYPE_WELD {
			weld_objects(_inst, _obj1, _x, _y)
		} else if _join1 = JOIN_TYPE_REV {
			revolute_objects(_inst, _obj1, _x1, _y1)
		}
	}
}

function do_revolute(_inst, _x, _y) {
	var _obj1 = detector.candidate
	if _obj1 != noone {
		revolute_objects(_inst, _obj1, _x, _y)
	}
}

var _inst = noone
switch _selection.material {
	case MATERIAL_LINE:
		_inst = add_line(x0, y0, _x1, _y1);
		do_welds(_inst, _x1, _y1)
		break;
	case MATERIAL_SCAFFOLDING:
		_inst = add_scaffold(x0, y0, _x1, _y1);
		do_welds(_inst, _x1, _y1)
		break;
	case MATERIAL_BALL:
		_inst = add_ball(x0, y0, _r);
		do_welds(_inst, _x1, _y1)
		break;
	case MATERIAL_ANCHOR:
		obj0 = noone // Do not weld to obj0.
		_inst = add_anchor(_x1, _y1);
		do_welds(_inst, _x1, _y1)
		break;
	case MATERIAL_PEG:
		obj0 = noone // Do not weld to obj0.
		_inst = add_peg(_x1, _y1);
		do_welds(_inst, _x1, _y1)
		break;
	case MATERIAL_SHELF:
		obj0 = noone // Do not weld to obj0.
		_inst = add_shelf(x0, _x1, _y1);
		break;
	case MATERIAL_WHEEL:
		obj0 = noone // Do not weld to obj0.
		_inst = add_wheel(_x1, _y1);
		do_revolute(_inst, _x1, _y1)
		
		break;
	default:
		return
}

materials[_selection.material].count--

