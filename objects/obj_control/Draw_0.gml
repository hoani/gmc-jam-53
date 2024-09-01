/// @description Draw debug physics


canvas_draw(canvas)


if global.debug && show_physics {
	physics_world_draw_debug(render_flags);
}

var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);

if gamestate() == STATE_SCORE {
	
	

	draw_text(_x + room_width/2, _y+room_height/2, $"max distance: {xmax}")	
	draw_text(_x + room_width/2, _y+room_height/2+32, $"max height: {ymax}")
}

if gamestate() == STATE_BUILD {
	if obj_camera.left_scroll {
		draw_sprite_stretched(spr_edge_highlight, 0, _x, _y, 32, _h)
	}
	
	if obj_camera.right_scroll {
		draw_sprite_stretched(spr_edge_highlight, 1, _x + _w - 32, _y, 32, _h)
	}
	
	if obj_camera.up_scroll {
		draw_sprite_stretched(spr_edge_highlight, 2, _x, _y, _w,  32)
	}
	
	if obj_camera.down_scroll {
		draw_sprite_stretched(spr_edge_highlight, 3, _x, _y + _h - 32, _w,  32)
	}
}



