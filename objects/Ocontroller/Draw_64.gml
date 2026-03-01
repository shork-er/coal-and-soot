var _data = scene_info[current_scene];
var _pic  = _data[0];
var _txt  = _data[1];

draw_sprite(_pic, 0, room_width / 2, room_height / 2);

draw_set_font(-1); 
draw_set_halign(fa_center); 
draw_set_valign(fa_middle);
draw_set_color(c_white); 

draw_text(room_width / 2, room_height - 100, _txt);

draw_text(room_width / 2, room_height - 50, "(Click to continue)");