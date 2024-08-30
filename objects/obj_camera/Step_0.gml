/// @description Insert description here
// You can write your code in this editor


if assigned.inst != noone && instance_exists(assigned.inst) {
	// Follow logic.
	var _xoff = assigned.inst.x - assigned.xoff;
	var _yoff = min(assigned.inst.y - assigned.yoff, 0);
	camera_set_view_pos(view_camera[0], _xoff, _yoff);
}