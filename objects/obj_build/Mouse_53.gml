/// @description Insert description here
// You can write your code in this editor

if gamestate() != STATE_BUILD {
	exit
}

state = BUILD_STATE_DRAG
x0 = mouse_x
y0 = mouse_y
obj0 = detector.candidate
v0 = detector.position

