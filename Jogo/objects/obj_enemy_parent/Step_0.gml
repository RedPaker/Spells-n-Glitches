
if (global.jogo_pausado == true) {
    exit;
}

if (hp <= 0) {
    instance_destroy();
    exit;
}

// Efeito visual de dano
if (dano_time > 0) {
    dano_time--;

    if ((dano_time div 4) mod 2 == 0) image_blend = c_red;
    else image_blend = c_white;
} else {
    image_blend = c_white;
}

// Se estiver parado perto da Jukebox
if (stunned) exit;

// Empurrão
if (empurra > 0) {
    var _ex = lengthdir_x(empurra, empurra_dir);
    var _ey = lengthdir_y(empurra, empurra_dir);

    move_and_collide(_ex, 0, [tilemap_foreground,inviswalls,npc,estruturas]);
    move_and_collide(0, _ey, [tilemap_foreground,inviswalls,npc,estruturas]);

    empurra *= 0.75;

    if (empurra < 0.2) empurra = 0;

    exit;
}

// Define o alvo
if (apaixonado && instance_exists(obj_jukebox)) {
    var _jukebox = instance_find(obj_jukebox, 0);
    if (distance_to_object(_jukebox)<=distance_to_jukebox) {
    	    alvo_x = _jukebox.x;
        alvo_y = _jukebox.y;
    }
}
else {
    apaixonado = false;

    if (!instance_exists(obj_plr_rpg)) exit;
    if (distance_to_object(obj_plr_rpg) <= distance_to_player) {
    	alvo_x = obj_plr_rpg.x;
        alvo_y = obj_plr_rpg.y;
    }
    
}

// Separação entre inimigos
var _separa_x = 0;
var _separa_y = 0;

var _objetos = [obj_enemy_parent, obj_virus_mae];

for (var i = 0; i < array_length(_objetos); i++) {
    var _quantidade = instance_number(_objetos[i]);

    for (var j = 0; j < _quantidade; j++) {
        var _inimigo = instance_find(_objetos[i], j);

        if (_inimigo == id) continue;

        var _dx = x - _inimigo.x;
        var _dy = y - _inimigo.y;
        var _dist = point_distance(x, y, _inimigo.x, _inimigo.y);

        if (_dist < distancia_separacao && _dist > 0.001) {
            var _forca = (distancia_separacao - _dist) / distancia_separacao;

            _separa_x += (_dx / _dist) * _forca;
            _separa_y += (_dy / _dist) * _forca;
        }
    }
}

// Direção até o alvo
// Direção até o alvo
var _dx = alvo_x - x;
var _dy = alvo_y - y;
var _dist = point_distance(x, y, alvo_x, alvo_y);

if (_dist > 2) {
    _dx /= _dist;
    _dy /= _dist;
    descansando = false;
} else {
    // Chegou no destino: para seco!
    _dx = 0;
    _dy = 0;
    
    // Inicia o timer da pausa UMA única vez ao chegar
    if (!descansando) {
        descansando = true;
        alarm[0] = irandom_range(tempo_pausa_min, tempo_pausa_max);
    }
}

// Movimento seco (sem lerp/inércia)
mov_x = _dx + _separa_x * 0.8;
mov_y = _dy + _separa_y * 0.8;

// Se estiver descansando e sem empurrão de outro inimigo, fica 100% parado
if (descansando && point_distance(0, 0, _separa_x, _separa_y) < 0.1) {
    mov_x = 0;
    mov_y = 0;
}

var _comprimento = point_distance(0, 0, mov_x, mov_y);

if (_comprimento > 0.001) {
    // Usa min() para ele não deslizar na velocidade máxima se for só um empurrão leve
    var _vel = min(_comprimento, 1) * move_spd; 
    
    mov_x = (mov_x / _comprimento) * _vel;
    mov_y = (mov_y / _comprimento) * _vel;
    
    facing = point_direction(0, 0, mov_x, mov_y);
    move_and_collide(mov_x, mov_y, [tilemap_foreground, inviswalls,npc,estruturas]);
}
