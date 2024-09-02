// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro GRAVITY 0.5
#macro MAX_YSPD 8
#macro PIXELS_PER_METER 128
#macro FLOOR_HEIGHT 32



function physics_init() {
	physics_world_create(1/PIXELS_PER_METER);
	physics_world_gravity(0, 9.8);
	physics_world_update_iterations(20);
	physics_world_update_speed(60);
	
	physics_new_world()
}

function physics_reset_world() {
	with (obj_control) {
		physics_destroy_world() 
		physics_new_world()
	
		physics_setup_camera()
		gamestate_set(STATE_RESTART)
	}
	
	with (obj_build) {
		materials = materials_init()
		selections = selections_init(materials)
	}
}


function physics_new_world() {
	var _fix_floor = physics_fixture_create();
	physics_fixture_set_box_shape(_fix_floor, room_width*2, FLOOR_HEIGHT);
	physics_fixture_set_kinematic(_fix_floor);
	physics_fixture_set_friction(_fix_floor, 1);

	game_floor = instance_create(room_width/2, room_height, obj_base)
	physics_fixture_bind(_fix_floor, game_floor);
	physics_fixture_delete(_fix_floor);

	watermelon = add_watermelon(room_width/2-8, 380, 16)


	camera_setup = false

	paused = true
	physics_pause_enable(true)	
}

function physics_destroy_world() {
	instance_destroy(obj_joint)
	instance_destroy(obj_joinable)
	instance_destroy(obj_base)
	instance_destroy(obj_watermelon)
}

function physics_setup_camera() {
	camera_setup = true
	assign_camera(obj_camera, watermelon)
	obj_background.x0 = watermelon.xstart
	obj_background.y0 = watermelon.ystart
	
}

function add_beam(_x0, _y0, _x1, _y1, _obj, _create) {
	var _fix = physics_fixture_create();
	var _x = (_x0 + _x1)/2;
	var _y = (_y0 + _y1)/2;
	var _dir = point_direction(_x0, _y0, _x1, _y1) 
	var _length = point_distance(_x0, _y0, _x1, _y1)

	physics_fixture_set_polygon_shape(_fix);
	physics_fixture_add_point(_fix, -_length/2, -2)
	physics_fixture_add_point(_fix, _length/2, -2)
	physics_fixture_add_point(_fix, _length/2, 2)
	physics_fixture_add_point(_fix, -_length/2, 2)

	physics_fixture_set_density(_fix, 0.5);
	physics_fixture_set_restitution(_fix, 0.8);
	
	physics_fixture_set_linear_damping(_fix, 1/128);
	
	
	var _inst = _create(_x, _y, _obj, {image_angle: _dir, length: _length})
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	_inst.phy_rotation = -_dir
	_inst.phy_fixed_rotation = false;
	show_debug_message("direction: {0}", _dir)
	
	_inst.phy_bullet = true;
	
	return _inst;
}


function add_line(_x0, _y0, _x1, _y1) {
	return add_beam(_x0, _y0, _x1, _y1, obj_line, instance_create);
}

function add_scaffold(_x0, _y0, _x1, _y1) {
	return add_beam(_x0, _y0, _x1, _y1, obj_scaffold, instance_create_back);
}


function add_ball(_x, _y, _r) {
	var _fix = physics_fixture_create();
	physics_fixture_set_circle_shape(_fix, _r);
	physics_fixture_set_density(_fix, 0.5);
	physics_fixture_set_restitution(_fix, 0.5);
	
	var _inst = instance_create(_x, _y, obj_circle, {radius: _r})
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	
	_inst.phy_bullet = true;
	return _inst;
}

function add_anchor(_x, _y) {
	var _fix = physics_fixture_create();
	physics_fixture_set_circle_shape(_fix, 8);
	physics_fixture_set_kinematic(_fix);
	
	var _inst = instance_create(_x, _y, obj_anchor)
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	
	return _inst
}

function add_peg(_x, _y) {
	var _fix = physics_fixture_create();
	physics_fixture_set_circle_shape(_fix, 8);
	physics_fixture_set_kinematic(_fix);
	
	var _inst = instance_create(_x, _y, obj_peg)
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	
	return _inst
}

