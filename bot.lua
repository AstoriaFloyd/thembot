local discordia = require('discordia')
local client = discordia.Client()
seed = os.time()
math.randomseed(seed)

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end
end)

client:on('messageCreate', function(message)
	if message.content == '!roll' then
    dice = math.random(20)
		message.channel:send('You rolled a ' .. dice .. ' out of 20')
    if dice==20 then
      message.channel:send('Nat 20! Crititcal Hit')
      print('nat20check')
    else if dice==1 then
      message.channel:send('Nat 1! Critical Miss!')
      print('nat1check')
    end
    end
	end
end)

client:on('messageCreate', function(message)
	if message.content == '!time' then
		message.channel:send('The current time in military time is ' .. os.date() .. ', atleast in Chicago!')
	end
end)


client:run('Bot ODczMjU1Mjk2MDI0MzIyMDU5.YQ1wXg.BbXq1fu-4nlG95EkLkHujVEObG4')
