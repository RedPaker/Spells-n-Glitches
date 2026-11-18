var _fg = layer_get_id("tlm_fg");

if (_fg != -1) {
    tilemap_foreground = layer_tilemap_get_id(_fg);
} else {
    tilemap_foreground = -1;
}


switch (room) {
    case rm_casa:
    case rm_casa_55:
    case rm_arcadeenter:
    case rm_corredor:
    case rm_ilha:
        tocar_musica(Dreams_of_Escape, 1000);
        break;
    case rm_fase_1:
    case rm_casa_cenario1:
    case rm_casa_cenario2:
    case rm_area55_empty:
    case rm_torre:
    case rm_livro:
    case rm_pagina1:
    case rm_porteiro:
        tocar_musica(snd_musicaboa,1000);
        break;
    case rm_boss_fase1:
        tocar_musica(CriticalTheme,1000);
        break;
}