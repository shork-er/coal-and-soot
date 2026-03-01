var _speed = 4;
var _hmove = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _vmove = keyboard_check(ord("S")) - keyboard_check(ord("W"));

x += _hmove * _speed;
y += _vmove * _speed;