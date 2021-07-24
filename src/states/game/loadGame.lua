
loadGame = Class{__includes = BaseState} -- EQUIV to PlayState

--load game initializing
    function loadGame:init() 
        -- get more game music to loop
        gameMoosic['standardGame']:setLooping(true)
        -- then play
        gameMoosic['standardGame']:play()

        -- and the player
        self.player = Player {
            animations = ENTITY_DEFS['player'].animations,
            walkSpeed = ENTITY_DEFS['player'].walkSpeed,

            x = VIRTUAL_WIDTH / 2 - 8,
            y = VIRTUAL_HEIGHT / 2 - 11,

            mapX = 10,
            mapY = 10,

            width = 16,
            height = 22,

            health = 100,

            -- rendering and collision offset for spaced sprites
            offsetY = 5
        }

        self.area = FirstLoc(self.player)
        self.currentRoom = FirstLoc(self.player)

        self.player.stateMachine = StateMachine {
            ['walk'] = function() return PlayerWalkState(self.player, self.area) end,
            ['idle'] = function() return PlayerIdleState(self.player) end,
            ['swing-sword'] = function() return PlayerSwingSwordState(self.player, self.area) end
        }
        self.player.stateMachine:change('idle') -- THIS BREAKS IT RIGHT NOW
        --gameStates:push(FirstLoc(self.player))
    end


function loadGame:update(dt) 
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    self.area:update(dt)
end

function loadGame:enter(params) 
    -- nada
end

function loadGame:exit() 

end

function loadGame:render() 
    love.graphics.push()
    self.area:render()
    love.graphics.pop()
end
