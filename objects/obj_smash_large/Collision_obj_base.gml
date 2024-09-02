/// @description Insert description here
// You can write your code in this editor

physics_apply_force(x, y, -phy_speed_x/64, 0)

if (abs(phy_speed_y) > 2) {
	emit_smash_particles(phy_speed_x, phy_speed_y)
}
