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
	if gamestate() == STATE_BUILD {
		draw_circles_build(_x, _y, _radius, _angle, _circles, _c)
	} else {
		draw_circles_play(_x, _y, _radius, _angle, _circles, _c)
	}
}

function draw_circles_build(_x, _y, _radius, _angle, _circles, _c) {
	var _dx = dcos(_angle);
	var _dy = dsin(-_angle);
		
	for (var _i = 0; _i < array_length(_circles.outline); _i++) {
		var _offsets = _circles.outline[_i];
		var _circle_radius = _offsets.radius + _radius;
		
		
		draw_circle_color(global.drawx + _x + _dx*_offsets.dx, global.drawy + _y + _dy*_offsets.dy, _circle_radius, _c, _c, true)		
		draw_circle_color(global.drawx + _x + _dx*_offsets.dx, global.drawy + _y + _dy*_offsets.dy, _circle_radius-1, _c, _c, true)

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

function draw_circles_play(_x, _y, _radius, _angle, _circles, _c) {
	var _dx = dcos(_angle);
	var _dy = dsin(-_angle);
	
	_x = global.drawx + _x;
	_y = global.drawy + _y;
	
	var _c0 = #bbaa11;
	var _c1 = #997711;	
	var _c2 = #554406;

	if _c != c_white {
		_c0 = merge_color(_c0, _c, 0.5);
		_c1 = merge_color(_c1, _c, 0.5);
		_c2 = merge_color(_c1, _c, 0.5);	

	}
	draw_circle_color(_x, _y, _radius, _c0, _c0, false)
	var _roff = (_radius/16)
	draw_circle_color(_x-_dx*_roff, _y-_dy*_roff, _radius-_roff, _c1, _c1, false)
		
	draw_ellipse_color(_x - _radius*0.625, _y-_radius*0.75, _x + _radius*0.625, _y+_radius*0.25, _c0, _c0, false)
	var _scale = (_radius*2) / sprite_get_width(spr_circle_texture)
	draw_sprite_ext(spr_circle_texture, 0, _x, _y, _scale, _scale, _angle + _circles.fill[0].angle,_c2 , 0.25)
	draw_circle_color(_x, _y, _radius, c_black, c_black, true)
}


function draw_watermelon(_x, _y, _angle, _c) {
	var _r = sprite_get_width(spr_watermelon)/2;
	_x = global.drawx + _x;
	_y = global.drawy + _y;
	if gamestate() == STATE_BUILD {
		draw_sprite_ext(spr_watermelon, 0, _x, _y, 1, 1, _angle, _c, 1)	
		draw_sprite_ext(spr_watermelon, 1, _x, _y, 1, 1, _angle, _c, 1)
	} else {
		var _dx = dcos(_angle);
		var _dy = dsin(-_angle);
	
		var _c0 = #11aa11;
		var _c1 = #117711;
		var _c2 = #114422;
		if _c != c_white {
			_c0 = merge_color(_c0, _c, 0.5);
			_c1 = merge_color(_c1, _c, 0.5);	
			_c2 = merge_color(_c2, _c, 0.5);	
		}
		draw_circle_color(_x, _y, _r, _c0, _c0, false)
		draw_circle_color(_x-_dx, _y-_dy, _r-1, _c1, _c1, false)
		
		draw_ellipse_color(_x - 8, _y-8, _x + 6, _y+2, _c0, _c0, false)
		draw_sprite_ext(spr_watermelon, 0, _x, _y, 1, 1, _angle,_c2 , 1)	
		draw_circle_color(_x, _y, _r, c_black, c_black, true)
	}
}

function draw_rounded_line(_x0, _y0, _x1, _y1, _w, _c){
	draw_rounded_line2(_x0, _y0, _x1, _y1, _w, _c, _c)
}

function draw_rounded_line2(_x0, _y0, _x1, _y1, _w, _c1, _c2){
	_x0 += global.drawx
	_y0 += global.drawy
	_x1 += global.drawx
	_y1 += global.drawy
	draw_line_width_color(_x0, _y0, _x1, _y1, _w, _c1, _c2)
	//draw_circle_color(_x0, _y0, _w/2, _c1, _c1, false)
	//draw_circle_color(_x1, _y1, _w/2, _c2, _c2, false)
}