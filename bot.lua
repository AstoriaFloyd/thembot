local discordia = require('discordia')
local client = discordia.Client()
Tools = dofile("./tools.lua")
discordia.extensions()

--Setup bot here, initializes bot
client:once("ready", function()
  client:setGame("Astoria's bot, very sad!")
	print('Logged in as '.. client.user.username)
  Commands = Tools.initialize()
end)

--Command handler
client:on('messageCreate', function(message)
  if message.author.bot then return end
  local args = message.content:split(" ")
  local lowerArgs = args[1]:lower()
  local command = Commands[lowerArgs]
  if command then
    command.exec(message, args)
  end
end)

--Re-Init detector. Only command that itself cannot be fully re-initialized
client:on('messageCreate', function(message)
  local user = message.guild:getMember(message.author.id)
    if Tools.messageDectection(message, "reinitialize") == true then
      if not user:hasPermission("administrator") then
        message:reply("You cannot re-initialize this bot!")
      else
        Commands = Tools.initialize()
        Tools = dofile("./tools.lua")
        message:reply("Re-Initialized!")
    end
  end  
end)

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
local token = require("./token.lua")
client:run('Bot '..token)
-- This project is libre, and licenced under the terms of the
-- DO WHAT THE FUCK YOU WANT TO PUBLIC LICENCE, version 3.1,
-- as published by dtf on July 2019. See the COPYING file or
-- https://ph.dtf.wtf/w/wtfpl/#version-3-1 for more details.