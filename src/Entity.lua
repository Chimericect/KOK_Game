--[[
    Author: Colton Ogden of CS50
    Edited by Marissa Lewinski for the game KOK

]]

Entity = Class{}

function Entity:init(def)
    -- init the original direction.
        self.direction = 'down'

        -- create animations is a function later on! call it on itself
        self.animations = self:createAnimations(def.animations)

    -- init the dimensions of the character ( each varies )
        self.x = def.x -- this x is equal to the x coordinate of the current entity
        self.y = def.y -- this y is equal to the y coordinate of the current entity
        self.width = def.width
        self.height = def.height

        -- drawing offsets for padded sprites
        self.offsetX = def.offsetX or 0
        self.offsetY = def.offsetY or 0

    -- standard stat stuff. 
        self.walkSpeed = def.walkSpeed
        self.health = def.health 
        self.dead = false -- need to know if dead or not

    -- flashing entity when they are hit in battle
        self.invulnerable = false
        self.invulnerableDuration = 0
        self.invulnerableTimer = 0
        self.flashTimer = 0
    -- init other things later

end

function Entity:createAnimations(animations)
    -- Array to hold the frames
    local animationSet = {}

    -- loop through all of them contained in the animation section
    -- for each animationStuff in animations (in init)
    for k, animationStuff in pairs(animations) do
        animationSet[k] = Animation {
            texture = animationStuff.texture or 'entities',
            frames = animationStuff.frames,
            interval = animationStuff.interval
        }
    end

    --return the above set
    return animationSet
end

--[[
    Called when we interact with this entity, as by pressing enter.
]]
function Entity:onInteract()

end

function Entity:collides(target)
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                self.y + self.height < target.y or self.y > target.y + target.height)
end

-- for battling
    function Entity:damage(dmg)
        self.health = self.health - dmg
    end

    function Entity:goInvulnerable(duration)
        self.invulnerable = true
        self.invulnerableDuration = duration
    end

function Entity:changeState(name)
    self.stateMachine:change(name)
end

function Entity:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end

function Entity:update(dt)
-- invulnerability when battling
if self.invulnerable then
    self.flashTimer = self.flashTimer + dt
    self.invulnerableTimer = self.invulnerableTimer + dt

    if self.invulnerableTimer > self.invulnerableDuration then
        self.invulnerable = false
        self.invulnerableTimer = 0
        self.invulnerableDuration = 0
        self.flashTimer = 0
    end
end

    self.stateMachine:update(dt)

    if self.currentAnimation then
        self.currentAnimation:update(dt)
    end
end

-- AI things. Aka battling and walking
function Entity:processAI(params, dt)
    self.stateMachine:processAI(params, dt)
end

-- render the entity
function Entity:render(adjacentOffsetX, adjacentOffsetY)
     -- draw sprite slightly transparent if invulnerable every 0.04 seconds
     if self.invulnerable and self.flashTimer > 0.06 then
        self.flashTimer = 0
        love.graphics.setColor(255, 255, 255, 64)
    end
    
    self.x, self.y = self.x + (adjacentOffsetX or 0), self.y + (adjacentOffsetY or 0)
    self.stateMachine:render()
    love.graphics.setColor(255, 255, 255, 255)
    self.x, self.y = self.x - (adjacentOffsetX or 0), self.y - (adjacentOffsetY or 0)
end