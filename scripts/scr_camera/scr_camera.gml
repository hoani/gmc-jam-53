// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function camera_init(_view){
	assigned = {
		inst: noone,
		xoff: 0,
		yoff: 0,
	}

	camera = camera_create_view(0, 0, room_width, room_height)
	view_set_camera(0, camera);
}

function assign_camera(_camera, _inst) {
	_camera.assigned.inst = _inst
	_camera.assigned.xoff = _inst.x
	_camera.assigned.yoff = _inst.y
}