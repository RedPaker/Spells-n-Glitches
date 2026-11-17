cutscene_play([
        { sprite: cutscene2, frame: 1, fade: "in", wait: 3, auto: true },
        { sprite: cutscene2, frame: 2, wait: 1, auto: true },
        { sprite: cutscene2, frame: 3, wait: 1, auto: true },
        { sprite: cutscene2, frame: 4,wait: 1, auto: true},
        { sprite: cutscene2, frame: 5},
        { fade: "out", auto: true}
    ], function() {
        room_goto(rm_boss_fase1);
    });