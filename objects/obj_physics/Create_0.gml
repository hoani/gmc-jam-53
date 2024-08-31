/// @description Insert description here
// You can write your code in this editor

render_flags = phy_debug_render_shapes | phy_debug_render_joints | phy_debug_render_coms | phy_debug_render_obb;


physics_init()

instance_create(room_width/2, room_height/2, obj_restart_button, {
	enabled_state: STATE_SCORE,
	callback: physics_reset_world,
})

paused = true

show_physics = true

xmax = 0
ymax = 0

