local tools = dofile("./API/tools.lua")
local rng = dofile("./API/rng.lua")
local complexCommands = {}
local prefix = dofile("./docs/key.lua")
local mode = tools.getMode()

local commands = { -- Define commands its a table that will contain our commands
[prefix..'helpme'] = { -- Dumps docs/help to chat, took me forever to figure out.
    exec = function (message)
        if mode == "test" then
            message.channel:send(tools.printFile("docs/helpTestMode"))
        else
            message.channel:send(tools.printFile("docs/help"))
        end
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

--[[
[prefix..'figlet'] = { -- Parrots input to figlet, then echos it to the same channel you are in.
    exec = function (message)
    local prefixLength = string.len(prefix)
    local figletthis = string.sub(message.content, 7+prefixLength)
    local figlet = tools.figlet(figletthis)
    local result = "```fix" .. "\n" .. figlet .. "```"
    message.channel:send(result)
    message:delete()
end
};

[prefix..'cowsay'] = { -- Parrots input to cowsay, then echos it to the same channel you are in.
    exec = function (message)
    local prefixLength = string.len(prefix)
    local cowsay = string.sub(message.content, 7+prefixLength)
    local cowsaid = tools.cowsay(cowsay)
    local result = "```fix" .. "\n" .. cowsaid .. "```"
    message.channel:send(result)
    message:delete()
end
};
]]
[prefix..'echo'] = { -- Echo's what you said back out, in a fix codeblock. Could be against TOS.
    exec = function (message)
    local prefixLength = string.len(prefix)
    local echo = string.sub(message.content, 6+prefixLength)
    local echoed = tools.echo(echo)
    local result = "```fix" .. "\n" .. echoed .. "```"
    if result == "```fix\n```" then message:delete() return
    else
    message.channel:send(result)
    message:delete()
    end
end
};

[prefix..'echoclean'] = { -- Echo's what you said back out, in a fix codeblock. Could be against TOS.
    exec = function (message)
    local prefixLength = string.len(prefix)
    local echo = string.sub(message.content, 11+prefixLength)
    local echoed = tools.echo(echo)
    local result = echoed
    message.channel:send(result)
    message:delete()
end
};

[prefix..'mode'] = { -- Echo's what you said back out, in a fix codeblock. Could be against TOS.
    exec = function (message, arg)
        local user = message.guild:getMember(message.author.id)
        if not user:hasPermission("administrator") then
            message:reply("You cannot change the mode of this bot!")
        else
        if not arg[2] then message.channel:send("```fix\nNo argument. Get or Set?```") return end
        if arg[2] ~= "get" and arg[2] ~= "set" then message.channel:send("```fix\nMalformed input, you put in '"..arg[2].."' not get or set.```") return end
        if arg[2] == "get" then mode = tools.getMode() message.channel:send("```fix\nCurrent mode is '"..mode.."'```") return end
        if arg[2] == "set" then
            if arg[3] == "normal" or "test" then
                mode = tostring(arg[3])
                message.channel:send("```fix\nSet mode '"..mode.."'```")
                tools.setMode(mode)
                tools.setReinit(true)
            else
                message.channel:send("```fix\nIncorrect mode, please enter 'normal' or 'test'```")
            end
        end
    end
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
