
// Inherit the parent event
event_inherited();

if (chocado) {
    sprite_index = spr_eyes_wd_tomando_rajadao;

    if (dano_time <= 0) {
        chocado = false;
    }
} 
else {
    // Comportamento normal quando não está chocado
    var _facing_round = round(facing/90)*90
    var _x = lengthdir_x(1, _facing_round);
    var _y = lengthdir_y(1, _facing_round);
    if (mov_x != 0 or mov_y != 0) {
    	if (_x!=0) {
            image_speed = 1;
        	if (_x>0) {
            	sprite_index = spr_eyes_wr;
            }else {
                sprite_index = spr_eyes_wl;
            }
        }else if (_y!=0){
        	if (_y>0) {
                sprite_index = spr_eyes_wd;
            }else {
                sprite_index = spr_eyes_wu;
            }
        }
    }else{
        image_speed = 0;
        image_index = 0;
    }
}