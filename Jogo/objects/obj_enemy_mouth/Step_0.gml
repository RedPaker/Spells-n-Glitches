// Inherit the parent event
event_inherited();

var _facing_round = round(facing/90)*90
var _x = lengthdir_x(1, _facing_round);
var _y = lengthdir_y(1, _facing_round);
if (mov_x != 0 or mov_y != 0) {
    if (_x!=0 or _y!=0) {
        image_speed = 1;
        if (_x>0) {
            sprite_index = spr_mouth_right;
        }else {
            sprite_index = spr_mouth_left;
        }
    }
}else{
    sprite_index = spr_mouth_idle;
}