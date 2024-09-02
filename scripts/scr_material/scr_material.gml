// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro MATERIAL_BUDGET 6


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
#macro NUM_MATERIALS 9

function materials_init(){
	return [
		{
			description: "Wooden Beam\nBuild strctures with this\nlightweight beam.",
			base: 10,
			count: 0,
		},
		{
			description: "Ball\nA weighted ball.\nRolls on surfaces.",
			base: 4,
			count: 0,
		},
		{
			description: "Scaffolding\nProvdies structure without\ngetting in the way.",
			base: 10,
			count: 0,
		},
		{
			description: "Anchor\nA wall mounted join point\nfor other materials.",
			base: 4,
			count: 0,
		},
		{
			description: "Peg\nA wall mounted peg\nwhich stays in place.",
			base: 4,
			count: 0,
		},
		{
			description: "Shelf\nA horizontal wall\nmounted surface.",
			base: 2,
			count: 0,
		},
		{
			description: "Wheel\nAdd to beams to make\na cart.",
			base: 2,
			count: 0,
		},
		{
			description: "Bearing\nSpin materials around\neachother!",
			base: 3,
			count: 0,
		},
		{
			description: "Rocket\nA short burst of thrust.\nCatch it while you can!",
			base: 1,
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
	for (var _i = 2; _i < BUILD_NUM_SELECTIONS; _i+=1) {
		var _unique = false;
		while (_unique == false) {
			var _candidate = irandom(NUM_MATERIALS-1);
			show_debug_message($"candidate {_i} is {_candidate}")
			_unique = true;
			for (var _j = 0; _j < _i; _j++) {
				if (_selections[_j].material == _candidate) {
					_unique = false;
				}
			}
			if (_unique) {
				_selections[_i].material = _candidate;
				_materials[_candidate].count = _materials[_candidate].base;
				break;
			}
		}
	}
	
	var _budget = MATERIAL_BUDGET;
	
	while (_budget > 0) {
		for (var _i = 0; _i < BUILD_NUM_SELECTIONS; _i++) {
			var _material = _selections[_i].material;
			var _base = _materials[_material].base;
			var _incr = irandom(_base);
			_materials[_material].count += _incr;
			_budget -= _incr/_base;
			if _budget <= 0 {
				break;
			}
		}
	}


	
	return _selections
}