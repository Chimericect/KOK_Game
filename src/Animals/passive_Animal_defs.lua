--[[ KOK

Author: Marissa Lewinski
marissa.lewinski@yahoo.com
]]

ANIMAL_IDS = 
{
    --Puffball ID's
    'Brown Puffball', 'Blue Puffball','Black Puffball',
    'Grey Puffball', ' Albino Puffball'
}

--[[ PASSIVE CLASS ANIMAL DEFINED
Note: Puffball sizes are 32 x 32

]]--
PASSIVE_ANIMAL_DEFS = 
{
    ['Brown_Puffball'] = 
    {
        texture = 'BrownPuffball',
        -- walking around, need sprite sheet for that
        animations = {
            ['walk-down'] = {
                frames = {1,2,3,4},
                interval = 0.2
            },
            
            ['walk-right'] = {
                frames = { 5,6,7,8 },
                interval = 0.2
            },

            ['walk-left'] = {
                frames = {9,10,11,12},
                interval = 0.2
            },
            ['walk-up'] = {
                frames = {13,14,15,16},
                interval = 0.2
            },
        -- and the idle frames
            ['idle-down'] = {
                frames = {1}
            },
            ['idle-right'] = {
                frames = {5}
            },
            ['idle-left'] = {
                frames = {9}
            },
            ['idle-up'] = {
                frames = {13}
            }
           
        }

    }


}