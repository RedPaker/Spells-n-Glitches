if (global.jogo_pausado == true) {
    exit;
}
if (other.dano_time <= 0 && other.hp > 0) {
    other.hp -= 16;
    other.dano_time = 20;
    other.impacto = 8;
    other.empurra = 10;
    other.empurra_dir = point_direction(x, y, other.x, other.y);
}
