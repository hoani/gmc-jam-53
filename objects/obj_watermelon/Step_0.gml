/// @description Insert description here
// You can write your code in this editor

if gamestate() != STATE_RUN {
	exit 
}

var _ym = (ystart - y) / PIXELS_PER_METER;
ymax = max(ymax, _ym)

if stop_detection_update(sd, phy_speed_x, phy_speed_y) {
	score_transition()
} else if phy_speed_y >= 0  {
	var _ybottom = (phy_position_y + phy_speed_y + 1 + FLOOR_HEIGHT + radius);
	if _ybottom >= obj_physics.game_floor.y {
		score_transition()
	}
}

