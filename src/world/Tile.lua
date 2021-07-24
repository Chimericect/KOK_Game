--[[
    KOK

    Author: Marissa Lewinski
]]

-- Tile is its own class! It doesn't need the methods from the BaseState class so we gucci
Tile = Class{}

-- initialize the tiles. Need an x, y, and then an id
function Tile:init(x, y, id)
    self.x = x
    self.y = y
    self.id = id
end

function Tile:update(dt)
    -- love looks for an update function. Nothing here for now
end

function Tile:render()
    love.graphics.draw(gameTextures['tiles'], gameFrame['tiles'][self.id],
        (self.x - 1) * TILE_SIZE, (self.y - 1) * TILE_SIZE)
end