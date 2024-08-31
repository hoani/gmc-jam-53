/// @description Insert description here
// You can write your code in this editor

render_flags = phy_debug_render_shapes | phy_debug_render_joints | phy_debug_render_coms | phy_debug_render_obb;


physics_world_create(1/PIXELS_PER_METER);
//physics_world_gravity(0, 0);
physics_world_gravity(0, 9.8);
physics_world_update_iterations(20);
physics_world_update_speed(60);

var _fix_floor = physics_fixture_create();
physics_fixture_set_box_shape(_fix_floor, room_width*2, 16);
physics_fixture_set_kinematic(_fix_floor);
physics_fixture_set_friction(_fix_floor, 1);

game_floor = instance_create(room_width/2, room_height-32, obj_base)
physics_fixture_bind(_fix_floor, game_floor);
physics_fixture_delete(_fix_floor);

watermelon = add_watermelon(room_width/2-8, 380, 16)


setup_camera = false

paused = true
physics_pause_enable(true)

paused = true

show_physics = true

xmax = 0
ymax = 0

