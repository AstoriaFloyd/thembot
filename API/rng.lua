local rng = {}
local tools = dofile("./API/tools.lua")

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

function rng.roll(arg)
     tools.seed()
     local mathArgument = arg[2]
     local compareNumber = tonumber(mathArgument)
     local dice = math.random(mathArgument)
     local messagePart1 = ('You rolled a ' .. dice .. ' out of '..mathArgument)
     local messagepart2 = ''
     if dice == compareNumber then
          messagepart2 = ('Nat '..mathArgument..'! Crititcal Hit')
     else if dice==1 then
          messagepart2 = ('Nat 1! Critical Shit!')
     end
     end
     local message = messagePart1 .. '\n' .. messagepart2
     return message
 end

return rng
-- This project is libre, and licenced under the terms of the
-- DO WHAT THE FUCK YOU WANT TO PUBLIC LICENCE, version 3.1,
-- as published by dtf on July 2019. See the COPYING file or
-- https://ph.dtf.wtf/w/wtfpl/#version-3-1 for more details.