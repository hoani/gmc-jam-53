/// @description Draw debug physics

canvas_draw_start()
var _frac = 0;


function draw_blueprint_edge(_frac) {
	var _x = camera_get_view_x(view_camera[0]) + _frac*room_width*obj_camera.scale;	
	var _y0 = camera_get_view_y(view_camera[0]);
	var _y1 = _y0  + room_height*obj_camera.scale;
	
	var _xw = (1-_frac) * room_width/4;
	var _c0 = c_white;
	var _c1 = c_gray;

	draw_rectangle_color(_x - _xw, _y0, _x, _y1, _c0, _c0, _c1, _c1, false)
}


switch gamestate() {
case STATE_BUILD:

	if global.state.mono < 24 {
		canvas_draw_previous(canvas)
		_frac = min(1, global.state.mono/24);
		canvas_draw_current(canvas, _frac)
		draw_blueprint_edge(_frac)
		
	} else {
		canvas_draw_current(canvas)	
	}
	
	break;
case STATE_RUN: 
	canvas_draw_current(canvas)
	if global.state.mono < 24 {
		_frac = 1 - min(1, global.state.mono/24);
		canvas_draw_previous(canvas, _frac)
		draw_blueprint_edge(_frac)
	}
	
	break;
default:
	canvas_draw_current(canvas)
	break;
}

canvas_draw_end()


if global.debug && show_physics {
	physics_world_draw_debug(render_flags);
}

var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);

if gamestate() == STATE_SCORE {
	draw_set_font(fnt_score)
	draw_set_halign(fa_center)
	draw_set_valign(fa_bottom)
	

	draw_text(_x + _w/2, _y+0.5*_h, $"{string_format(xmax, 1, 1)}m")	
	
	draw_set_valign(fa_top)
	draw_set_font(fnt_default)
	draw_text(_x + _w/2, _y+0.5*_h, $"max height: {string_format(ymax, 1, 1)}m")
	
	
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
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



