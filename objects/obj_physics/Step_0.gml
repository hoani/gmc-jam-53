/// @description Insert description here
// You can write your code in this editor


var _paused = (gamestate() != STATE_RUN && gamestate() != STATE_SCORE )

if _paused != paused {
	physics_pause_enable(_paused)
	paused = _paused
}
	

if setup_camera = false {
	setup_camera = true
	assign_camera(obj_camera, watermelon)
	obj_background.x0 = obj_watermelon.xstart
}

if keyboard_check_pressed(ord("Q")) {
	show_physics = !show_physics
}

if gamestate() != STATE_SCORE {
	game_floor.phy_position_x = watermelon.x
}

