/// @description Insert description here
// You can write your code in this editor

var _cam = view_get_camera(0)

var _x0 = camera_get_view_x(_cam) - ((camera_get_view_x(_cam) - x0) % PIXELS_PER_METER + PIXELS_PER_METER);
var _x1 = camera_get_view_x(_cam) + camera_get_view_width(_cam);
var _y0 = camera_get_view_y(_cam) - ((camera_get_view_y(_cam) - y0) % PIXELS_PER_METER+ PIXELS_PER_METER);
var _y1 = camera_get_view_y(_cam) + camera_get_view_height(_cam);

var _c_major = c_gray
var _c_minor = c_dkgray


if gamestate() == STATE_BUILD {
	draw_sprite_stretched(spr_blueprint, 0, global.drawx + _x0, global.drawy + _y0,  _x1 - _x0,  _y1 - _y0)
	_c_major = #8AB5DC
	_c_minor = #669CCC 
}


for (var _x = _x0; _x < _x1; _x += PIXELS_PER_METER) {
	var _m = (_x - x0) / PIXELS_PER_METER;
	var _c = _c_minor;
	if _m % 5 == 0 {
		_c = _c_major
	}
	draw_rounded_line( _x, _y0,_x, _y1, 1, _c)
}



for (var _y = _y0; _y < _y1; _y += PIXELS_PER_METER) {
	var _m = -((_y - y0)) / PIXELS_PER_METER;
	var _c = _c_minor;
	if _m % 5 == 0 {
		_c = _c_major
	}
	draw_rounded_line( _x0, _y,_x1, _y, 1, _c)
}

draw_set_font(fnt_measure) 
draw_set_color(c_ltgray)
draw_set_halign(fa_right)
draw_set_valign(fa_bottom)

if gamestate() == STATE_BUILD {
	

	for (var _x = _x0; _x < _x1; _x += PIXELS_PER_METER) {
		var _m = (_x - x0) / PIXELS_PER_METER;
		draw_text(global.drawx +_x, global.drawy + y0, $"{_m}m")
	}


	for (var _y = _y0; _y < _y1; _y += PIXELS_PER_METER) {
		var _m = -((_y - y0)) / PIXELS_PER_METER;
	
		if abs(_m) > 0.5 { // Don't draw zero.
			draw_text(global.drawx +x0, global.drawy +_y, $"{_m}m")
		}
	}
} else if gamestate() == STATE_SCORE {
	for (var _x = _x0; _x < _x1; _x += PIXELS_PER_METER) {
		var _m = (_x - x0) / PIXELS_PER_METER;
		draw_text(global.drawx +_x, camera_get_view_height(_cam) - FLOOR_HEIGHT*obj_camera.scale, $"{_m}m")
	}
	
}

draw_set_font(fnt_default) 
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
