/// @description Insert description here
// You can write your code in this editor

if global.state.current != enabled_state {
	exit
}


function handle_release(_holder) {
	if _holder.image_alpha == 1 {
		_holder.callback()
	}
}

mouseholder_assign(self, mouse_holder_none, handle_release)