/// @description Insert description here
// You can write your code in this editor

if setup_camera = false {
	setup_camera = true
	assign_camera(obj_camera, watermelon)
}

if keyboard_check_pressed(ord("Q")) {
	show_physics = !show_physics
}