// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_sprite_alpha(_spr, _img, _x, _y, _alpha){
	draw_sprite_ext(_spr, _img, global.drawx + _x, global.drawy +  _y, 1, 1, 0, c_white, _alpha)
}

function draw_rectangle_rotated(_x, _y, _w, _h, _angle, _c, _outline) {
	var _p = get_rectangle_points(_x, _y, _w, _h, _angle)
	if _outline {
		draw_rounded_line(_p.x0, _p.y0, _p.x1, _p.y1, 1, _c)
		draw_rounded_line(_p.x1, _p.y1, _p.x2, _p.y2, 1, _c)	
		draw_rounded_line(_p.x2, _p.y2, _p.x3, _p.y3, 1, _c)	
		draw_rounded_line(_p.x3, _p.y3, _p.x0, _p.y0, 1, _c)	
	} else {
		draw_triangle_color(
			global.drawx +_p.x0, global.drawy +_p.y0, 
			global.drawx +_p.x2, global.drawy +_p.y2, 
			global.drawx +_p.x1, global.drawy +_p.y1, 
			_c, _c, _c, false);
		draw_triangle_color(
			global.drawx +_p.x0, global.drawy +_p.y0, 
			global.drawx +_p.x2, global.drawy +_p.y2, 
			global.drawx +_p.x3, global.drawy +_p.y3, 
			_c, _c, _c, false);
	}
}

function draw_world_sprite() {
	draw_sprite_ext(sprite_index, image_index, global.drawx + x, global.drawy + y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}
