/// @description Insert description here
// You can write your code in this editor


state_update(state)

if state.current == TITLE_END {
	image_alpha = 1 - state.step/TITLE_FADE_PER_STEP	
	
	if image_alpha <= 0 {
		instance_destroy()
	}
}