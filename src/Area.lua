--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Area = Class{}

function Area:init(player)
    self.player = player

    self.rooms = {}

    -- current room we're operating in
    self.currentRoom = FirstLoc(self.player)

    -- room we're moving camera to during a shift; becomes active room afterwards
    self.nextRoom = nil

    -- love.graphics.translate values, only when shifting screens
    self.cameraX = 0
    self.cameraY = 0
    self.shifting = false

    -- trigger camera translation and adjustment of rooms whenever the player triggers a shift
    -- via a doorway collision, triggered in PlayerWalkState
    Event.on('shift-left', function()
        self:beginShifting(-VIRTUAL_WIDTH, 0)
    end)

    Event.on('shift-right', function()
        self:beginShifting(VIRTUAL_WIDTH, 0)
    end)

    Event.on('shift-up', function()
        self:beginShifting(0, -VIRTUAL_HEIGHT)
    end)

    Event.on('shift-down', function()
        self:beginShifting(0, VIRTUAL_HEIGHT)
    end)
end

--[[
    Prepares for the camera shifting process, kicking off a tween of the camera position.
]]
function Area:beginShifting(shiftX, shiftY)
    self.shifting = true
    self.nextRoom = FirstLoc(self.player)

    self.nextRoom.adjacentOffsetX = shiftX
    self.nextRoom.adjacentOffsetY = shiftY

    -- tween the camera in whichever direction the new room is in, as well as the player to be
    -- at the opposite door in the next room, walking through the wall (which is stenciled)
    Timer.tween(1, {
        [self] = {cameraX = shiftX, cameraY = shiftY},
        [self.player] = {x = playerX, y = playerY}
    }):finish(function()
        self:finishShifting()

        -- reset player to the correct location in the room
        if shiftX < 0 then
            self.player.x = MAP_RENDER_OFFSET_X + (MAP_WIDTH * TILE_SIZE) - TILE_SIZE - self.player.width
            self.player.direction = 'left'
        elseif shiftX > 0 then
            self.player.x = MAP_RENDER_OFFSET_X + TILE_SIZE
            self.player.direction = 'right'
        elseif shiftY < 0 then
            self.player.y = MAP_RENDER_OFFSET_Y + (MAP_HEIGHT * TILE_SIZE) - TILE_SIZE - self.player.height
            self.player.direction = 'up'
        else
            self.player.y = MAP_RENDER_OFFSET_Y + self.player.height / 2
            self.player.direction = 'down'
        end

    end)
end

--[[
    Resets a few variables needed to perform a camera shift and swaps the next and
    current room.
]]
function Area:finishShifting()
    self.cameraX = 0
    self.cameraY = 0
    self.shifting = false
    self.currentRoom = self.nextRoom
    self.nextRoom = nil
    self.currentRoom.adjacentOffsetX = 0
    self.currentRoom.adjacentOffsetY = 0 
end

function Area:update(dt)
    -- pause updating if we're in the middle of shifting
    if not self.shifting then    
        self.currentRoom:update(dt)
    else
        -- still update the player animation if we're shifting rooms
        self.player.currentAnimation:update(dt)
    end
end

function Area:render()
    -- translate the camera if we're actively shifting
    if self.shifting then
        love.graphics.translate(-math.floor(self.cameraX), -math.floor(self.cameraY))
    end

    self.currentRoom:render()
    
    if self.nextRoom then
        self.nextRoom:render()
    end
end