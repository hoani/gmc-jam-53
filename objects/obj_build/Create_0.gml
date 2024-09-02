/// @description Build setup

#macro BUILD_JOINT_DISTANCE 16

#macro BUILD_STATE_IDLE 0
#macro BUILD_STATE_DRAG 1
#macro BUILD_STATE_DELETE 2


state = BUILD_STATE_IDLE
x0 = 0;
y0 = 0;
v0 = new Vector2(0, 0);
obj0 = noone
join0 = -1

materials = materials_init()
selections = selections_init(materials)

instance_create_ui(64, 64, obj_help_button, {enabled_state: STATE_BUILD})

selection = 0;

detector = instance_create(mouse_x, mouse_y, obj_joint_detection)
delete_detector = instance_create(mouse_x, mouse_y, obj_delete_detection)





