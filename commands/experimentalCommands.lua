local tools = dofile("./API/tools.lua")
local rng = dofile("./API/rng.lua")
local experimentalCommands = {}
local prefix = dofile("./docs/key.lua")

local commands = { -- Define commands its a table that will contain our commands
[prefix..'experiment'] = {
    exec = function (message)
        message.channel:send("Experimental mode works!")
    end
};

[prefix..'test'] = { -- Test Command.
exec = function (message)
    message.channel:send("I can add new commands on the fly, probably just going to be for testing purposes. Probably a security hole. Hence why this is the _experimental_ branch")
    message:delete()
end
};

}

function experimentalCommands.initialize()
    return commands
end
return experimentalCommands
-- This project is libre, and licenced under the terms of the
-- DO WHAT THE FUCK YOU WANT TO PUBLIC LICENCE, version 3.1,
-- as published by dtf on July 2019. See the COPYING file or
-- https://ph.dtf.wtf/w/wtfpl/#version-3-1 for more details.