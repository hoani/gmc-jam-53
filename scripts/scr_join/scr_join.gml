// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro JOIN_TYPE_WELD 0
#macro JOIN_TYPE_REV 1

function get_join_line(_inst, _x, _y) {
	var _p = get_line_points(_inst.x, _inst.y, _inst.length, -_inst.phy_rotation)
	var _vp = closest_point_on_line(_x, _y, _p.x0, _p.y0, _p.x1, _p.y1);
	
	return {
		join: JOIN_TYPE_WELD,
		success: point_distance(_x, _y, _vp.x, _vp.y) < BUILD_JOINT_DISTANCE ,
		position: _vp,
	}
}


function get_join_circle(_inst, _x, _y) {

	var _vp = closest_point_on_circle(_x, _y, _inst.x, _inst.y, _inst.radius);
	
	return {
		join: JOIN_TYPE_WELD,
		success: point_distance(_x, _y, _vp.x, _vp.y) < BUILD_JOINT_DISTANCE ,
		position: _vp,
	}
}

function get_join_wheel(_inst, _x, _y) {

	var _vp = closest_point_on_circle(_x, _y, _inst.x, _inst.y, 8);
	

	return {
		join: JOIN_TYPE_REV,
		success: point_distance(_x, _y, _vp.x, _vp.y) < BUILD_JOINT_DISTANCE,
		position: new Vector2(_inst.x, _inst.y),
	}
}

function get_join_bearing(_inst, _x, _y) {

	var _vp = closest_point_on_circle(_x, _y, _inst.x, _inst.y, 4);
	if point_distance(_x, _y, _vp.x, _vp.y) < BUILD_JOINT_DISTANCE {
		return {
			join: JOIN_TYPE_REV,
			success: true,
			position: new Vector2(_inst.x, _inst.y),
		}
	}
	
	return get_join_circle(_inst, _x, _y)
}

function get_join_anchor(_inst, _x, _y) {
	var _vp = closest_point_on_circle(_x, _y, _inst.x, _inst.y, 8);
	
	return {
		join: JOIN_TYPE_WELD,
		success: point_distance(_x, _y, _vp.x, _vp.y) < BUILD_JOINT_DISTANCE ,
		position: _vp,
	}
}

function get_join_rocket(_inst, _x, _y) {
	var _p = get_line_points(_inst.x, _inst.y, 32, -_inst.phy_rotation)
	var _vp = closest_point_on_line(_x, _y, _p.x0, _p.y0, _p.x1, _p.y1);
	
	return {
		join: JOIN_TYPE_WELD,
		success: point_distance(_x, _y, _vp.x, _vp.y) < BUILD_JOINT_DISTANCE,
		position: _vp,
	}
}

function get_join_noop(_inst, _x, _y) {
	return {
		join: -1,
		success: false,
		position: new Vector2(0, 0),
	}
}
