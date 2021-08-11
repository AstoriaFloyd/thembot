local discordia = require('discordia')
local client = discordia.Client()
Tools = dofile("./API/tools.lua")
discordia.extensions()

--Setup bot here, initializes bot
client:once("ready", function()
  client:setGame("Astoria's bot, very sad!")
	print('Logged in as '.. client.user.username)
    Commands = Tools.initialize()
    Mode = Tools.getMode()
end)

--Command handler
client:on('messageCreate', function(message)
    if message.author.bot then return end
    Mode = Tools.getMode()
    if Mode == "test" then
        Tools.setReinit(true)
    end
    if Mode == "normal" and Tools.getReinit() == false then
        Tools.setReinit(false)
    end
    if Mode == "normal" and Tools.messageDectection(message, "reinitialize") == true then
        reinitialize()
    elseif Mode == "test" and Tools.messageDectection(message, "reinitialize") == true then
        message:reply("You cannot preform this command because test is on!")
    end
    if Tools.getReinit() == true then
        Commands = Tools.initialize()
        Tools = dofile("./API/tools.lua")
        Tools.setReinit(false)
    end
    local args = message.content:split(" ")
    local lowerArgs = args[1]:lower()
    local command = Commands[lowerArgs]
    if command then
        command.exec(message, args)
    end
end)

---@diagnostic disable-next-line: lowercase-global
function reinitialize(message)
  local user = message.guild:getMember(message.author.id)
    if Tools.messageDectection(message, "reinitialize") == true then
        if not user:hasPermission("administrator") then
            message:reply("You cannot re-initialize this bot!")
        else
            Tools.setReinit(true)
            message:reply("Re-Initialized!")
        end
    end
end


--When a user is banned, post a lenney.
client:on('userBan', function(user, guild)
    guild.systemChannel:send("A user was banned ( ͡° ͜ʖ ͡°)")
end)

--Insert Token in a .lua file with simply returns it as a string.
local token = require("./docs/token.lua")
client:run('Bot '..token)
-- This project is libre, and licenced under the terms of the
-- DO WHAT THE FUCK YOU WANT TO PUBLIC LICENCE, version 3.1,
-- as published by dtf on July 2019. See the COPYING file or
-- https://ph.dtf.wtf/w/wtfpl/#version-3-1 for more details.