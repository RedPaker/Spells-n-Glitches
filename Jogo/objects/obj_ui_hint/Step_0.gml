
if(hint_id == 1 and ativou == false and global.quests.mouse == true){
    alarm[0] = 120;
    ativou = true;
    audio_play_sound(toast,32,false);
}

if (sumindo == true) {
    alfa -= 0.02; 

    // Quando a transparência chegar a zero ou menos, destrói o objeto
    if (alfa <= 0.05) {
        instance_destroy();
    }
}