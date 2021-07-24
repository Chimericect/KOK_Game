createCharacter = Class{__includes = BaseState}

Character = {
-- basic information
    name = nil
    gender = nil
    pronouns = nil

    land_name = nil
    first_pet = nil

-- skills
    farming = nil
    mining = nil
    foraging = nil
    fishing = nil
    battle = nil
    crafting = nil
    alchemy = nil

-- other 
}



function createCharacter:init() 
    -- first is going to be the name
        io.write('Hello! Welcome to Kiobos. What is your name?')
        local name = io.read()
    -- I want to make these able to be selected from pretty soon. Drop down menu style?
        io.write('Ah, what a nice name. It is very nice to meet you,' name '! Pardon my asking, but out of respect: what is your gender?\n')
        local gender = io.read()
        io.write('And your preferred pronouns?\n')
        local pronouns = io.read()
    -- 
        io.write('Final question, what is the name of your property?')
        io.read()
    -- initialize skills
        farming = 0
        mining = 0
        foraging = 0
        fishing = 0
        battle = 0
        crafting = 0
        alchemy = 0
end
function createCharacter:enter() end
function createCharacter:exit() end
function createCharacter:update(dt) end
function createCharacter:render() end