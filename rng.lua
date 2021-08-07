local rng = {}
local tools = dofile("./tools.lua")

--Rolls a d20, if output is 1, Critical miss(or Shit), if output is 20, critical hit.
function rng.d20()
    tools.seed()
    local dice = math.random(20)
    local messagePart1 = ('You rolled a ' .. dice .. ' out of 20')
    local messagepart2 = ''
    if dice==20 then
         messagepart2 = ('Nat 20! Crititcal Hit')
    else if dice==1 then
         messagepart2 = ('Nat 1! Critical Shit!')
    end
    end
    local message = messagePart1 .. '\n' .. messagepart2
    return message
end

return rng