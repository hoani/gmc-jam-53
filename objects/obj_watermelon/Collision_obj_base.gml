/// @description Insert description here
// You can write your code in this editor

physics_apply_force(x, y, -phy_speed_x/64, 0)

if gamestate() != STATE_RUN {
	exit
}

score_transition()

// Split logic.

var _impact = abs(phy_speed_y);

if _impact < 2 {
	exit // do nothing and continue existing.
}

var _parts = _impact/16;

function create_smash(_obj, _struct) {
	_struct.phy_speed_x = sign(phy_speed_x) + random(abs(phy_speed_x)*1.5)
	_struct.phy_speed_y = 2*phy_speed_y + (1-random(2))

	var _x = x + (random(1) - 2) *4;
	var _y = room_height - FLOOR_HEIGHT + (random(1) - 2) *4;
	instance_create(_x, _y, _obj, _struct)
}

if _impact < 3 {
	create_smash(obj_smash_large, {image_index: 0})
	create_smash(obj_smash_large, {image_index: 1})
} else if _impact < 5 {
	create_smash(obj_smash_large, {image_index: irandom(2)})
	create_smash(obj_smash_medium, {image_index: irandom(4)})
	create_smash(obj_smash_medium, {image_index: irandom(4)})
} else if _impact < 6 {
	create_smash(obj_smash_medium, {image_index: irandom(4)})
	create_smash(obj_smash_medium, {image_index: irandom(4)})
	create_smash(obj_smash_medium, {image_index: irandom(4)})
	create_smash(obj_smash_medium, {image_index: irandom(4)})
} else if _impact < 8 {
	create_smash(obj_smash_medium, {image_index: irandom(4)})
	create_smash(obj_smash_medium, {image_index: irandom(4)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
} else {
	create_smash(obj_smash_small, {image_index: irandom(8)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
	create_smash(obj_smash_small, {image_index: irandom(8)})
}




emit_smash_particles(phy_speed_x, phy_speed_y)

visible = false