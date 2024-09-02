/// @description Next Selection

if gamestate() != STATE_BUILD&& state == BUILD_STATE_IDLE {
	exit
}

selection += 1
if selection >= BUILD_NUM_SELECTIONS {
	selection = 0
}