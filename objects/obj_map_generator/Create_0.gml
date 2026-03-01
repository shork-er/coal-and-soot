// --- 1. Map Settings ---
map_layers = 6; 
map_width = 3;  
map_data = [];

// --- 2. Generate the Node Blueprints ---
for (var _layer = 0; _layer < map_layers; _layer++) {
    map_data[_layer] = [];
    var _pool = ["Combat", "Combat", "Combat", "Combat", "Combat", "Loot", "Loot", "Loot", "Event", "Event"];
    _pool = array_shuffle(_pool);
    
    var _row_types = [];
    var _pool_idx = 0;
    while (array_length(_row_types) < map_width && _pool_idx < array_length(_pool)) {
        var _candidate = _pool[_pool_idx];
        if (!array_contains(_row_types, _candidate)) array_push(_row_types, _candidate);
        _pool_idx++;
    }

    var _is_start = (_layer == 0);
    var _is_boss  = (_layer == map_layers - 1);
    var _nodes_in_this_layer = (_is_start || _is_boss) ? 1 : map_width;

    var _spacing = 150;
    var _start_x = (room_width / 2) - (((map_width - 1) * _spacing) / 2);

    for (var _p = 0; _p < _nodes_in_this_layer; _p++) {
        var _type = (_is_start) ? "Combat" : ((_is_boss) ? "Boss" : _row_types[_p]);
        var _node_x = (_nodes_in_this_layer == 1) ? (room_width / 2) : _start_x + (_p * _spacing); 
        var _node_y = room_height - 150 - (_layer * 120);
        
        map_data[_layer][_p] = { node_type: _type, x_pos: _node_x, y_pos: _node_y, connections: [] };
    }
}

// --- 3. Generate Structured Connections ---
for (var _l = 0; _l < map_layers - 1; _l++) {
    var _curr_size = array_length(map_data[_l]);
    var _next_size = array_length(map_data[_l + 1]);

    for (var _p = 0; _p < _curr_size; _p++) {
        array_push(map_data[_l][_p].connections, irandom(_next_size - 1));
    }

    for (var _n = 0; _n < _next_size; _n++) {
        var _has_parent = false;
        for (var _prev = 0; _prev < _curr_size; _prev++) {
            var _c_list = map_data[_l][_prev].connections;
            for (var _i = 0; _i < array_length(_c_list); _i++) {
                if (_c_list[_i] == _n) { _has_parent = true; break; }
            }
            if (_has_parent) break;
        }
        if (!_has_parent) array_push(map_data[_l][irandom(_curr_size - 1)].connections, _n);
    }
}

// --- 4. Spawn Objects ---
for (var _l = 0; _l < map_layers; _l++) {
    for (var _p = 0; _p < array_length(map_data[_l]); _p++) {
        var _d = map_data[_l][_p];
        var _inst = instance_create_layer(_d.x_pos, _d.y_pos, "Instances", obj_map_node);
        _inst.my_type = _d.node_type;
        _inst.layer_index = _l;
        _inst.pos_index = _p;
    }
}