/// @description Insert description here
// You can write your code in this editor


function draw_joint_candidate() {
	if detector.candidate != noone {
		var _vp = detector.position;
		
		draw_circle_color(_vp.x, _vp.y, 10, c_lime, c_lime, false)
	}
}

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

if state == BUILD_STATE_DRAG {
	var _length = point_distance(x0, y0, mouse_x, mouse_y)
	var _angle = point_direction(x0, y0, mouse_x, mouse_y)
			
	switch selection {
		case BUILD_LINE:
			
			var _lines = init_lines(_length, 0.25);
			draw_lines((x0 + mouse_x)/2, (y0 + mouse_y)/2, _length, _angle, _lines, c_aqua)
			
			if obj0 != noone {
				var _circles = init_circles(8, 1);
				draw_circles(x0, y0, 8, _angle, _circles, c_lime)	
			}
			
			if _length > BUILD_JOINT_DISTANCE {
				draw_joint_candidate()
			}
		break;
		case BUILD_CIRCLE:
			var _r = point_distance(x0, y0, mouse_x, mouse_y)
			draw_circle_color(x0, y0, _r, c_aqua, c_aqua, false)
			
			if _length > BUILD_JOINT_DISTANCE {
				draw_joint_candidate()
			}
		break;
	}
} else {
	draw_joint_candidate()
}

switch selection {
	case BUILD_LINE:
		draw_text(0, room_height-48, "line")
	break;
	case BUILD_CIRCLE:
		draw_text(0, room_height-48, "circle")
	break;
}