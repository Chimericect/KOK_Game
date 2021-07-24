--[[
    Author: Colton Ogden of CS50
    Edited by Marissa Lewinski for the game KOK
]]

Hitbox = Class{}

function Hitbox:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end