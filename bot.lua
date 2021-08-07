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
  if tools.messageDectection(message, "analyze") == true then
    print(message.content)
    print(message.attachments)
  end
end)

client:on('messageCreate', function(message)
  if tools.messageDectection(message, "figlet ") == true then
    local figletthis = string.sub(message.content, 9)
    local figlet = basicCommands.figlet(figletthis)
    local result = "```fix" .. "\n" .. figlet .. "```"
    message.channel:send(result)
  end
end)

client:on('messageCreate', function(message)
  if tools.messageDectection(message, "cowsay ") == true then
    local cowsay = string.sub(message.content, 9)
    local cowsaid = basicCommands.cowsay(cowsay)
    local result = "```fix" .. "\n" .. cowsaid .. "```"
    message.channel:send(result)
  end
end)

client:on('messageCreate', function(message)
  if tools.messageDectection(message, "welsh") == true then
    image = "https://cdn.discordapp.com/attachments/748713417489252503/770289379586867231/image0.gif"
    message.channel:send(image)
    message:delete()
  end
end)

client:run('Bot ODczMjU1Mjk2MDI0MzIyMDU5.YQ1wXg.BbXq1fu-4nlG95EkLkHujVEObG4')
