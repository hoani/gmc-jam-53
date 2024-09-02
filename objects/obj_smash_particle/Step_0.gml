/// @description Insert description here
// You can write your code in this editor

if gamestate()== STATE_BUILD {
	instance_destroy()
}

vspeed += gravity

y += vspeed
x += hspeed

