/// @description Insert description here
// You can write your code in this editor

if gamestate() != STATE_BUILD {
	exit
}

candidate = noone

x = mouse_x
y = mouse_y

collision_circle_list(x, y, BUILD_JOINT_DISTANCE, obj_joinable, false, true, candidates, true);

if (!ds_list_empty(candidates)) {
	for (var _i = 0; _i < ds_list_size(candidates); _i++) {
		// The list is ordered, so we return the first successful join.
		var _c = ds_list_find_value(candidates, _i);
		var _j = _c.get_join(_c, x, y);
		if _j.success {
			candidate = _c
			position = _j.position
			break
		}
	}

	ds_list_clear(candidates)
}

