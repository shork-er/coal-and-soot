// 1. Setup Visuals based on Layer
var _is_current = (layer_index == global.current_layer);
var _is_past = (layer_index < global.current_layer);

// Set Alpha: Dim if past, semi-bright if future, full bright if current
var _alpha = 0.2; 
if (_is_current) _alpha = 1.0;
else if (layer_index > global.current_layer) _alpha = 0.5;

draw_set_alpha(_alpha);

// 2. Draw Connection Lines (Only if the Generator is Persistent!)
if (instance_exists(obj_map_generator) && layer_index < obj_map_generator.map_layers) {
    var _my_data = obj_map_generator.map_data[layer_index][pos_index];
    var _conns = _my_data.connections;
    
    draw_set_color(c_white);
    for (var i = 0; i < array_length(_conns); i++) {
        var _next_node_struct = obj_map_generator.map_data[layer_index + 1][_conns[i]];
        
        // DRAW TO THE NEXT STRUCT'S SAVED POSITION
        draw_line_width(x, y, _next_node_struct.x_pos, _next_node_struct.y_pos, 2);
    }
}

// 3. Draw the Node Circle
var _col = c_white;
if (my_type == "Combat") _col = c_red;
if (my_type == "Loot")   _col = c_green;
if (my_type == "Boss")   _col = c_purple;

draw_circle_color(x, y, 22 * image_xscale, _col, _col, false);

// 4. Draw Label
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(x, y + 30, my_type);

draw_set_alpha(1.0); // Reset alpha for other objects