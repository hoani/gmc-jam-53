/// @description Insert description here
// You can write your code in this editor

render_flags = phy_debug_render_shapes | phy_debug_render_joints | phy_debug_render_coms | phy_debug_render_obb;


physics_world_create(1/128); // 128 pixels per meter.
physics_world_gravity(0, 9.8);
physics_world_update_iterations(20);
physics_world_update_speed(60);

var _fix_floor = physics_fixture_create();
physics_fixture_set_box_shape(_fix_floor, room_width*1000/2, 16);
physics_fixture_set_kinematic(_fix_floor);
physics_fixture_set_restitution(_fix_floor, 0.8);
physics_fixture_bind(_fix_floor, instance_create(room_width/2, room_height-32, obj_base));
physics_fixture_delete(_fix_floor);


add_ball(450, 432, 32)
add_line(100, 400, 800, 400);
//add_line(100, 200, 200, 300);
add_line(900, 100, 900, 300);

add_ball(240, 380, 16)
add_ball(600, -800, 32)






physics_pause_enable(true)

paused = true

