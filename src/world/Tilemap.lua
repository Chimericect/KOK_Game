--[[ TILEMAP

Author: Marissa Lewinski
Done as a senior project at kalamazoo college 2021
]]-- 
Tilemap = Class{}

function Tilemap:init(width,height)
        self.tiles = {} --array with the tiles
        self.width = width -- need le width 
        self.height = height -- and le height
end

function Tilemap:render()
    -- for every x and y, render the tiles
    for y = 1, self.height do
        for x = 1, self.width do
            self.tiles[y][x]:render()
        end
    end
end