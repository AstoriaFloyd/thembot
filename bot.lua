local discordia = require('discordia')
local client = discordia.Client()
Tools = dofile("./API/tools.lua")
discordia.extensions()

--Setup bot here, initializes bot
client:once("ready", function()
  client:setGame("Astoria's bot, very sad!")
	print('Logged in as '.. client.user.username)
    Commands = Tools.initialize()
    if Tools.testModeDetection() == true then
        mode = "test"
    else
        mode = "normal"
    end
end)

--Command handler
client:on('messageCreate', function(message)
    if message.author.bot then return end
    local shouldReinit = false
    if Tools.testModeDetection() == true and mode == "normal" then
        mode = "test"
        shouldReinit = true
    elseif Tools.testModeDetection() == false and mode == "test" then
        mode = "normal"
        shouldReinit = false
    end
    if mode == "test" then
        shouldReinit = true
    end
    if dofile("./docs/reinitialize.lua") == true then
        Commands = Tools.initialize()
        Tools = dofile("./API/tools.lua")
    end
    if mode == "normal" and Tools.messageDectection(message, "reinitialize") == true then
        p("reinitd at "..os.time())
        reinitialize(message)
    elseif mode == "test" and Tools.messageDectection(message, "reinitialize") == true then
        message:reply("You cannot preform this command because test is on!")
        p("Not reinitd at "..os.time())
    end
    local args = message.content:split(" ")
    local lowerArgs = args[1]:lower()
    local command = Commands[lowerArgs]
    if command then
        if shouldReinit == true then
            Commands = Tools.initialize()
            Tools = dofile("./API/tools.lua")
            command = Commands[lowerArgs]
            p("reinitd at "..os.time())
            shouldReinit = false
        end
        command.exec(message, args)
    end
end)

function reinitialize(message)
  local user = message.guild:getMember(message.author.id)
    if Tools.messageDectection(message, "reinitialize") == true then
        if not user:hasPermission("administrator") then
            message:reply("You cannot re-initialize this bot!")
        else
            Commands = Tools.initialize()
            Tools = dofile("./API/tools.lua")
            message:reply("Re-Initialized!")
        end
    end
end

function selfReinitialize()
    Commands = Tools.initialize()
    Tools = dofile("./API/tools.lua")
end

--When a user is banned, post a lenney.
client:on('userBan', function()
  local banChannel, err = client:getChannel("872283716486066200")
  if not banChannel then
    p("Attempt to fetch the channel object: ", err)
    return
  end
  banChannel:send("User was banned ( ͡° ͜ʖ ͡°)")
end)

--Insert Token in a .lua file with simply returns it as a string.
local token = require("./docs/token.lua")
client:run('Bot '..token)
-- This project is libre, and licenced under the terms of the
-- DO WHAT THE FUCK YOU WANT TO PUBLIC LICENCE, version 3.1,
-- as published by dtf on July 2019. See the COPYING file or
-- https://ph.dtf.wtf/w/wtfpl/#version-3-1 for more details.