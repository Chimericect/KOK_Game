--[[ 
    KOK

    Author: Marissa Lewinski
]]

-- This is going to be the first location the player will start in for now
FirstLoc = Class{} -- equiv to ROOM

function FirstLoc:init(player)
    self.tileWidth = 50 -- MAP_WIDTH
    self.tileHeight = 50 -- MAP_HEIGHT

    self.baseLayer = Tilemap(self.tileWidth, self.tileHeight)
    self.pathLayer = Tilemap(self.tileWidth, self.tileHeight)

    self:generateFloor()

-- generate animals in the location
        self.entities = {}
        self:generatePassiveEntities()

-- and the objects in the location (none yet)
        self.buildings = {}
        self:generateBuildings() 
    
    self.player = player

    -- used for centering the area rendering
    self.renderOffsetX = MAP_RENDER_OFFSET_X
    self.renderOffsetY = MAP_RENDER_OFFSET_Y

    -- used for drawing when this room is the next room, adjacent to the active
    self.adjacentOffsetX = 0
    self.adjacentOffsetY = 0
    
end

-- generate the animals that the player will interact with in the demo
function FirstLoc:generatePassiveEntities()
    -- Hold the names of the animals that we are generating
    local passiveAnimals = { 'Brown_Puffball' }

    for i = 1, 10 do
        local type = passiveAnimals[math.random(#passiveAnimals)]

        table.insert(self.entities, Entity {
            animations = PASSIVE_ANIMAL_DEFS[type].animations,
            walkSpeed = PASSIVE_ANIMAL_DEFS[type].walkSpeed or 20,

            -- ensure X and Y are within bounds of the map
            x = math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                VIRTUAL_WIDTH - TILE_SIZE * 2 - 16),
            y = math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 16),
            
            width = 32,
            height = 32,

            health = 1
        })

        self.entities[i].stateMachine = StateMachine {
            ['walk'] = function() return EntityWalkState(self.entities[i]) end,
            ['idle'] = function() return EntityIdleState(self.entities[i]) end
        }

        self.entities[i]:changeState('walk')
    end
end

-- generate the floors
function FirstLoc:generateFloor()
    -- for each x and y we will give a tile. THIS WORKS FINE NO TOUCH
    for y = 1, self.tileHeight do
        table.insert(self.baseLayer.tiles, {})
        
        for x = 1, self.tileWidth do
            local id = TILE_IDS['Grass_tiles'][math.random(#TILE_IDS['Grass_tiles'])]
            table.insert(self.baseLayer.tiles[y], Tile(x, y, id))
        end
    end

    -- paths? Will generate for full map, but gotta figure out how to get one line of path / to get it to stop
    for y = 1, self.tileHeight do
        table.insert(self.pathLayer.tiles, {})

        for x = 1, self.tileWidth do
            local id = TILE_IDS['Floor_tiles']

            table.insert(self.pathLayer.tiles[y], Tile(x, y, id))
        end
    end

end

-- generate objects / buildings
function FirstLoc:generateBuildings()
    table.insert(self.buildings,GameObject(
        GAME_OBJECT_DEFS['Dekoda_Greenery'], 142,164
    ))
end

function FirstLoc:update(dt)-- don't update anything if we are sliding to another room (we have offsets)
    if self.adjacentOffsetX ~= 0 or self.adjacentOffsetY ~= 0 then return end

    --update the player
    self.player:update(dt)

    for i = #self.entities, 1, -1 do
        local entity = self.entities[i]
    
        -- if the entitiys health is at zero then they dead
        if entity.health <= 0 then
            entity.dead = true
        elseif not entity.dead then
            entity:processAI({room = self}, dt)
            entity:update(dt)
        end 
    end 
end


function FirstLoc:enter()
end


function FirstLoc:render()
    self.baseLayer:render()
    -- RENDER THE PLAYER
    self.player:render()

     -- render the entities. If they aren't dead
     for k, entity in pairs(self.entities) do
        if not entity.dead then entity:render(self.adjacentOffsetX, self.adjacentOffsetY) end
    end
    
    --Render the Buildings
    for k, building in pairs(self.buildings) do
        building:render(self.adjacentOffsetX, self.adjacentOffsetY)
    end
    
    
end

