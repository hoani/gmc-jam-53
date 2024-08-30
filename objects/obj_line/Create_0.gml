/// @description Line setup


if length > sprite_get_width(sprite_index) {	
	image_xscale = length/sprite_get_width(sprite_index) 
}

lines = init_lines(length);
