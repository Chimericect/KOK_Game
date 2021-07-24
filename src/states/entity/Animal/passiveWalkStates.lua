--[[

]]

passiveWalkStates = Class{_includes = BaseState}

function passiveWalkStates:init() 
    self.passive = passiveAnimal
    self.passive:changeAnimation('walk-down')

    

end
function passiveWalkStates:enter() end
function passiveWalkStates:exit() end
function passiveWalkStates:update(dt) end
function passiveWalkStates:render() end
