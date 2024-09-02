/// @description Insert description here
// You can write your code in this editor

if gamestate() != STATE_RUN {
	exit 
}

var _ym = (ystart - y) / PIXELS_PER_METER;
ymax = max(ymax, _ym)

if stop_detection_update(sd, phy_speed_x, phy_speed_y) {
	score_transition()
}

