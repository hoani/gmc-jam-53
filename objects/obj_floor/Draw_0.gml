/// @description Insert description here
// You can write your code in this editor

var _cam = view_get_camera(0)

var _x0 = camera_get_view_x(_cam) - (camera_get_view_x(_cam) % 32 + 32);
var _x1 = camera_get_view_x(_cam) + camera_get_view_width(_cam) + 32;
var _y0 = room_height - FLOOR_HEIGHT;
var _y1 = camera_get_view_y(_cam) + camera_get_view_height(_cam);

var _c = c_white;

if _y1 >= _y0 {
	draw_rounded_line(_x0, _y0, _x1, _y0, 4, _c)

	for (var _x = _x0; _x < _x1; _x += 32) {
		draw_rounded_line(_x, _y0, _x-32, _y0+32, 2, _c)
	}
}
