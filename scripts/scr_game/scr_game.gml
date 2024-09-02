// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


#macro WINDOW_SCALE 1

#macro STATE_TITLE 0
#macro STATE_BUILD 1
#macro STATE_RUN 2
#macro STATE_SCORE 3
#macro STATE_RESTART 4



function game_init(){
	if os_browser == browser_not_a_browser {
		window_set_size(room_width*WINDOW_SCALE, room_height*WINDOW_SCALE)
	}
	
	debug_init()
	gamespeed_init()
	global.state = new_state(STATE_TITLE)
	
	audio_init()
	
	init_mouseholder()
	
	music_start(snd_music_build)
	randomize(); 
	
	global.drawx = 0
	global.drawy = 0
}


function game_update() {
	mouseholder_update()	
	debug_update()
	
	
	music_update()
	
	if global.state.mono == 0 {
		update_game_music() 
		if gamestate() == STATE_BUILD || gamestate() == STATE_RUN {
			with(obj_control) {
				canvas_switch(canvas)
			}
		}
	}
	
	state_update(global.state)
}

function update_game_music() {
	switch gamestate() {
		case STATE_BUILD:
			if !audio_is_playing(snd_music_build) {
				music_start(snd_music_build)
			}
			break	
		case STATE_RUN:
			if !audio_is_playing(snd_music_run) {
				music_start(snd_music_run)
			}
			break
		case STATE_SCORE:
			music_stop()
			var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2
			var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2

			instance_create(_x, _y, obj_sfx, {snd: snd_score}) 
	}
}

function toggle_run_build() {
	switch gamestate() {
		case STATE_BUILD:
			gamestate_set(STATE_RUN);
			break;
		case STATE_RUN:
			gamestate_set(STATE_BUILD);
			break;
	}
}
