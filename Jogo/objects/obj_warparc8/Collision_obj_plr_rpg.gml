show_debug_message("aasdafsafa")
cutscene_play([
    { sprite: cutscene2, frame: 0, fade: "in", wait: 3, auto: true },
    { sprite: cutscene2, frame: 1, wait: 1, auto: true },
    { sprite: cutscene2, frame: 2, wait: 1, auto: true },
    { sprite: cutscene2, frame: 3, wait: 1, auto: true },
    { sprite: cutscene2, frame: 4 },
    { fade: "out", auto: true }
], function() {
    room_goto(rm_boss_fase1);
    obj_plr_rpg.x = 40;
    obj_plr_rpg.y = 304;
});