--[[
    This is the KOK main file. Will have to be refactored at a later time.
    
    Author: Marissa Lewinski
    marissa.lewinski@yahoo.com

    Written as a senior project for K college, and a personal introduction into
    creating video games as well as learning Lua. Done with the help of tutorials
    and Colton Ogden (indirectly) in the harvard course CS50.

    This class is finished and should not be tampered with!
]] 
require 'src/Dependencies'

buttons = {};

function love.load()
     -- set the title of the game
     love.window.setTitle('Kingdoms of Kiobos')
     -- makes the rendering look nicer
     love.graphics.setDefaultFilter('nearest', 'nearest')
     -- "seed" the RNG so that calls to random are always random
     math.randomseed(os.time())

     -- Set up the screen
     push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
    
    gameStates = StateStack()
    -- successfully pushes the startState
    gameStates:push(StartState())

   love.keyboard.keysPressed = {}
end

-- RESIZE THING
function love.resize(w, h)
    push:resize(w, h)
end

-- PRESSING A KEY STUFF
function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        -- function to terminate application
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    Timer.update(dt)
    gameStates:update(dt)

    gameStates:render()
    love.keyboard.keysPressed = {}
end

function love.draw()
   push:start()
   gameStates:render()
   push:finish()
end
