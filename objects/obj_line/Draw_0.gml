/// @description Draw line

var _c = gamestate() == STATE_BUILD ? BUILD_C_LINE : c_white;
draw_lines(x, y, length, -phy_rotation, lines, _c)

//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, -phy_rotation, c_white, 1)
