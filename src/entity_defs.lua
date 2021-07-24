-- Define the entities that are in the game

ENTITY_DEFS = 
{
    ['player'] = {
        walkSpeed = PLAYER_WALK_SPEED,
        animations = {
            ['walk-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.15,
                texture = 'entities'
            },
            ['idle-left'] = {
                frames = {13},
                texture = 'entities'
            },
            ['idle-right'] = {
                frames = {5},
                texture = 'entities'
            },
            ['idle-down'] = {
                frames = {1},
                texture = 'entities'
            },
            ['idle-up'] = {
                frames = {9},
                texture = 'entities'
            },

            ['sword-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.05,
                looping = false,
                texture = 'character-swing-sword'
            },
            ['sword-right'] = {
                frames = {9, 10, 11, 12},
                interval = 0.05,
                looping = false,
                texture = 'character-swing-sword'
            },
            ['sword-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.05,
                looping = false,
                texture = 'character-swing-sword'
            },
            ['sword-up'] = {
                frames = {5, 6, 7, 8},
                interval = 0.05,
                looping = false,
                texture = 'character-swing-sword'
            }

    }
    }


}