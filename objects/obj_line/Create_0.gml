/// @description Line setup
event_inherited()

if length > sprite_get_width(sprite_index) {	
	image_xscale = 0.5 + length/sprite_get_width(sprite_index)
	image_yscale = 1/4
}

lines = init_lines(length);
