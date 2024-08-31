/// @description Draw debug physics

if global.debug && show_physics {
	physics_world_draw_debug(render_flags);
}

if gamestate() == STATE_SCORE {
	var _x = camera_get_view_x(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);

	draw_text(_x + room_width/2, _y+room_height/2, $"max distance: {xmax}")	
	draw_text(_x + room_width/2, _y+room_height/2+32, $"max height: {ymax}")
}
