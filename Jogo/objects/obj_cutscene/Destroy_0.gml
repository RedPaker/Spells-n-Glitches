if (musica != noone) audio_stop_sound(musica);
if (instance_exists(obj_dialogo)) instance_destroy(obj_dialogo);

global.cutscene_ativa = false;
global.jogo_pausado = false;

// Só reativa as camadas se a sala ainda existir (caso room_goto ainda não tenha rodado)
if (layer_exists("Entities")) instance_activate_layer("Entities");
if (layer_exists("Itens")) instance_activate_layer("Itens");
if (layer_exists("Misc")) instance_activate_layer("Misc");

if (ao_terminar != undefined) ao_terminar();