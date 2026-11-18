switch (estado)
{
    case 0: // fade in
        alpha += fade_speed;
        if (alpha >= 1)
        {
            alpha = 1;
            estado = 1;
        }
    break;

    case 1: // espera
        timer++;
        if (timer >= tempo_espera) estado = 2;
    break;

    case 2: // fade out
        alpha -= fade_speed;
        if (alpha <= 0)
        {
            alpha = 0;
            room_goto(rm_menu);
        }
    break;
}

// Permite pular com qualquer tecla ou clique
if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_left))
{
    room_goto(rm_menu);
}