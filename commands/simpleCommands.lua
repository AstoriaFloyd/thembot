local basicCommands = {}
local prefix = dofile("./docs/settings.lua")

local commands = { -- Define commands its a table that will contain our commands
[prefix..'lenny'] = { -- Creates a lenny face
   exec = function (message)
        message.channel:send('( ͡° ͜ʖ ͡°)') 
    end
    };
[prefix..'glomp'] = { -- Posts an image of glomping, may add RNG later.
   exec = function (message)
        message.channel:send('https://tenor.com/view/tv-shows-television-tackle-hug-hug-glomping-gif-14859564') 
    end
    };
[prefix..'ping'] = { -- Ping Pong function, generally just to see if its on or not without triggering a more complex function. Also tests if its really borked.
   exec = function (message)
        message.channel:send("Pong!")
    end
    };
[prefix..'fire'] = { -- Places elmo on fire in chat.
   exec = function (message)
        message.channel:send("https://tenor.com/view/elmo-fire-burn-flame-gif-5042503")
    end
    };

[prefix..'time'] = { -- Posts time to channel, stuck in military time, perhaps use a io.popen() to get actual system time in a more human readable format?
   exec = function (message)
        message.channel:send('The current time in military time is ' .. os.date() .. ' atleast in Chicago!')
    end
    };
[prefix..'analyze'] = { -- Prints contents and attachments to console.
   exec = function (message)
        p(message.content)
        p(message.attachments)
    end
    };
[prefix..'welsh'] = { -- Welsh.
   exec = function (message)
        message.channel:send("https://cdn.discordapp.com/attachments/748713417489252503/770289379586867231/image0.gif")
        message:delete()
    end
    };
}


function basicCommands.initialize()
  return commands
  end
return basicCommands
-- This project is libre, and licenced under the terms of the
-- DO WHAT THE FUCK YOU WANT TO PUBLIC LICENCE, version 3.1,
-- as published by dtf on July 2019. See the COPYING file or
-- https://ph.dtf.wtf/w/wtfpl/#version-3-1 for more details.