// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_joint(_x, _y) {
	var _inst = collision_point(_x, _y, obj_line, false, true)
	if _inst != noone {
		if check_joint_line(_inst, _x, _y) {
			return _inst
		}
	}
	return noone
}

function check_joint_line(_inst, _x, _y) {
	var _p = get_line_points(_inst.x, _inst.y, _inst.length, -_inst.phy_rotation)
	var _vp = closest_point_on_line(_x, _y, _p.x0, _p.y0, _p.x1, _p.y1);

	return point_distance(_x, _y, _vp.x, _vp.y) < BUILD_JOINT_DISTANCE 
}
