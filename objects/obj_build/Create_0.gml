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

#macro TOOL_LINE 0
#macro TOOL_BALL 1
tools = [
	{
		description: "Wooden Beam\nBuild strctures with this\nlightweight beam.",
		value: 1,
	},
	{
		description: "Wooden Ball\nA lightweight ball.\nRolls on surfaces.",
		value: 4,
	}
]


#macro BUILD_NUM_SELECTIONS 6

selections = [];

function cb0() { obj_build.selection = 0 }
function cb1() { obj_build.selection = 1 }
function cb2() { obj_build.selection = 2 }
function cb3() { obj_build.selection = 3 }
function cb4() { obj_build.selection = 4 }
function cb5() { obj_build.selection = 5 }

var _cbs = [cb0, cb1, cb2, cb3, cb4, cb5]


for (var _i = 0; _i < BUILD_NUM_SELECTIONS; _i++) {
	array_push(selections, {
		button: instance_create_ui(64, 172 + 64*_i, obj_tool_button, {
				enabled_state: STATE_BUILD,
				callback: _cbs[_i],
				index: _i,
			}),
		tool: TOOL_LINE,
		count: 20,
	})
}

instance_create_ui(64, 64, obj_help_button, {enabled_state: STATE_BUILD})

selections[1].tool = TOOL_BALL

selection = 0;

detector = instance_create(mouse_x, mouse_y, obj_joint_detection)
delete_detector = instance_create(mouse_x, mouse_y, obj_delete_detection)





