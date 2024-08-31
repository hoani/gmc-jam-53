/// @description Insert description here
// You can write your code in this editor


var _c = c_white

if stop_detection_warning(sd) {
	_c = c_red	
}

if sd.stopped {
	_c = c_ltgray
}

draw_circles(x, y, radius, -phy_rotation, circles, _c)