/// @description Insert description here
// You can write your code in this editor


function draw_joint_candidate() {
	var _inst = get_joint(mouse_x, mouse_y)
	if _inst != noone {
		
		var _p = get_line_points(_inst.x, _inst.y, _inst.length, -_inst.phy_rotation)
		var _vp = closest_point_on_line(mouse_x, mouse_y, _p.x0, _p.y0, _p.x1, _p.y1);

		if check_joint_line(_inst, mouse_x, mouse_y) {
			draw_circle_color(_vp.x, _vp.y, 10, c_lime, c_lime, false)
		}
	}
}

if state == BUILD_STATE_DRAG {
	switch selection {
		case BUILD_LINE:
			var _length = point_distance(x0, y0, mouse_x, mouse_y)
			var _angle = point_direction(x0, y0, mouse_x, mouse_y)
			var _lines = init_lines(_length, 0.25);
			draw_lines((x0 + mouse_x)/2, (y0 + mouse_y)/2, _length, _angle, _lines, c_aqua)
			
			if obj0 != noone {
				var _circles = init_circles(8, 1);
				draw_circles(x0, y0, 8, _angle, _circles, c_lime)
				
				if _length > BUILD_JOINT_DISTANCE {
					draw_joint_candidate()
				}
			}
		break;
		case BUILD_CIRCLE:
			var _r = point_distance(x0, y0, mouse_x, mouse_y)
			draw_circle_color(x0, y0, _r, c_aqua, c_aqua, false)
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