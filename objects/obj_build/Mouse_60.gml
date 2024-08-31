/// @description Prev Selection

if gamestate() != STATE_BUILD {
	exit
}

selection -= 1
if selection < 0 {
	selection += BUILD_NUM_SELECTIONS
}