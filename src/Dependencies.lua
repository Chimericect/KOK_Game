--
-- Libs!
--
Class = require 'lib/class'
Event = require 'lib/knife.event'
Timer = require 'lib/knife.timer'
push = require 'lib/push'

require 'src/Animation'
require 'src/constants'
require 'src/entity_defs'
require 'src/Entity'
require 'src/game_object_defs'
require 'src/GameObject'
require 'src/NPC'
require 'src/HitBox'
require 'src/Player'
require 'src/StateMachine'
require 'src/Util'


require 'src/Animals/aggressiveAnimal_defs'
require 'src/Animals/neutralAnimal_defs'
require 'src/Animals/passive_Animal_defs'

require 'src/states/BaseState'
require 'src/states/saveFile'
require 'src/states/StateStack'
require 'src/states/entity/Animal/aggressiveWalkStates'
require 'src/states/entity/Animal/neutralWalkStates'
require 'src/states/entity/Animal/passiveWalkStates'
require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'
require 'src/states/entity/player/PlayerIdleState'
require 'src/states/entity/player/PlayerWalkState'
require 'src/states/entity/player/PlayerSwingSwordState'
require 'src/states/game/closeGame'
require 'src/states/game/loadGame'----------------
require 'src/states/game/menuState'
require 'src/states/game/newGame' ----------------
require 'src/states/game/StartState' -- done?
require 'src/states/game/Settings'

require 'src/world/FirstLoc'
require 'src/world/tile_IDS'
require 'src/world/Tilemap'
require 'src/world/Tile'
require 'src/entity_defs'



-- Texture image
gameTextures = {
    -- background images. 
        ['Startbackground'] = love.graphics.newImage('graphics/background.png'),
    -- Tiles
        ['tiles'] = love.graphics.newImage('graphics/Terrain/Mixed1.png'),

    -- player
        ['character-walk'] = love.graphics.newImage('graphics/Characters/Player/character_walk.png'),
        ['character-swing-sword'] = love.graphics.newImage('graphics/Characters/Player/character_swing_sword.png'),

    --entities taken from CS50
    ['entities'] = love.graphics.newImage('graphics/Animals/entities.png')
}

gameAnimals = {
    -- passive
    ['BrownPuffball'] = love.graphics.newImage('graphics/Animals/BrownPuffball.png')
    -- neutral

    -- aggressive
}
-- frames --
gameFrame = {
    -- nature tiles
    ['tiles'] = GenerateQuads(gameTextures['tiles'],16,16),
    -- player things
    ['character-walk'] = GenerateQuads(gameTextures['character-walk'], 16, 32),
    ['character-swing-sword'] = GenerateQuads(gameTextures['character-swing-sword'], 32, 32),
    
    ['entities'] = GenerateQuads(gameTextures['entities'], 16, 16),

    -- Animals
    ['BrownPuffball'] = GenerateQuads(gameAnimals['BrownPuffball'], 32, 32)
}

-- Fonts --
gameFonts = {
    ['talkFont'] = love.graphics.newFont("fonts/KokFont-Regular.ttf", 16),
    [' bigfont'] = love.graphics.newFont("fonts/KokFont-Regular.ttf",32)
}

-- music --

gameMoosic = {
    ['startScreen'] = love.audio.newSource('sounds/mainMenu.wav',"stream"),
    ['newGame'] = love.audio.newSource('sounds/newGame.wav',"stream"),
    ['standardGame'] = love.audio.newSource('sounds/gameMusicStandard.wav',"stream")

}

-- other sounds --
