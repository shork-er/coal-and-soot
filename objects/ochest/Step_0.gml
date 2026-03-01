
var _movechest = keyboard_check(vk_right) - keyboard_check(vk_left);

if (oplayer.can_move == true && _movechest != 0) {
    x -= (_movechest * 10); 
}

if (place_meeting(x, y, oplayer) && sprite_index == schest_closed) {
    sprite_index = schest_open; 
    oplayer.can_move = false;  
 
}

if (sprite_index == schest_open) {
   room_goto (rm_gameplay);
}