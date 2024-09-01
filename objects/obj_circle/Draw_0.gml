/// @description Draw circle


var _c = gamestate() == STATE_BUILD ? BUILD_C_LINE : c_white;
draw_circles(x, y, radius, -phy_rotation, circles, _c)
