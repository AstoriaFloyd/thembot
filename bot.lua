local discordia = require('discordia')
local client = discordia.Client()
local tools = require("./tools.lua")
discordia.extensions()

--Setup bot here, initializes bot
client:once("ready", function()
  client:setGame("Astoria's bot, very sad!")
	print('Logged in as '.. client.user.username)
  Commands = tools.initialize()
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

client:on('messageCreate', function(message)
  if tools.messageDectection(message, "reinitialize") == true then
    Commands = tools.initialize()
    message:reply("Re-Initialized!")
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