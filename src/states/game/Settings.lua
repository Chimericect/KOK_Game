Settings = Class{__includes = BaseState}

function Settings:init() 
-- Music? Music. Even if it's temporary probably. 
    gameMoosic['startScreen']:setLooping(true)
    gameMoosic['startScreen']:play()
end
function Settings:enter() end
function Settings:exit() end
function Settings:update(dt) end
function Settings:render() end
