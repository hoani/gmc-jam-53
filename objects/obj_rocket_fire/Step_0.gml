/// @description Insert description here
// You can write your code in this editor

count +=1

image_xscale *= 49/48
image_yscale *= 49/48
image_alpha *= (lifetime-1)/lifetime

if count > lifetime {
	image_alpha-=1/16
}

image_blend = merge_color(c_red, c_ltgray, count/lifetime)

if image_alpha <= 0 {
	instance_destroy()
}
