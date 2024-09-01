/// @description Insert description here
// You can write your code in this editor

for (var _i = 0; _i < array_length(joins); _i++) {
	if instance_exists(joins[_i]) {
		instance_destroy(joins[_i])
	}
}