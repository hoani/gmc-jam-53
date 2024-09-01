/// @description Insert description here
// You can write your code in this editor

render_flags = phy_debug_render_shapes | phy_debug_render_joints | phy_debug_render_coms | phy_debug_render_obb;


physics_init()

instance_create_ui(room_width/2, room_height/2, obj_restart_button, {
	enabled_state: STATE_SCORE,
	callback: physics_reset_world,
})

instance_create_ui(128, room_height - 48, obj_start_button, {
	enabled_state: STATE_BUILD,
	callback: function() { gamestate_set(STATE_RUN) },
})

paused = true

show_physics = false

xmax = 0
ymax = 0

canvas = canvas_init()
