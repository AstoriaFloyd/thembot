local discordia = require('discordia')
local client = discordia.Client()
local basicCommands = require("./basicCommands.lua")
local tools = require("./tools.lua")
local rng = require("./rng.lua")
--Setup bot here, initializes bot
client:once("ready", function()
  client:setGame("Astoria's bot, very sad!")
	print('Logged in as '.. client.user.username)
end)
--Everything past this point is commands, initialized here in bot.lua, but its good practise to have the actual functions outside, may be converted to one main call. May be laggier that way, but less cluttered. Perhaps a table?

--Creates a lenny face
client:on('messageCreate', function(message)
  if tools.messageDectection(message, "lenny") == true then
    message.channel:send("( ͡° ͜ʖ ͡°)")
    message:delete()
  end
end)

--Posts an image of glomping, may add RNG later.
client:on('messageCreate', function(message)
  if tools.messageDectection(message, "glomp") == true then
    message.channel:send("https://tenor.com/view/tv-shows-television-tackle-hug-hug-glomping-gif-14859564")
  end
end)

--Every time someone says "gif" or some varient of that, often in gifs themselves, it pastes that text. May replace with a copypasta.
client:on('messageCreate', function(message)
  if message.author.bot then return end
  if tools.messageDectectionAnywhere(message, "gif") == true then
    message.channel:send("GIF IS PRONOUNCED WITH A HARD G, ITS NOT JIF OR YIFF")
  end
end)

--Ping Pong function, generally just to see if its on or not without triggering a more complex function. Also tests if its really borked.
client:on('messageCreate', function(message)
	if tools.messageDectection(message, "ping") == true then
		message.channel:send('Pong!')
	end
end)

--Places elmo on fire in chat.
client:on('messageCreate', function(message)
	if tools.messageDectection(message, "fire") == true then
		message.channel:send('https://tenor.com/view/elmo-fire-burn-flame-gif-5042503')
	end
end)

--Dumps docs/help to chat, took me forever to figure out.
client:on('messageCreate', function(message)
	if tools.messageDectection(message, "helpme") == true then
    message.channel:send(tools.printFile("docs/help"))
	end
end)

--Rolls a d20, check RNG for more info.
client:on('messageCreate', function(message)
	if tools.messageDectection(message, "roll") == true then
    message.channel:send(rng.d20())
	end
end)

--Posts time to channel, stuck in military time, perhaps use a io.popen() to get actual system time in a more human readable format?
client:on('messageCreate', function(message)
  if tools.messageDectection(message, "time") == true then
    message.channel:send('The current time in military time is ' .. os.date() .. ' atleast in Chicago!')
  end
end)

--Prints contents and attachments to console.
client:on('messageCreate', function(message)
  if tools.messageDectection(message, "analyze") == true then
    print(message.content)
    print(message.attachments)
  end
end)

--Parrots input to cowsay, then echos it to the same channel you are in.
client:on('messageCreate', function(message)
  if tools.messageDectection(message, "figlet ") == true then
    local figletthis = string.sub(message.content, 9)
    local figlet = basicCommands.figlet(figletthis)
    local result = "```fix" .. "\n" .. figlet .. "```"
    message.channel:send(result)
  end
end)

--Parrots input to cowsay, then echos it to the same channel you are in.
client:on('messageCreate', function(message)
  if tools.messageDectection(message, "cowsay ") == true then
    local cowsay = string.sub(message.content, 9)
    local cowsaid = basicCommands.cowsay(cowsay)
    local result = "```fix" .. "\n" .. cowsaid .. "```"
    message.channel:send(result)
  end
end)

--Echo's what you said back out, in a fix codeblock. Could be against TOS.
client:on('messageCreate', function(message)
  if tools.messageDectection(message, "echo ") == true then
    local echo = string.sub(message.content, 7)
    local echoed = basicCommands.echo(echo)
    local result = "```fix" .. "\n" .. echoed .. "```"
    message.channel:send(result)
    message:delete()
  end
end)

--When anyone preforms welsh, send gif. You know the drill
client:on('messageCreate', function(message)
  if tools.messageDectection(message, "welsh") == true then
    image = "https://cdn.discordapp.com/attachments/748713417489252503/770289379586867231/image0.gif"
    message.channel:send(image)
    message:delete()
  end
end)
--Non command stuff past this line

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
