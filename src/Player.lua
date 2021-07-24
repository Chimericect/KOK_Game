--[[

    Author: Colton Ogden
    Edited by Marissa Lewinski for the game KOK
]]

Player = Class{__includes = Entity}

function Player:init(def)
    -- initialize the entity (in this case, the player)
    Entity.init(self, def)
end

function Player:update(dt)
    Entity.update(self, dt)
end


-- If the player collides with anything.
function Player:collides(target)
    local selfY, selfHeight = self.y + self.height / 2, self.height - self.height / 2
    
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                selfY + selfHeight < target.y or selfY > target.y + target.height)
end

function Player:render()
    Entity.render(self)

end