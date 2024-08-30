/// @description Insert description here
// You can write your code in this editor


if state == BUILD_STATE_DRAG {
	switch selection {
		case BUILD_LINE:
			var _length = point_distance(x0, y0, mouse_x, mouse_y)
			var _angle = point_direction(x0, y0, mouse_x, mouse_y)
			var _lines = init_lines(_length);
			draw_lines((x0 + mouse_x)/2, (y0 + mouse_y)/2, _length, _angle, _lines, c_aqua)
		break;
	}
}