// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro MIN_LINE_LENGTH 24
#macro MIN_CIRCLE_RADIUS 16

#macro BUILD_C_JOIN #66eedd
#macro BUILD_C_LINE #dddddd

#macro BUILD_C_CANNOT_PLACE #ee4444
#macro BUILD_C_PLACE #88dd33
#macro BUILD_C_PLACE_JOIN #33dd88


function can_build(_selection, _length) {
	switch _selection {
		case BUILD_LINE:
			return _length > MIN_LINE_LENGTH
		case BUILD_CIRCLE:
			return _length > MIN_CIRCLE_RADIUS
	}
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
			
		switch _selection {
			case BUILD_LINE:
			
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
			case BUILD_CIRCLE:
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
		}
	} else {
		draw_joint_candidate(_detector)
	}

	switch _selection {
		case BUILD_LINE:
			draw_text(0, room_height-48, "line")
		break;
		case BUILD_CIRCLE:
			draw_text(0, room_height-48, "circle")
		break;
	}
}
