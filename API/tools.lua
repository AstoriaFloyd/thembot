---@diagnostic disable: undefined-global
local tools = {}

--initializes or re-initializes the seed of RNG, based on Unix Time.
function tools.seed()
    local seed = os.time()
    math.randomseed(seed)
end

--Initializes commands.
function tools.initialize()
    if tools.testModeDetection() == false then
        local simpleCommands = dofile("./commands/simpleCommands.lua")
        local complexCommands = dofile("./commands/complexCommands.lua")
        local complexCommands = complexCommands.initialize()
        local simpleCommands = simpleCommands.initialize()
        local commands = tools.tableMerge(simpleCommands, complexCommands)
        return commands
    end
    if tools.testModeDetection() == true then
        local simpleCommands = dofile("./commands/simpleCommands.lua")
        local complexCommands = dofile("./commands/complexCommands.lua")
        local experimentalCommands = dofile("./commands/experimentalCommands.lua")
        local simpleCommands = simpleCommands.initialize()
        local complexCommands = complexCommands.initialize()
        local experimentalCommands = experimentalCommands.initialize()
        local commandsP1 = tools.tableMerge(simpleCommands, complexCommands)
        local commands = tools.tableMerge(commandsP1, experimentalCommands)
        return commands
    end
end

--Reads testmode.lua
function tools.testModeDetection()
    return dofile("./docs/testmode.lua")
end

--

--Reads an entire file, outputs as string.
function tools.printFile(file)
    local rawFile = io.open(file, r)
    local message = rawFile:read("*all")
    rawFile:close()
    return message
end

function tools.tableConcat(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

function tools.tableMerge(t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                tools.tableMerge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

--Message detection logic. If string.find detects both the desired string, and the key, starting at position 1, do the thing.
--Now deprecated
function tools.messageDectection(message, search)
    local distinctMessage = string.lower(message.content)
    local key = dofile("./docs/key.lua")
    local keyedSearch = key .. search
    if string.find(distinctMessage, keyedSearch) == 1 then
      return true
    else
        return false
    end
end

--Special message detection logic. If string.find detects both the desired string, do the thing. Useful for chat filers.
function tools.messageDectectionAnywhere(message, search)
    local distinctMessage = string.lower(message.content)
    if string.find(distinctMessage, search) ~= nil then
      return true
    else
        return false
    end
end

--Executes Figlet on the host machine.
function tools.figlet(string)
    local figleted = io.popen("figlet ".. string)
    local result = figleted:read("*all")
    return result
  end
  
  --Executes Cowsay on the host machine.
  function tools.cowsay(string)
    local cowsaid = io.popen("cowsay ".. string)
    local result = cowsaid:read("*all")
    return result
  end
  
  --Takes input and makes it output. GIGO.
  function tools.echo(string)
    return string
  end

return tools
-- This project is libre, and licenced under the terms of the
-- DO WHAT THE FUCK YOU WANT TO PUBLIC LICENCE, version 3.1,
-- as published by dtf on July 2019. See the COPYING file or
-- https://ph.dtf.wtf/w/wtfpl/#version-3-1 for more details.