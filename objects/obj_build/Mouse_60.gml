/// @description Prev Selection

if gamestate() != STATE_BUILD && state == BUILD_STATE_IDLE {
	exit
}

selection -= 1
if selection < 0 {
	selection += BUILD_NUM_SELECTIONS
}