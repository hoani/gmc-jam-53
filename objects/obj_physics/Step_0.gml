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
	if camera_get_view_x(view_camera[0]) < room_width/2 && obj_camera.camera_speed < 1 {
		gamestate_set(STATE_BUILD)	
	}
}


