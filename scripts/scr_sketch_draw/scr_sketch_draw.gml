// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function init_lines(_length) {
	var _max_angle_offset = 1024/(_length + 1);
	lines = [];

	for (var _i = 0; _i < 2; _i++) {
		 array_push(lines, {
			angle: _max_angle_offset - 2*random(_max_angle_offset),
			length: 2 - random(4),
			dx: 2 - random(4),
			dy: 2 - random(4),
		})
	}
	
	return lines
}


function draw_lines(_x, _y, _length, _angle, _lines, _c) {
	for (var _i = 0; _i < array_length(_lines); _i++) {
		var _offsets = _lines[_i];
		var _line_length = _offsets.length + _length;
		var _line_angle = _angle + _offsets.angle;
		var _dx = _line_length * dcos(_line_angle);
		var _dy = _line_length * dsin(-_line_angle);
	
		var _x0 = _x - _dx/2 + _offsets.dx;	
		var _y0 = _y - _dy/2 + _offsets.dy;
		var _x1 = _x + _dx/2 + _offsets.dx;	
		var _y1 = _y + _dy/2 + _offsets.dy;

		draw_rounded_line(_x0, _y0, _x1, _y1, 1, c_white)
	}
}

function draw_rounded_line(_x0, _y0, _x1, _y1, _w, _c){
	draw_rounded_line2(_x0, _y0, _x1, _y1, _w, _c, _c)
}

function draw_rounded_line2(_x0, _y0, _x1, _y1, _w, _c1, _c2){
	draw_line_width_color(_x0, _y0, _x1, _y1, _w, _c1, _c2)
	draw_circle_color(_x0, _y0, _w/2, _c1, _c1, false)
	draw_circle_color(_x1, _y1, _w/2, _c2, _c2, false)
}