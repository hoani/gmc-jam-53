/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if gamestate() != STATE_RUN {
	exit
}

has_fired = true

if countdown > 0 {
	countdown -= 1
	instance_create_back(x, y, obj_rocket_fire)
	physics_apply_local_force(-4, 0, engine_force, 0)
}