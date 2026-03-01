var _fail_roll = random(100);

if (_fail_roll < 18) {
    battle_log = "You dropped the coin! Miss!";
} else {
    var _is_heads = choose(true, false);
    var _is_crit = (random(100) < 27);
    
    var _damage = _is_heads ? 5 : 3; // Example: Heads deals more dmg
    if (_is_crit) _damage *= 2;      // 27% chance for double result
    
    battle_log = _is_heads ? "HEADS! Dealt " : "TAILS! Dealt ";
    battle_log += string(_damage) + (_is_crit ? " CRIT damage!" : " damage!");
}