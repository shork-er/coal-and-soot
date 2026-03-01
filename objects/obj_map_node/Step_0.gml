// 1. Basic Hover & Setup
var _is_hovering = point_in_circle(mouse_x, mouse_y, x, y, 25);
var _target_scale = 1.0;

// 2. The "Pathing" Logic (Cult of the Lamb style)
var _on_correct_layer = (layer_index == global.current_layer);
var _is_connected = false;

if (global.current_layer == 0) {
    // On the very first row, everything is a valid starting point
    _is_connected = true;
} else {
    // Check the node the player is "standing on" from the previous layer
    // We look at the connections stored in the previous node's data
    var _prev_node_data = obj_map_generator.map_data[global.current_layer - 1][global.current_node_index];
    var _valid_paths = _prev_node_data.connections;
    
    // Loop through those connections to see if THIS node's position is one of them
    for (var i = 0; i < array_length(_valid_paths); i++) {
        if (_valid_paths[i] == pos_index) {
            _is_connected = true;
            break;
        }
    }
}

// 3. Final Clickability Check
var _is_clickable = _on_correct_layer && _is_connected;

// 4. Interaction Logic
if (_is_hovering) {
    // Visual feedback: grow big if reachable, tiny pulse if locked
    _target_scale = _is_clickable ? 1.2 : 1.05;
    
    if (_is_clickable && mouse_check_button_pressed(mb_left)) {
     // 1. Save where we are so the map remembers our progress
    global.current_node_index = pos_index; 
    global.current_layer += 1; // Advance the floor
    
    // 2. Actually switch rooms
    switch (my_type) {
        case "Combat":
            room_goto(rm_battle); 
            break;
            
        case "Loot":
            room_goto(loot); 
            break;
            
        case "Boss":
            room_goto(rm_battle); // Or rm_boss if you have one
            break;
            
        default:
            room_goto(rm_battle); // Fallback
            break;
    }
    }
}

// 5. Smooth Scaling Animation
image_xscale = lerp(image_xscale, _target_scale, 0.15);
image_yscale = lerp(image_yscale, _target_scale, 0.15);