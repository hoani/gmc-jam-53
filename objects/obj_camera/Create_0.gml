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


#macro ZOOM_MIN 1
#macro ZOOM_MAX 2
#macro MIN_ZOOM_SPEED 8
#macro ZOOM_SCALING 1/8
#macro CAMERA_MAX_SPEED 64

default_zoom_width = camera_get_view_width(view_camera[0]);
default_zoom_height = camera_get_view_height(view_camera[0]);

scale = 1
xoff = 0
yoff = 0
camera_speed = 0

left_scroll = false
right_scroll = false
up_scroll = false
down_scroll = false


