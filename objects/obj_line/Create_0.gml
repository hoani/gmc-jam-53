/// @description Line setup


if length > sprite_get_width(sprite_index) {	
	image_xscale = 0.5 + length/sprite_get_width(sprite_index)
	image_yscale = 1/8
}

lines = init_lines(length);
