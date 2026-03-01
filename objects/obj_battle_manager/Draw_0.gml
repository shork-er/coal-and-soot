draw_set_alpha(1); // Forces everything to be 100% visible

draw_set_color(c_white); // Forces text to be white

draw_set_alpha(1);

draw_set_color(c_white); // Force white text/lines



// Now draw your stats

draw_text(50, 50, "PLAYER HP: " + string(player_hp));

// ... rest of your code

// 1. Draw the Background Sprite (If you want it via code)

draw_sprite(sbackground, 0, 0, 0);



// 2. Draw the Battle Menu Box

draw_set_color(c_black);

draw_set_alpha(0.8);

draw_rectangle(0, room_height - 150, room_width, room_height, false);

draw_set_alpha(1.0);

draw_set_color(c_white);

draw_rectangle(0, room_height - 150, room_width, room_height, true);



// 3. Draw Player Stats

draw_text(50, 50, "PLAYER HP: " + string(player_hp) + " / " + string(player_max_hp));



// 4. Draw Enemy Stats

draw_text(room_width - 200, 50, "ENEMY: " + current_enemy);

draw_text(room_width - 200, 70, "HP: " + string(enemy_hp));



// 5. Draw the Battle Log

draw_set_halign(fa_center);

draw_text(room_width / 2, room_height - 100, battle_log);

if (can_flip) {

    draw_text(room_width / 2, room_height - 130, "PRESS SPACE TO FLIP");

}