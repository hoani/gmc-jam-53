// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro GRAVITY 0.5
#macro MAX_YSPD 8




function add_line(_x0, _y0, _x1, _y1) {
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
	
	
	var _inst = instance_create(_x, _y, obj_line, {image_angle: _dir, length: _length})
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	_inst.phy_rotation = -_dir
	_inst.phy_fixed_rotation = false;
	show_debug_message("direction: {0}", _dir)
	
	_inst.phy_bullet = true;
	
	return _inst;
}


function add_ball(_x, _y, _r) {
	var _fix = physics_fixture_create();
	physics_fixture_set_circle_shape(_fix, _r);
	physics_fixture_set_density(_fix, 0.5);
	physics_fixture_set_restitution(_fix, 0.8);
	
	
	var _inst = instance_create(_x, _y, obj_base)
	physics_fixture_bind(_fix, _inst);
	physics_fixture_delete(_fix);
	
	_inst.phy_bullet = true;
	
	return _inst;
}