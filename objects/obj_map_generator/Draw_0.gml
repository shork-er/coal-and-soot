// ONLY draw the lines here
for (var _l = 0; _l < map_layers; _l++) {
    for (var _p = 0; _p < array_length(map_data[_l]); _p++) {
        var _node = map_data[_l][_p];
        for (var _c = 0; _c < array_length(_node.connections); _c++) {
            var _next = map_data[_l + 1][_node.connections[_c]];
            // Draw the connection line
            draw_set_color(c_dkgray);
            draw_line(_node.x_pos, _node.y_pos, _next.x_pos, _next.y_pos);
        }
    }
}