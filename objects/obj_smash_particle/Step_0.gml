/// @description Insert description here
// You can write your code in this editor

countdown-=1
if gamestate()== STATE_BUILD || countdown < 0 {
	instance_destroy()
}

vspeed += gravity

y += vspeed
x += hspeed

