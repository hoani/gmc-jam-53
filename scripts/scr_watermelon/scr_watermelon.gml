// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro STOP_DETECT_COUNT 120
#macro STOP_DETECT_WARN 16

function new_filter(_k) {
	return {
		value: undefined,
		k: _k,
	}
}

function update_filter(_filter, _v) {
	if _filter.value == undefined {
		_filter.value = _v
		return
	}
	
	_filter.value = ((1 - _filter.k) * _filter.value) + _filter.k * _v;
}

function new_stop_detection() {
	return {
		f: new_filter(1/32),
		stopped: false,
		count: 0,
	}
}

function stop_detection_update(_sd, _vx, _vy) {
	update_filter(_sd.f, point_distance(0, 0, _vx, _vy))
	
	if (_sd.f.value < 1/4) {
		_sd.count++	
	} else {
		_sd.count = 0
	}
	
	_sd.stopped = _sd.count > STOP_DETECT_COUNT;
	return _sd.stopped	
}

function stop_detection_warning(_sd) {
	if _sd.count > 0 {
		return (_sd.count % STOP_DETECT_WARN) < (0.75*_sd.count/(STOP_DETECT_COUNT/STOP_DETECT_WARN));
	}
	return false
}


function score_transition(){
	gamestate_set(STATE_SCORE)
	assign_camera(obj_camera, noone)
	obj_control.xmax = (x - xstart)/PIXELS_PER_METER
	obj_control.ymax = ymax
	instance_create(x, room_height - FLOOR_HEIGHT, obj_flag)
}