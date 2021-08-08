local tools = dofile("./tools.lua")
local rng = dofile("./rng.lua")
local complexCommands = {}

local prefix = dofile("./settings.lua")

local commands = { -- Define commands its a table that will contain our commands
[prefix..'helpme'] = { -- Dumps docs/help to chat, took me forever to figure out.
   exec = function (message)
        message.channel:send(tools.printFile("docs/help"))
    end
    };
[prefix..'roll'] = { -- Rolls a d20, check RNG for more info.
   exec = function (message, arg)
    if not arg[2] then
        message.channel:send(rng.d20())
    else
        message.channel:send(rng.roll(arg))
    end
    end
    };
[prefix..'figlet'] = { -- Parrots input to figlet, then echos it to the same channel you are in.
   exec = function (message)
    local prefixLength = string.len(prefix)
    local figletthis = string.sub(message.content, 7+prefixLength)
    local figlet = tools.figlet(figletthis)
    local result = "```fix" .. "\n" .. figlet .. "```"
    message.channel:send(result)
    end
    };
[prefix..'cowsay'] = { -- Parrots input to cowsay, then echos it to the same channel you are in.
   exec = function (message)
    local prefixLength = string.len(prefix)
    local cowsay = string.sub(message.content, 7+prefixLength)
    local cowsaid = tools.cowsay(cowsay)
    local result = "```fix" .. "\n" .. cowsaid .. "```"
    message.channel:send(result)
    end
    };
[prefix..'echo'] = { -- Echo's what you said back out, in a fix codeblock. Could be against TOS.
   exec = function (message)
    local prefixLength = string.len(prefix)
    local echo = string.sub(message.content, 5+prefixLength)
    local echoed = tools.echo(echo)
    local result = "```fix" .. "\n" .. echoed .. "```"
    message.channel:send(result)
    message:delete()
    end
    };
}

function complexCommands.initialize()
return commands
end
return complexCommands
-- This project is libre, and licenced under the terms of the
-- DO WHAT THE FUCK YOU WANT TO PUBLIC LICENCE, version 3.1,
-- as published by dtf on July 2019. See the COPYING file or
-- https://ph.dtf.wtf/w/wtfpl/#version-3-1 for more details.