// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function canvas_init() {
	
	
	return {
		current: -1,
		previous: canvas_new(),
	}
}


function canvas_new(){
	return surface_create(room_width*ZOOM_MAX, room_height*ZOOM_MAX)
}

function canvas_assign(_canvas) {
	if !surface_exists(_canvas.current) {
		_canvas.current = canvas_new()
	}
	surface_set_target(_canvas.current)
	global.drawx = -camera_get_view_x(view_camera[0])
	global.drawy = -camera_get_view_y(view_camera[0])
}

function canvas_draw(_canvas) {
	surface_reset_target()
	
	draw_surface_part(_canvas.current, 0, 0, room_width*obj_camera.scale, room_height*obj_camera.scale, -global.drawx, -global.drawy)
	
	global.drawx = 0
	global.drawy = 0
}