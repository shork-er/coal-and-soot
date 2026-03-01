// obj_enemy Create Event
hp = 13;
atk_low = 5;
atk_mid = 8;
atk_high = 10;
max_hp = 13;
shield_amount = 0;   // Current armor
thorns_active = false; // Does the player take damage when hitting?
// obj_enemy Step Event

if (obj_battle_manager.state == BATTLE_STATE.ENEMY_TURN) {
    // If it's the enemy's turn and they aren't already attacking
    if (sprite_index != s_enemy_attack) {
        sprite_index = s_enemy_attack;
        image_index = 0; // Start at the beginning of the animation
    }
} else {
    // Otherwise, stay in idle
   sprite_index = obj_battle_manager.s_idle;
}
// Now that BATTLE_STATE is in a script, this won't crash
if (obj_battle_manager.state == BATTLE_STATE.ENEMY_TURN) {
    sprite_index = obj_battle_manager.s_attack;
} else {
    sprite_index = obj_battle_manager.s_idle;
}