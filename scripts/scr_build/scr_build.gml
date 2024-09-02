// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro MIN_SHELF_LENGTH 32
#macro MIN_LINE_LENGTH 24
#macro MIN_CIRCLE_RADIUS 16

#macro BUILD_C_JOIN #66eedd
#macro BUILD_C_LINE #dddddd
#macro BUILD_C_SCAFFOLDING #aaaaff


#macro BUILD_C_CANNOT_PLACE #ee4444
#macro BUILD_C_DELETE #ff2222
#macro BUILD_C_PLACE #88dd33
#macro BUILD_C_PLACE_JOIN #33dd88


function can_build(_selection, _length) {
	if materials[_selection.material].count <= 0 {
		return false
	}
	
	switch _selection.material {
		case MATERIAL_LINE:
		case MATERIAL_SCAFFOLDING:
			return _length > MIN_LINE_LENGTH
		case MATERIAL_BALL:
			return _length > MIN_CIRCLE_RADIUS
		case MATERIAL_ANCHOR:
		case MATERIAL_PEG:
		case MATERIAL_WHEEL:
		case MATERIAL_BEARING:
		case MATERIAL_ROCKET:
			return true
		case MATERIAL_SHELF:
			return _length > MIN_SHELF_LENGTH
	}
	
	return false
}


function draw_joint_candidate(_detector) {
	if _detector.candidate != noone {
		var _vp = _detector.position;
		
		var _circles = init_circles(10, 0.25);
		draw_circles(_vp.x, _vp.y, 10, 0, _circles, BUILD_C_PLACE_JOIN)
	}
}

function build_draw(_obj0, _x0, _y0, _detector, _state, _selection) {
	

	if _state == BUILD_STATE_DRAG {
		var _length = point_distance(_x0, _y0, mouse_x, mouse_y)
		var _angle = point_direction(_x0, _y0, mouse_x, mouse_y)
		
		var _can_build = can_build(_selection, _length);
		
		var _c_place = _can_build ? BUILD_C_PLACE : BUILD_C_CANNOT_PLACE;
			
		switch _selection.material {
		case MATERIAL_LINE:
		case MATERIAL_SCAFFOLDING:
			
				var _lines = init_lines(_length, 0.25);
				draw_lines((_x0 + mouse_x)/2, (_y0 + mouse_y)/2, _length, _angle, _lines, _c_place)
			
				if _obj0 != noone && _can_build {
					var _circles = init_circles(8, 1);
					draw_circles(_x0, _y0, 8, _angle, _circles, BUILD_C_PLACE_JOIN)	
				}
			
				if _length > BUILD_JOINT_DISTANCE && _can_build  {
					draw_joint_candidate(_detector)
				}
			break;
		case MATERIAL_BALL:
				var _r = point_distance(_x0, _y0, mouse_x, mouse_y)
				var _ccircles = init_circles(_r, 0.25);
				draw_circles(_x0, _y0, _r, _angle, _ccircles, _c_place)
				
				if _obj0 != noone && _can_build {
					var _circles = init_circles(8, 1);
					draw_circles(_x0, _y0, 8, _angle, _circles, BUILD_C_PLACE_JOIN)	
				}
			
				if _length > BUILD_JOINT_DISTANCE && _can_build  {
					draw_joint_candidate(_detector)
				}
			break;
		case MATERIAL_ANCHOR:
				var _acircles = init_circles(8, 0.25);
				draw_anchor(mouse_x, mouse_y,  _acircles, _c_place)
			
				if _can_build  {
					draw_joint_candidate(_detector)
				}
			break;
		case MATERIAL_PEG:
			var _pcircles = init_circles(8, 0.25);
			draw_peg(mouse_x, mouse_y,  _pcircles, _c_place)
			
			if _can_build  {
				draw_joint_candidate(_detector)
			}
			break;
		case MATERIAL_SHELF:
			var _slines = init_lines(_length, 0.25);
			draw_shelf((_x0 + mouse_x)/2, mouse_y, _length, _slines, _c_place)
			
			break;
		case MATERIAL_WHEEL:
			var _wcircles = init_circles(8, 0.25);
			draw_wheel(mouse_x, mouse_y, 0, _wcircles, _c_place)
			
			if _can_build {
				draw_joint_candidate(_detector)
			}
			break;
		case MATERIAL_BEARING:
			var _bcircles = init_circles(8, 0.25);
			draw_bearing(mouse_x, mouse_y, 0, _bcircles, _c_place)
			
			if _can_build {
				draw_joint_candidate(_detector)
			}
			break;
		case MATERIAL_ROCKET:
			draw_rocket(mouse_x, mouse_y, _angle, _c_place)
			
			if _can_build {
				draw_joint_candidate(_detector)
			}
			break;
		}
	}
	if _state == BUILD_STATE_IDLE {
		if _selection.material != MATERIAL_SHELF {
			draw_joint_candidate(_detector)
		}
	}
}
