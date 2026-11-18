// 1. Limpa a música anterior quando o fade-out termina
if (instancia_anterior != noone) {
    if (audio_sound_get_gain(instancia_anterior) <= 0.01) {
        audio_stop_sound(instancia_anterior);
        instancia_anterior = noone;
    }
}

// 2. Atualiza o volume em tempo real se o jogador mexer nas opções
var _vol_atual_config = global.st_master * global.st_music;

if (volume_aplicado != _vol_atual_config) {
    volume_aplicado = _vol_atual_config;
    
    if (instancia_atual != noone && audio_is_playing(instancia_atual)) {
        // Aplica o novo volume rapidamente (100ms) para não dar estalo no áudio
        audio_sound_gain(instancia_atual, volume_aplicado, 100);
    }
}