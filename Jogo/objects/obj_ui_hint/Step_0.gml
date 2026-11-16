
if(hint_id == 1){
    alarm[0] = 120;
}

if (sumindo == true) {
    alfa -= 0.02; 

    // Quando a transparência chegar a zero ou menos, destrói o objeto
    if (alfa <= 0.05) {
        instance_destroy();
    }
}