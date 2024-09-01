/// @description Insert description here
// You can write your code in this editor


var _paused = (gamestate() != STATE_RUN && gamestate() != STATE_SCORE )

if _paused != paused {
	physics_pause_enable(_paused)
	paused = _paused
}
	

if camera_setup = false {
	physics_setup_camera()
}

if keyboard_check_pressed(ord("Q")) {
	show_physics = !show_physics
}


game_floor.phy_position_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]/2)

if gamestate() == STATE_RESTART {
	if abs(camera_get_view_x(view_camera[0])) < room_width/2 && obj_camera.camera_speed < 4 {
		gamestate_set(STATE_BUILD)
		obj_camera.scale = 1
		obj_camera.xoff = 0
		obj_camera.yoff = 0
		obj_camera.camera_speed = 0
		camera_set_view_size(view_camera[0], obj_camera.default_zoom_width, obj_camera.default_zoom_height);
	}
}


