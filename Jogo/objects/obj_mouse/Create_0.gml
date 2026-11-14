coletado = false;
coletado_livro = false;

if (!variable_global_exists("inv")) {
    global.inv = [];
}

if (!variable_global_exists("ataque_desbloqueado")) {
    global.ataque_desbloqueado = false;
}

event_inherited();