// Bloqueia o ataque até coletar o item
if (!global.ataque_desbloqueado) {
    exit;
}

face = round(obj_plr_rpg.facing/90)*90;
if (lengthdir_x(1,face)>0) {
    sprite_index = spr_plr_atkh;
    image_angle = face;
}else {
	sprite_index = spr_plr_atk;
    image_angle = face+90;
}
x = obj_plr_rpg.x + lengthdir_x(atk_dist, face);
y = obj_plr_rpg.y + lengthdir_y(atk_dist, face);

/*var _dx = lengthdir_x(atk_dist, obj_plr_rpg.facing);
var _dy = lengthdir_y(atk_dist, obj_plr_rpg.facing);

if (abs(_dx)<abs(_dy)){
    x = obj_plr_rpg.x;
    y = obj_plr_rpg.y + _dy;
}else {
    x = obj_plr_rpg.x + _dx;
    y = obj_plr_rpg.y;
}*/