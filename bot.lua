local discordia = require('discordia')
local client = discordia.Client()
local basicCommands = require("./basicCommands.lua")
local tools = require("./tools.lua")
local rng = require("./rng.lua")

client:once("ready", function()
  client:setGame("Astoria's bot, very sad!")
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
  if tools.messageDectection(message, "lenny") == true then
    message.channel:send("( ͡° ͜ʖ ͡°)")
  end
end)

client:on('messageCreate', function(message)
	if tools.messageDectection(message, "ping") == true then
		message.channel:send('Pong!')
	end
end)

client:on('messageCreate', function(message)
	if tools.messageDectection(message, "ThemHelp") == true then
    message.channel:send(tools.printFile("docs/help"))
	end
end)

client:on('messageCreate', function(message)
	if tools.messageDectection(message, "roll") == true then
    message.channel:send(rng.d20())
	end
end)
--[[
client:on('messageCreate', function(message)
	if message.content == '!time' then
		message.channel:send('The current time in military time is ' .. os.date() .. ', atleast in Chicago!')
	end
end)
]]

--Replacing the above with a more tolerant version
client:on('messageCreate', function(message)
  if tools.messageDectection(message, "time") == true then
    message.channel:send('The current time in military time is ' .. os.date() .. ' atleast in Chicago!')
  end
end)

client:on('messageCreate', function(message)
  if tools.messageDectection(message, "moduleTest") == true then
    message.channel:send(basicCommands.helloWorld())
  end
end)

client:run('Bot ODczMjU1Mjk2MDI0MzIyMDU5.YQ1wXg.BbXq1fu-4nlG95EkLkHujVEObG4')
