local discordia = require('discordia')
local client = discordia.Client()
seed = os.time()
math.randomseed(seed)
tabletest = {Hello, Hi, Lol}

function messageDectection(message, search)
  distinctMessage = message.content
  key = "!"
  keyedSearch = key .. search
  if string.find(distinctMessage, keyedSearch) == 1 then
    return true
  else
    return false
  end
end


function printFile(file)
  rawFile = io.open(file, r)
  message = rawFile:read("*all")
  rawFile:close()
  return message
end

client:on('messageCreate', function(message)
  if messageDectection(message, "lenny") == true then
    message.channel:send("( ͡° ͜ʖ ͡°)")
  end
end)

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
	if messageDectection(message, "ping") == true then
		message.channel:send('Pong!')
	end
end)

client:on('messageCreate', function(message)
	if messageDectection(message, "ThemHelp") == true then
    message.channel:send(printFile("docs/help"))
	end
end)

client:on('messageCreate', function(message)
	if messageDectection(message, "roll") == true then
    dice = math.random(20)
		message.channel:send('You rolled a ' .. dice .. ' out of 20')
    if dice==20 then
      message.channel:send('Nat 20! Crititcal Hit')
    else if dice==1 then
      message.channel:send('Nat 1! Critical Shit!')
    end
    end
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
  if messageDectection(message, "time") == true then
    message.channel:send('The current time in military time is ' .. os.date() .. ' atleast in Chicago!')
  end
end)


client:run('Bot ODczMjU1Mjk2MDI0MzIyMDU5.YQ1wXg.BbXq1fu-4nlG95EkLkHujVEObG4')
