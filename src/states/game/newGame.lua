-- [[ creating a new game in KOK
    

    
--]]

newGame = Class{__includes = BaseState}

function newGame:init() 
    -- get more game music to loop
    gameMoosic['newGame']:setLooping(true)
    -- then play
    gameMoosic['newGame']:play()

    -- create a character

    -- once the character is finished, save the game and reload? 
end
function newGame:enter() end
function newGame:exit() end
function newGame:update(dt) end
function newGame:render() end
