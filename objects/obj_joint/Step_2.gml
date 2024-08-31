/// @description Insert description here
// You can write your code in this editor

if y > room_height {
	instance_destroy()
}

x = physics_joint_get_value(joint, phy_joint_anchor_1_x)
y = physics_joint_get_value(joint, phy_joint_anchor_1_y)
image_angle = physics_joint_get_value(joint, phy_joint_angle)


