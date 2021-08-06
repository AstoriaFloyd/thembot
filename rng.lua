local rng = {}
local tools = require("./tools.lua")

function rng.d20()
    tools.reseed()
    dice = math.random(20)
        messagePart1 = ('You rolled a ' .. dice .. ' out of 20')
    if dice==20 then
        messagePart2 = ('Nat 20! Crititcal Hit')
    else if dice==1 then
        messagePart2 = ('Nat 1! Critical Shit!')
    else
        messagePart2 = ""
    end
    end
    message = messagePart1 .. '\n' .. messagePart2
    return message
end

return rng