/// @description Insert description here
// You can write your code in this editor

if gamestate() != STATE_BUILD || state != BUILD_STATE_DELETE {
	exit
}

state = BUILD_STATE_IDLE

if instance_exists(delete_detector.candidate) {
	if delete_detector.candidate.material != MATERIAL_NONE {
		materials[delete_detector.candidate.material].count++
	}
	
	instance_destroy(delete_detector.candidate)
	delete_detector.candidate = noone
} 
