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
	draw_sprite_stretched(spr_blueprint, 0, _x0, _y0, _x1 - _x0, _y1 - _y0)
	_c_major = #8AB5DC
	_c_minor = #669CCC 
}


for (var _x = _x0; _x < _x1; _x += PIXELS_PER_METER) {
	var _m = (_x - x0) / PIXELS_PER_METER;
	var _c = _c_minor;
	if _m % 5 == 0 {
		_c = _c_major
	}
	draw_line_color(_x, _y0, _x, _y1, _c, _c)
	draw_text(_x, _y0+32, $"{_m}m")
}


for (var _y = _y0; _y < _y1; _y += PIXELS_PER_METER) {
	var _m = -((_y - y0)) / PIXELS_PER_METER;
	var _c = _c_minor;
	if _m % 5 == 0 {
		_c = _c_major
	}
	draw_line_color(_x0, _y, _x1, _y, _c, _c)
	draw_text(_x0 + 64, _y+32, $"{_m}m")
}
