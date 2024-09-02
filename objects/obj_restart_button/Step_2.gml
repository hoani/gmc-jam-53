/// @description Insert description here
// You can write your code in this editor

if gamestate() == enabled_state {

	if delay >= 0 {
		delay-=1
	} else {
		event_inherited()
	}
} else {
	delay = 30
	event_inherited()
}