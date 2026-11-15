event_inherited();

if (!variable_global_exists("ataque_desbloqueado")) {
    global.ataque_desbloqueado = false;
}

if (!global.ataque_desbloqueado) {
    instance_destroy();
    exit;
}

dano = 10;
tempo_vida = 24;
atingiu = false;
velocidade = 1;

face = round(obj_plr_rpg.facing/90)*90;
image_angle = face+90;

x = obj_plr_rpg.x + lengthdir_x(atk_dist, face);
y = obj_plr_rpg.y + lengthdir_y(atk_dist, face);