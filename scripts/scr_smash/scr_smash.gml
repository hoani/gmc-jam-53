// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function emit_smash_particles(_spdx, _spdy, _amount=1) {
	var _spd = point_distance(0, 0, _spdx, _spdy)
	for (var _i = 0; _i < _spd*2*_amount; _i++) {
		var _x = x + (random(1) - 2) *4;
		var _y =  room_height - FLOOR_HEIGHT - random(8);

		instance_create(_x, _y, obj_smash_particle, {
			hspeed: _spdx*(random(1)-0.25),
			vspeed: _spdy*(0.25 + random(0.75)),
		})
	}
	for (var _i = 0; _i < _spd*2*_amount; _i++) {
		var _x = x + (random(1) - 2) *4;
		var _y =  room_height - FLOOR_HEIGHT - random(8);

		instance_create(_x, _y, obj_smash_particle, {
			hspeed:  0.5*abs(_spd)*(random(1) - 0.5),
			vspeed: _spdy*(0.25 + random(0.75))*0.5,
		})
	}
}
