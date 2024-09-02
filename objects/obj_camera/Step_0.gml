/// @description Insert description here
// You can write your code in this editor

#macro CAMERA_MOVE_THRESHOLD 24


var _zoom = ZOOM_MIN 
if gamestate() == STATE_RUN {
	var _mspd = max(abs(obj_watermelon.phy_speed_x), abs(obj_watermelon.phy_speed_y))
	if _mspd > MIN_ZOOM_SPEED {
		_zoom = clamp(ZOOM_MIN + (_mspd - MIN_ZOOM_SPEED)*ZOOM_SCALING, ZOOM_MIN, ZOOM_MAX)
	}
}

var _view_x = camera_get_view_x(view_camera[0]);
var _view_y = camera_get_view_y(view_camera[0]);
var _view_w = camera_get_view_width(view_camera[0]);
var _view_h = camera_get_view_height(view_camera[0]);

if gamestate() == STATE_RUN || gamestate() == STATE_SCORE || gamestate() == STATE_RESTART {
	//Get current size
	
	//Set the rate of interpolation
	var _rate = 1/64;
	//Get new sizes by interpolating current and target zoomed size
	var _new_w = lerp(_view_w, _zoom * default_zoom_width, _rate);
	var _new_h = lerp(_view_h, _zoom * default_zoom_height, _rate);

	if abs(_new_w - default_zoom_width) < 2 {
		_new_w = default_zoom_width
		_new_h = default_zoom_height
	}

	//Apply the new size
	camera_set_view_size(view_camera[0], _new_w, _new_h);

	scale = _new_w/default_zoom_width; // This is a helper for UI elements to determine where to place draws.


	if instance_exists(assigned.inst) {
		var _max_spd = CAMERA_MAX_SPEED * _zoom;
		var _dx = xoff - (assigned.inst.x - assigned.xoff);
		var _dy = yoff - min(0, (assigned.inst.y - assigned.yoff)/(sqrt(scale)));
	
		camera_speed = lerp(camera_speed, min(max(abs(_dx), abs(_dy)), _max_spd), 1)
	
		// Follow logic.
		xoff += clamp(-_dx, -camera_speed, camera_speed)
		yoff += clamp(-_dy, -camera_speed, camera_speed)

	} 
	var _xoff = xoff - (_new_w - default_zoom_width)/2;
	var _yoff = yoff - (_new_h - default_zoom_height);
	camera_set_view_pos(view_camera[0], floor(_xoff), floor(_yoff));
}


left_scroll = false
right_scroll = false
up_scroll = false
down_scroll = false

if gamestate() == STATE_BUILD {
	
	var _centered_y = mouse_y == clamp(mouse_y, _view_y + 0.25*_view_h, _view_y + 0.75*_view_h);
	var _centered_x = mouse_x == clamp(mouse_x, _view_x + 0.25*_view_w, _view_x + 0.75*_view_w);
	
	if _centered_y {
		if mouse_x < (_view_x + CAMERA_MOVE_THRESHOLD) {
			var _d = mouse_x - _view_x;
			xoff -= 0.125*CAMERA_MAX_SPEED/min(1, _d);
			left_scroll = true
		}
		if mouse_x > (_view_x + _view_w - CAMERA_MOVE_THRESHOLD) {
			var _d = (_view_x + _view_w) - mouse_x;
			xoff += 0.125*CAMERA_MAX_SPEED/min(1, _d);
			right_scroll = true
		}
	}
	
	if _centered_x {
		if mouse_y < (_view_y + CAMERA_MOVE_THRESHOLD) {
			var _d = mouse_y - _view_y;
			yoff -= 0.125*CAMERA_MAX_SPEED/min(1, _d);
			up_scroll = true
		}
		if mouse_y > (_view_y + _view_h - CAMERA_MOVE_THRESHOLD) {
			var _d = (_view_y + _view_h) - mouse_y;
			yoff += 0.125*CAMERA_MAX_SPEED/min(1, _d);
			down_scroll = true
		}
	}
	
	
	var _axoff = 0;
	var _ayoff = 0;

	if instance_exists(assigned.inst) {
		_axoff = assigned.inst.x - assigned.xoff;
		_ayoff = assigned.inst.y - assigned.yoff;
	}
	
	xoff = clamp(xoff, _axoff-(room_width/2 - 64), _axoff+(room_width/2 - 64))	
	yoff = clamp(yoff, _ayoff-(room_height/2 - 64), min(0, _ayoff+(room_height/2 - 64)))

	camera_set_view_pos(view_camera[0], xoff, yoff);
	camera_set_view_size(view_camera[0], default_zoom_width, default_zoom_height);
	scale = 1;
}




