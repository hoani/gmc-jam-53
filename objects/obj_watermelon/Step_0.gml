/// @description Insert description here
// You can write your code in this editor

var _ym = (ystart - y) / PIXELS_PER_METER;
ymax = max(ymax, _ym)
	

if place_meeting(x, y + abs(phy_speed_y), obj_physics.game_floor) {
	gamestate_set(STATE_SCORE)
	assign_camera(obj_camera, noone)
	obj_physics.xmax = (x - xstart)/PIXELS_PER_METER
	obj_physics.ymax = ymax
}

