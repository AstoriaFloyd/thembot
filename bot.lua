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
  if tools.messageDectection(message, "glomp") == true then
    message.channel:send("https://tenor.com/view/tv-shows-television-tackle-hug-hug-glomping-gif-14859564")
  end
end)

client:on('messageCreate', function(message)
  if message.author.bot then return end
  if tools.messageDectectionAnywhere(message, "gif") == true then
    message.channel:send("GIF IS PRONOUNCED WITH A HARD G, ITS NOT JIF OR YIFF")
  end
end)

client:on('messageCreate', function(message)
	if tools.messageDectection(message, "ping") == true then
		message.channel:send('Pong!')
	end
end)

client:on('messageCreate', function(message)
	if tools.messageDectection(message, "fire") == true then
		message.channel:send('https://tenor.com/view/elmo-fire-burn-flame-gif-5042503')
	end
end)

client:on('messageCreate', function(message)
	if tools.messageDectection(message, "helpme") == true then
    message.channel:send(tools.printFile("docs/help"))
	end
end)

client:on('messageCreate', function(message)
	if tools.messageDectection(message, "roll") == true then
    message.channel:send(rng.d20())
	end
end)

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
