if (can_flip && keyboard_check_pressed(vk_space)) {
    var _roll = random(100);
    
    // 20% Chance to MISS
    if (_roll < 20) {
        battle_log = "You fumbled the coin! MISS!";
    } 
    else {
        // 50/50 Coin Flip
        var _is_heads = choose(true, false);
        var _is_crit = (random(100) < 27); //  Crit chance
        
        if (_is_heads) {
            // HEADS: Deal Damage
            var _dmg = _is_crit ? 6 : 3;
            enemy_hp -= _dmg;
            battle_log = _is_crit ? "CRITICAL HEADS! " + string(_dmg) + " DMG!" : "HEADS! " + string(_dmg) + " DMG!";
        } 
        else {
            // TAILS: Heal 2 HP (from your note)
            player_hp = clamp(player_hp + 20, 0, player_max_hp);
            battle_log = "TAILS! You healed 2 HP!";
			
        }
    }
    
    // Check for Victory
    if (enemy_hp <= 0) {
        enemy_hp = 0;
        can_flip = false;
        battle_log = "VICTORY! Press [ENTER] to continue.";
    }
}

// Return to Map after winning
if (!can_flip && keyboard_check_pressed(vk_enter)) {
    room_goto(rm_map_view);
}