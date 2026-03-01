if (obj_battle_manager.state == BATTLE_STATE.ENEMY_TURN) {
    enemy_action_timer++;

    // Wait 1 second (60 frames) so the player can see what's happening
    if (enemy_action_timer >= 60 && enemy_attack_phase == 0) {
        
        // Roll for 1-5 (1-3 Main Attacks, 4-5 Special Attacks)
        var _move_choice = irandom_range(1, 5);
        var _damage = 0;
        
        switch (_move_choice) {
            case 1: // Main Attack 1: Quick Strike
                _damage = 5;
                battle_log = current_enemy + " used Quick Strike!";
                break;
            case 2: // Main Attack 2: Heavy Hit
                _damage = 10;
                battle_log = current_enemy + " used Heavy Hit!";
                break;
            case 3: // Main Attack 3: Multi-Slap
                _damage = 2; // (Maybe hits 3 times?)
                battle_log = current_enemy + " used Multi-Slap!";
                break;
            case 4: // Special 1: Stun / Debuff
                is_stunned = true;
                battle_log = current_enemy + " used Dazzle! You are stunned!";
                break;
            case 5: // Special 2: Life Steal
                _damage = 8;
                enemy_hp = clamp(enemy_hp + 5, 0, enemy_max_hp);
                battle_log = current_enemy + " drained your life!";
                break;
        }

        // Apply damage to player
        player_hp -= _damage;
        
        // Trigger the Attack Animation
        enemy_attack_phase = 1; 
        enemy_action_timer = 0; 
    }
}