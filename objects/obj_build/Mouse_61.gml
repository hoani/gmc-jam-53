/// @description Next Selection

if gamestate() != STATE_BUILD {
	exit
}

selection += 1
if selection >= BUILD_NUM_SELECTIONS {
	selection = 0
}