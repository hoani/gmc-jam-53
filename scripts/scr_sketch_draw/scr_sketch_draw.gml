// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function init_lines(_length, _jitter = 0.5) {
	var _max_angle_offset = 1024/(_length + 1);
	_lines = [];

	for (var _i = 0; _i < 2; _i++) {
		 array_push(_lines, {
			angle: _jitter*(_max_angle_offset - 2*random(_max_angle_offset)),
			length: _jitter*(2 - random(4)),
			dx: _jitter*(2 - random(4)),
			dy: _jitter*(2 - random(4)),
		})
	}
	
	return _lines
}


function draw_lines(_x, _y, _length, _angle, _lines, _c) {
	for (var _i = 0; _i < array_length(_lines); _i++) {
		var _offsets = _lines[_i];
		var _line_length = _offsets.length + _length;
		var _line_angle = _angle + _offsets.angle;
	
		var _l = get_line_points(_x + _offsets.dx, _y + _offsets.dy, _line_length, _line_angle);

		draw_rounded_line(_l.x0, _l.y0, _l.x1, _l.y1, 2, _c)
	}
}

function init_circles(_radius, _jitter = 1) {
	var _max_radius_jitter = _radius/32 + 2.0;
	_circles = {
		outline: [],
		fill: []
	}

	for (var _i = 0; _i < 2; _i++) {
		 array_push(_circles.outline, {
			radius: _jitter*(_max_radius_jitter - 2*random(_max_radius_jitter)),
			dx: _jitter*(2 - random(4)),
			dy: _jitter*(2 - random(4)),
		})
	}
	
	var _last_angle = random(90);
	for (var _i = 0; _i < 2; _i++) {
		_last_angle += 80 + random(20)
		 array_push(_circles.fill, {angle: _last_angle})
	}
	
	return _circles
}


function draw_circles(_x, _y, _radius, _angle, _circles, _c) {
	var _dx = dcos(_angle);
	var _dy = dsin(-_angle);
		
	for (var _i = 0; _i < array_length(_circles.outline); _i++) {
		var _offsets = _circles.outline[_i];
		var _circle_radius = _offsets.radius + _radius;
		
		
		draw_circle_color(_x + _dx*_offsets.dx, _y + _dy*_offsets.dy, _circle_radius, _c, _c, true)		
		draw_circle_color(_x + _dx*_offsets.dx, _y + _dy*_offsets.dy, _circle_radius-1, _c, _c, true)

	}
	
	for (var _i = 0; _i < array_length(_circles.fill); _i++) {
		var _offsets = _circles.fill[_i];
		var _fill_angle = _angle + _offsets.angle;
		var _fx = dcos(_fill_angle);
		var _fy = dsin(-_fill_angle);
		for (var _r = 3; _r < _radius-6; _r += 6) {
			var _h = (7/8)*sqrt(_radius*_radius - _r*_r);
		
			var _x0 = _fx * _r - _fy * _h;
			var _y0 = _fy * _r + _fx * _h;
			var _x1 = _fx * _r + _fy * _h;
			var _y1 = _fy * _r - _fx * _h;
		
			draw_rounded_line(_x + _x0, _y + _y0, _x + _x1, _y + _y1, 2, _c)		
			draw_rounded_line(_x - _x0, _y - _y0, _x - _x1, _y - _y1, 2, _c)

		}
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