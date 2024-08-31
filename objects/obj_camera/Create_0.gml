/// @description Insert description here
// You can write your code in this editor

camera_init(0)

assigned = {
	inst: noone,
	xoff: 0,
	yoff: 0,
}


camera = camera_create_view(0, 0, room_width, room_height)
view_set_camera(0, camera);