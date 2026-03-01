// obj_enemy Create Event
hp = 8;
atk_low = 8;
atk_mid = 13;
atk_high = 17;
max_hp = 8;
shield_amount = 3;   // Current armor
thorns_active = true; // Does the player take damage when hitting?
// obj_enemy Step Event

if (obj_battle_manager.state == BATTLE_STATE.ENEMY_TURN) {
    // If it's the enemy's turn and they aren't already attacking
    if (sprite_index != s_kymera_attack) {
        sprite_index = s_kymera_attack;
        image_index = 0; // Start at the beginning of the animation
    }
} else {
    // Otherwise, stay in idle
    sprite_index = s_kymera_idle;
}