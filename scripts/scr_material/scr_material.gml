// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro MATERIAL_NONE -1
#macro MATERIAL_LINE 0
#macro MATERIAL_BALL 1
#macro MATERIAL_SCAFFOLDING 2
#macro MATERIAL_ANCHOR 3
#macro MATERIAL_PEG 4
#macro MATERIAL_SHELF 5
#macro MATERIAL_WHEEL 6
#macro MATERIAL_BEARING 7
#macro MATERIAL_ROCKET 8

function materials_init(){
	return [
		{
			description: "Wooden Beam\nBuild strctures with this\nlightweight beam.",
			value: 1,
			count: 0,
		},
		{
			description: "Ball\nA weighted ball.\nRolls on surfaces.",
			value: 4,
			count: 0,
		},
		{
			description: "Scaffolding.\nProvdies structure without\ngetting in the way.",
			value: 1,
			count: 0,
		},
		{
			description: "Anchor.\nA wall mounted join point\nfor other materials.",
			value: 5,
			count: 0,
		},
		{
			description: "Peg.\nA wall mounted peg which\nstays in place.",
			value: 4,
			count: 0,
		},
		{
			description: "Shelf.\nA horizontal wall mounted\nsurface.",
			value: 10,
			count: 0,
		},
		{
			description: "Wheel.\nAdd to beams to make\na cart.",
			value: 3,
			count: 0,
		},
		{
			description: "Bearing.\nA spinning bearing for joining\nto other materials.",
			value: 4,
			count: 0,
		},
		{
			description: "Rocket.\nApplies thrust for 2 seconds.\nCatch it while you can!",
			value: 4,
			count: 0,
		}
	]
}

function selections_init(_materials) {
	#macro BUILD_NUM_SELECTIONS 6
	var _selections = [];

	function cb0() { obj_build.selection = 0 }
	function cb1() { obj_build.selection = 1 }
	function cb2() { obj_build.selection = 2 }
	function cb3() { obj_build.selection = 3 }
	function cb4() { obj_build.selection = 4 }
	function cb5() { obj_build.selection = 5 }

	var _cbs = [cb0, cb1, cb2, cb3, cb4, cb5]


	for (var _i = 0; _i < BUILD_NUM_SELECTIONS; _i++) {
		var _item = {
			button: instance_create_ui(64, 172 + 64*_i, obj_tool_button, {
					enabled_state: STATE_BUILD,
					callback: _cbs[_i],
					index: _i,
				}),
			material: MATERIAL_LINE,
		}
		array_push(_selections, _item)
	}
	
	_selections[0].material = MATERIAL_LINE
	_selections[1].material = MATERIAL_BALL
	_selections[2].material = MATERIAL_WHEEL
	_selections[3].material = MATERIAL_ROCKET
	_selections[4].material = MATERIAL_PEG
	_selections[5].material = MATERIAL_SHELF

	
	_materials[MATERIAL_LINE].count = 14
	_materials[MATERIAL_BALL].count = 4
	_materials[MATERIAL_SCAFFOLDING].count = 10
	_materials[MATERIAL_ANCHOR].count = 10
	_materials[MATERIAL_PEG].count = 10
	_materials[MATERIAL_SHELF].count = 10
	_materials[MATERIAL_WHEEL].count = 4
	_materials[MATERIAL_BEARING].count = 4
	_materials[MATERIAL_ROCKET].count = 2
	
	return _selections
}