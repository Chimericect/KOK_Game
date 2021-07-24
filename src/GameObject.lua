--[[
    Author: Colton Ogden of CS50
    Edited by Marissa Lewinski for the game KOK
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    --identifying object type
    self.type = def.type

    -- texture
    self.texture = def.texture
    self.frame = def.frame or 1

    -- is it an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    -- for potential collision 
    self.onCollide = function() end
end

function GameObject:update(dt)
    -- dis be empty
end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    love.graphics.draw(gameTextures[self.texture], gameFrame[self.texture][self.states[self.state].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end