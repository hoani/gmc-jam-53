/// @description Insert description here
// You can write your code in this editor

var _cam = view_get_camera(0)

var _x0 = camera_get_view_x(_cam) - ((camera_get_view_x(_cam) - x0) % PIXELS_PER_METER);
var _x1 = camera_get_view_x(_cam) + view_wport[0];
var _y0 = camera_get_view_y(_cam);
var _y1 = camera_get_view_y(_cam) + view_hport[0];




for (var _x = _x0; _x < _x1; _x += PIXELS_PER_METER) {
	var _m = (_x - x0) / PIXELS_PER_METER;
	var _c = c_dkgray;
	if _m % 10 == 0 {
		_c = c_gray
	}
	draw_line_color(_x, _y0, _x, _y1, _c, _c)
	draw_text(_x, _y0+32, $"{_m}m")
}