function add_shelf(_x0, _x1, _y) {
	var _fix = physics_fixture_create();
	var _x = (_x0 + _x1)/2;
	var _dir = 0
	var _length = point_distance(_x0, _y, _x1, _y)

	physics_fixture_set_polygon_shape(_fix);
	physics_fixture_add_point(_fix, -_length/2, -8)
	physics_fixture_add_point(_fix, _length/2, -8)
	physics_fixture_add_point(_fix, _length/2, 8)
	physics_fixture_add_point(_fix, -_length/2, 8)

	physics_fixture_set_kinematic(_fix);
	
	var _inst = instance_create_back(_x, _y, obj_shelf, {image_angle: 0, length: _length})
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	
	return _inst;
}

function add_wheel(_x, _y) {

	var _fix = physics_fixture_create();
	physics_fixture_set_circle_shape(_fix, 32);
	physics_fixture_set_density(_fix, 0.25);
	physics_fixture_set_restitution(_fix, 0.75);
	
	var _inst = instance_create(_x, _y, obj_wheel)
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	
	return _inst
}


function add_bearing(_x, _y) {
	var _fix = physics_fixture_create();
	physics_fixture_set_circle_shape(_fix, 16);
	physics_fixture_set_density(_fix, 0.25);
	physics_fixture_set_restitution(_fix, 1/32);
	
	var _inst = instance_create(_x, _y, obj_bearing)
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	
	return _inst
}

function add_rocket(_x, _y, _dir) {
	var _fix = physics_fixture_create();

	physics_fixture_set_polygon_shape(_fix);
	physics_fixture_add_point(_fix, 0, -32)
	physics_fixture_add_point(_fix, 16, -16)
	physics_fixture_add_point(_fix, 16, 24)
	physics_fixture_add_point(_fix, -16, 24)
	physics_fixture_add_point(_fix, -16, -24)

	physics_fixture_set_density(_fix, 1);
	physics_fixture_set_restitution(_fix, 0.4);
	
	
	var _inst = instance_create(_x, _y, obj_rocket, {image_angle: _dir})
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	_inst.phy_rotation = -_dir
	_inst.phy_fixed_rotation = false;
	
	_inst.phy_bullet = true;
	
	return _inst;
}




function add_watermelon(_x, _y, _r) {
	var _fix = physics_fixture_create();
	physics_fixture_set_circle_shape(_fix, _r);
	physics_fixture_set_density(_fix, 0.5);
	physics_fixture_set_restitution(_fix, 0.25);
	
	var _inst = instance_create(_x, _y, obj_watermelon, {radius: _r})
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	
	_inst.phy_bullet = true;
	return _inst;
}

function weld_objects(_obj0, _obj1, _x, _y) {
	var _angle = _obj0.phy_rotation - _obj1.phy_rotation
	
	var _m = 180/10314; // Dont know what the hell this is... but whatever.

	var _weld = physics_joint_weld_create(_obj0, _obj1, _x, _y, degtorad(_angle*_m), 10, 0.01, false);
	var _ang = physics_joint_get_value(_weld, phy_joint_angle);
	physics_joint_set_value(_weld, phy_joint_angle, degtorad(_angle));
	//show_debug_message("weld angle at {0}, {1}, is  {2} - obj0: {3} obj1: {4}, angle {5}", _x, _y, _angle, _obj0.phy_rotation, _obj1.phy_rotation, _ang)
	var _join = instance_create(_x, _y, obj_joint, {joint: _weld})
	array_push(_obj0.joins, _join)
	array_push(_obj1.joins, _join)
}

function revolute_objects(_obj0, _obj1, _x, _y) {
	var _revolute = physics_joint_revolute_create(_obj0, _obj1, _x, _y, 0, 0, false, 0, 0, false, false)
	var _join = instance_create(_x, _y, obj_joint, {joint: _revolute})
	array_push(_obj0.joins, _join)
	array_push(_obj1.joins, _join)
}

