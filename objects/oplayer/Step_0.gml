var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _move = _key_right - _key_left;

if (place_meeting(x, y, ochest)) {
    can_move = false;  
 
}


if (_move != 0&&can_move) {
    sprite_index = splayer;    
    image_speed = 1;           
    image_xscale = 0.5;     
    
    var _lay_id = layer_get_id("background");
    if (_lay_id != -1) {
        var _scroll_speed = 4; 
        var _current_x = layer_get_x(_lay_id);
        layer_x(_lay_id, _current_x - (_move * _scroll_speed));
    }
} else {
    image_speed = 0;          
    image_index = 0;     
}
if (_move != 0) {
    image_speed = 1;
    
    if (_move > 0) {
        image_xscale = 0.5;  
    } else {
        image_xscale = -0.5; 
    }

   
    var _lay_id = layer_get_id("Background");
    layer_x(_lay_id, layer_get_x(_lay_id) - (_move * 4));
} else {
    image_speed = 0;
    image_index = 0;
}

var _left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _movechest = _right - _left;

if (can_move == true) { 
    
    if (_move != 0) {
        sprite_index = splayer;
        image_speed = 1;
        image_xscale = (_movechest > 0) ? 0.5 : -0.5;
        
        var _lay_id = layer_get_id("Background");
        if (_lay_id != -1) {
            layer_x(_lay_id, layer_get_x(_lay_id) - (_movechest * 4));
        }
    } else {
        image_speed = 0;
        image_index = 0;
    }
    
} else {
    image_speed = 0; 
    image_index = 0; 
}