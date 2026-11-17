// Inherit the parent event
event_inherited();

var _facing_round = round(facing/90)*90
var _x = lengthdir_x(1, _facing_round);
var _y = lengthdir_y(1, _facing_round);
if (mov_x != 0 or mov_y != 0) {
    if (_x!=0) {
        image_speed = 1;
        if (_x>0) {
            sprite_index = spr_flowinf_wr;
        }else {
            sprite_index = spr_flowinf_wl;
        }
    }else if (_y!=0){
        if (_y>0) {
            sprite_index = spr_flowinf_wd;
        }else {
            sprite_index = spr_flowinf_wu;
        }
    }
}else{
    image_speed = 0;
    image_index = 0;
}