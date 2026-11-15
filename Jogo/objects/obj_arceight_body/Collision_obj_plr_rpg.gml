if (global.jogo_pausado == true) {
    exit;
}

if (!other.imortal) {
    if (kapows>0) {
    	if (other.dano_time <= 0 && other.hp > 0) {
            other.empurra = 12;
            other.empurra_dir = point_direction(x, y, other.x, other.y);
        }
    }else {
    	if (other.dano_time <= 0 && other.hp > 0) {
            other.hp -= 15
            other.dano_time = 20;
            other.empurra = 12;
            other.empurra_dir = point_direction(x, y, other.x, other.y);
        }
    }
    
}