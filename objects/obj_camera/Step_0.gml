/// @description Insert description here
// You can write your code in this editor




var _zoom = ZOOM_MIN 
if gamestate() == STATE_RUN {
	var _mspd = max(abs(obj_watermelon.phy_speed_x), abs(obj_watermelon.phy_speed_y))
	if _mspd > MIN_ZOOM_SPEED {
		_zoom = clamp(ZOOM_MIN + (_mspd - MIN_ZOOM_SPEED)*ZOOM_SCALING, ZOOM_MIN, ZOOM_MAX)
	}
}
	
//Get current size
var _view_w = camera_get_view_width(view_camera[0]);
var _view_h = camera_get_view_height(view_camera[0]);
//Set the rate of interpolation
var _rate = 1/64;
//Get new sizes by interpolating current and target zoomed size
var _new_w = lerp(_view_w, _zoom * default_zoom_width, _rate);
var _new_h = lerp(_view_h, _zoom * default_zoom_height, _rate);
//Apply the new size
camera_set_view_size(view_camera[0], _new_w, _new_h);


if instance_exists(assigned.inst) {
	var _max_spd = CAMERA_MAX_SPEED * _zoom;
	var _dx = xoff - (assigned.inst.x - assigned.xoff);
	var _dy = yoff - (min(assigned.inst.y - assigned.yoff, 0))
	
	camera_speed = lerp(camera_speed, min(max(abs(_dx), abs(_dy)), _max_spd), 1)
	
	// Follow logic.
	xoff += clamp(-_dx, -camera_speed, camera_speed)
	yoff += clamp(-_dy, -camera_speed, camera_speed)

} 
var _xoff = xoff - (_new_w - default_zoom_width)/2;
var _yoff = yoff - (_new_h - default_zoom_height);
camera_set_view_pos(view_camera[0], _xoff, _yoff);


