/// @description Insert description here
// You can write your code in this editor

if !visible {
	exit
}

var _col = c_gray

var _selected = index == obj_build.selection
var _selection = obj_build.selections[index];
var _material = obj_build.materials[_selection.material];

if _selected {
	_col = c_ltgray
}

if hover {
	_col = c_white
}

var _img = _selected ? 1 : 0;


draw_sprite_ext(sprite_index, _img, x, y, obj_camera.scale, obj_camera.scale, 0, _col, image_alpha)
draw_sprite_ext(spr_tool_icon, _selection.material, x, y, obj_camera.scale, obj_camera.scale, 0, _col, image_alpha)



draw_set_color(c_ltgray)
draw_set_font(fnt_tool_count)
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(x + 24, y + 26, string(_material.count))



if hover {
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	draw_set_alpha(0.5)
	draw_rectangle(x + 40, y - 40, x + 40 + 256, y + 40, false)
	draw_triangle(x + 32, y, x + 40, y - 40, x + 40, y + 40, false);
	draw_set_color(c_white);
	draw_set_alpha(1)
	
	draw_text(x + 48, y, _material.description)
}


draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
