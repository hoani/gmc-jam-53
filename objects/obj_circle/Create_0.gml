/// @description Circle setup


if radius > sprite_get_width(sprite_index) {	
	image_xscale = 2.0*radius/sprite_get_width(sprite_index) 
	image_yscale = image_xscale
}

circles = init_circles(radius);

