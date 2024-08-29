/// @description Dragging Logic
// You can write your code in this editor

if (dragging) {
   phy_position_x = mouse_x + mdx;
   phy_position_y = mouse_y + mdy;
   if (!mouse_check_button(mb_left)) {
      dragging = false;
   }
}
else if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
   dragging = true;
   mdx = phy_position_x - mouse_x;
   mdy = phy_position_y - mouse_y;
}
