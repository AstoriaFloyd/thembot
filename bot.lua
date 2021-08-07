local discordia = require('discordia')
local client = discordia.Client()
local tools = require("./tools.lua")
discordia.extensions()

local simpleCommands = require("./simpleCommands.lua")
local complexCommands = require("./complexCommands.lua")

--Initialize commands, CLEAN THIS UP, MAKE IT DO MORE THEN TWO, CURRENTLY WE NEED TO JUST DO THIS OVER AND OVER
local complexCommands = complexCommands.initialize()
local simpleCommands = simpleCommands.initialize()
local commands = tools.tableMerge(simpleCommands, complexCommands)

--Setup bot here, initializes bot
client:once("ready", function()
  client:setGame("Astoria's bot, very sad!")
	print('Logged in as '.. client.user.username)
end)

--Command handler
client:on('messageCreate', function(message)
  if message.author.bot then return end
  local args = message.content:split(" ")
  local command = commands[args[1]]
  if command then
    command.exec(message)
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