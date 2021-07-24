--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:enter(params)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function PlayerIdleState:update(dt)
    EntityIdleState.update(self, dt)
end


function PlayerIdleState:update(dt)
    -- if we walk left by direction then set direction to left
    if love.keyboard.isDown('left') then
        self.entity.direction = 'left'
        self.entity:changeState('walk') -- and walk
    -- same goes for if we walk right...
    elseif love.keyboard.isDown('right') then
        self.entity.direction = 'right'
        self.entity:changeState('walk')
   -- up
    elseif love.keyboard.isDown('up') then
        self.entity.direction = 'up'
        self.entity:changeState('walk')
   -- or down
    elseif love.keyboard.isDown('down') then
        self.entity.direction = 'down'
        self.entity:changeState('walk')
    end

    -- as we have tools and other things, more will me initialized here
    if love.keyboard.wasPressed('space') then
        self.entity:changeState('character-swing-sword')
    end
end