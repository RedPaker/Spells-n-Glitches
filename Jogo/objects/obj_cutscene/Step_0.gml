// Pular a cutscene inteira (o evento Destroy cuidará da limpeza e do ao_terminar)
if (keyboard_check_pressed(tecla_pular)) {
    instance_destroy();
    exit;
}

// Efeitos contínuos
fade_a += clamp(fade_alvo - fade_a, -fade_vel, fade_vel);
flash_a = max(0, flash_a - 0.05);
if (shake_t > 0) shake_t--;
zoom += (zoom_alvo - zoom) * 0.02;

if (anim_fps > 0 && spr != noone) {
    frame += anim_fps / game_get_speed(gamespeed_fps);
    frame = frame mod sprite_get_number(spr);
}

global.jogo_pausado = true;

// --- Inicia um novo passo ---
if (estado == 0) {
    idx++;
    if (idx >= array_length(passos)) { 
        instance_destroy(); // Dispara o Destroy e chama ao_terminar() uma única vez
        exit; 
    }

    passo = passos[idx];
    var _s = passo;

    if (variable_struct_exists(_s, "sprite")) {
        spr = _s.sprite;
        zoom = 1;
        zoom_alvo = 1;
    }
    if (variable_struct_exists(_s, "frame")) frame = _s.frame;
    anim_fps = opt(_s, "anim", 0);

    var _f = opt(_s, "fade", "");
    fade_vel = opt(_s, "fade_vel", 0.03);
    if (_f == "in")  { fade_a = 1; fade_alvo = 0; }
    if (_f == "out") { fade_alvo = 1; }

    // Efeitos
    if (opt(_s, "flash", false)) flash_a = 1;
    if (variable_struct_exists(_s, "shake")) {
        shake_t = _s.shake;
        shake_dur = max(1, _s.shake);
        shake_mag = opt(_s, "shake_force", 12);
    }
    if (variable_struct_exists(_s, "zoom")) zoom_alvo = _s.zoom;

    // Sons
    if (variable_struct_exists(_s, "snd")) {
        audio_play_sound(_s.snd, 1 * global.st_master * global.st_soundefects, false);
    }
    if (variable_struct_exists(_s, "music")) {
        if (musica != noone) audio_stop_sound(musica);
        musica = audio_play_sound(_s.music, 1 * global.st_master * global.st_music, true);
    }

    // Diálogo
    msgs = undefined;
    dialogo_iniciado = false;
    if (variable_struct_exists(_s, "dialog")) {
        msgs = is_string(_s.dialog) ? d_select_dialog(_s.dialog) : _s.dialog;
    }

    espera = opt(_s, "wait", 0) * game_get_speed(gamespeed_fps);
    aguardando_tecla = false;
    
    estado = 1;
    exit;
}

// --- Execução do passo atual (estado == 1) ---

// 1. Espera o fade terminar
if (abs(fade_alvo - fade_a) > 0.001) exit;

// 2. Espera o timer (wait)
if (espera > 0) { 
    espera--; 
    exit; 
}

// 3. Inicia o diálogo, se houver
if (msgs != undefined && !dialogo_iniciado) {
    d_create_dialog(msgs);
    dialogo_iniciado = true;
    exit;
}

// 4. Espera o diálogo fechar
if (dialogo_iniciado && instance_exists(obj_dialogo)) exit;

// 5. Se não for automático e não tiver diálogo, espera tecla
var _auto = opt(passo, "auto", false); 
if (msgs == undefined && !_auto) {
    aguardando_tecla = true;
    if (keyboard_check_pressed(vk_anykey)) {
        aguardando_tecla = false;
        estado = 0; 
    }
    exit;
}

// Avança para o próximo passo
aguardando_tecla = false;
estado = 0;