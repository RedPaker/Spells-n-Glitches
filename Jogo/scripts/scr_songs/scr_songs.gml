function tocar_musica(_som, _tempo_fade = 1000) {
    if (!instance_exists(obj_gerenc_music)) {
        instance_create_layer(0,0,"Sistemas",obj_gerenc_music);
    }

    with (obj_gerenc_music) {
        if (musica_atual == _som) {
            exit;
        }

        if (instancia_atual != noone && audio_is_playing(instancia_atual)) {
            instancia_anterior = instancia_atual;
            audio_sound_gain(instancia_anterior, 0, _tempo_fade);
        }

        musica_atual = _som;

        if (_som != noone) {
            var _vol_alvo = global.st_master * global.st_music;

            instancia_atual = audio_play_sound(_som, 10, true);
            audio_sound_gain(instancia_atual, 0, 0); 
            audio_sound_gain(instancia_atual, _vol_alvo, _tempo_fade);
        } else {
            instancia_atual = noone;
        }
    }
}

function tocar_sfx(_som, _pitch_aleatorio = false) {
    var _vol_sfx = global.st_master * global.st_soundefects;
    if (_vol_sfx <= 0) exit; // Economiza processamento se estiver mudo

    var _inst = audio_play_sound(_som, 5, false);
    audio_sound_gain(_inst, _vol_sfx, 0);

    // Opcional: deixa sons repetitivos (passos, golpes) mais naturais
    if (_pitch_aleatorio) {
        audio_sound_pitch(_inst, random_range(0.9, 1.1));
    }
    
    return _inst;
}