--require 'src/Dependencies'

-- When we start we want the player to be greeted with a main menu

StartState = Class{__includes = BaseState}

------------------------------------------------------------------------------------------------------
-- the size of the button
BUTTON_HEIGHT = 64
-- Think of game in smaller size, but preserve the size above
VIRTUAL_WIDTH = 700
VIRTUAL_HEIGHT = 600

-- Table for the buttons and other important variables
    buttons = {};
    font = nil;
    Startbackground = nil;

------------------------------------------------------------------------------------------------------
-- the buttons that appear on the main menu
function aButton(text, someFunction)
    -- return a table
    return 
    {
        -- the text on the button that will be displayed
        text = text,
        -- each button will return some function to do a thing. 
        someFunction = someFunction,

        -- booleans to register click once.
        now = false,
        last = false
    }
end


------------------------------------------------------------------------------------------------------
function StartState:init()
    -- Music? Music. Even if it's temporary probably. 
    gameMoosic['startScreen']:setLooping(true)
    gameMoosic['startScreen']:play()

    --initialize the starting background and the font
    Startbackground = love.graphics.newImage('graphics/background.png')
    font = love.graphics.newFont("fonts/KokFont-Regular.ttf",40)

    
   
    -- insert the buttons into the table. DO NOT MOVE THIS OUT OF INIT.
        table.insert(buttons, aButton(
        -- text   
            "Continue journey",
        -- function to be passed
            function()
                -- once you hit the button, stop the screen music
                gameMoosic['startScreen']:stop()
                -- pop the menu state from the stack
                gameStates:pop()
                -- push the new game state onto the stack
                gameStates:push(loadGame())
            end))

        table.insert(buttons, aButton(
        -- text
            "New journey",
        -- function to be passed
            function()
                -- TO DO: CHECK IF THE USER IS POSITIVE THEY WANNA START NEW GAME

                --  once you affirm that you are ready, stop the screen music
                gameMoosic['startScreen']:stop()
                -- pop the menu state from the stack
                gameStates:pop()
                -- push the new game state onto the stack
                gameStates:push(newGame())
            end))
    
        table.insert(buttons, aButton(
        -- text
            "Settings",
        -- funciton to be passed
            function()
                -- Don't really need to stop the music here
                -- just pop the menu state
                gameStates:pop()
                -- and push the new settings state
                gameStates:push(Settings())
            end))

        table.insert(buttons, aButton(
            "Exit the Kingdoms",
            function()
                -- time to yeet the program
                love.event.quit(0)
            end))
end 

function StartState:enter(params)
    -- nada goes here!
end 
--------------------------------------------------------------------------------------------------------------
function StartState:render()

    --this will get the size of the window; needed to center the buttons
        button_width = love.graphics.getWidth() * (1/3)
        -- variables. Don't move these
        -- Get the width of the button, if we scale the window we can also scale the button
        margin = 16
        total_height = (BUTTON_HEIGHT + margin) * #buttons
    
        local sx = VIRTUAL_WIDTH / Startbackground:getWidth()
        local sy = VIRTUAL_HEIGHT / Startbackground:getHeight()

        cursor_y = 0

    -- background image. DO NOT REMOVE SETCOLOR.
        love.graphics.setColor(1,1,1,1)
        --drawing it
        love.graphics.draw(Startbackground, 0, 0, 0, sx, sy)
    ------------------ draw the buttons --------------------------------------------------------------------
        -- buttons; for each button in the button array we do some stuff
        -- get the index and the button 
    for i, button in ipairs(buttons) do
        buttonX = (VIRTUAL_WIDTH * 0.5) - (button_width * 0.5)
        buttonY = (VIRTUAL_HEIGHT * 0.5) - (total_height * 0.5) + cursor_y
            -- reset states
            button.last = button.now

        regColor = { 0.4,0.4,0.4,1.0 }
        mouseX, mouseY = love.mouse.getPosition()

        -- Check if the mouse interects with the button. NEEDS TO BE FIXED
            hovered = mouseX > buttonX and mouseX < buttonX + button_width and 
                      mouseY > buttonY and mouseY < buttonY + BUTTON_HEIGHT
            -- if the mouse is hovered over the button then change the color so we know it acknowledges it
                if hovered then
                    regColor = {0.8,0.8,0.8,1.0}
                end  
            
            button.now = love.mouse.isDown(1)
            if button.now and not button.last and hovered then
                button.someFunction()
            end 

        -- Actually draw the buttons
            love.graphics.setColor(unpack(regColor))
            love.graphics.rectangle( 
                "fill",
                buttonX,
                buttonY,
                button_width,
                BUTTON_HEIGHT)

        -- WORDS
            love.graphics.setColor(0,0,0,1)
         -- Need font text in pixels so we can center
            textWidth = font:getWidth(button.text)
            textHeight = font:getHeight(button.text)
            love.graphics.print(
                button.text,
                font,
               (VIRTUAL_WIDTH * 0.5) - textWidth * 0.5,
               buttonY + textHeight * 0.5
            )

            cursor_y = cursor_y + (BUTTON_HEIGHT + margin)
    end
end

------------------------------------------------------------------------------------------------------
-- this is fine for now don't touch it 
function StartState:update(dt)
   
    
end