/// @description Insert description here
// You can write your code in this editor

if gamestate() == enabled_state {
	if global.state.mono > fade_out_frames { // Warm up first.
		visible = true
		image_alpha = min(image_alpha + 1/fade_in_frames, 1.0)
	}
} else if image_alpha > 0 {
	image_alpha = max(image_alpha - 1/fade_out_frames, 0.0)
} else {
	visible = false
}


if visible {

	x = camera_get_view_x(view_camera[0]) + xoff * obj_camera.scale;	
	y = camera_get_view_y(view_camera[0]) + yoff * obj_camera.scale;

	if image_alpha = 1.0 && position_meeting(mouse_x, mouse_y, self) && !disabled {
		hover = true
	} else {
		hover = false
	}
}
