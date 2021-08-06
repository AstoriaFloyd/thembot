local tools = {}


function tools.reseed()
    seed = os.time()
    math.randomseed(seed)
end

function tools.printFile(file)
    rawFile = io.open(file, r)
    message = rawFile:read("*all")
    rawFile:close()
    return message
end

function tools.messageDectection(message, search)
    distinctMessage = message.content
    key = "!"
    keyedSearch = key .. search
    if string.find(distinctMessage, keyedSearch) == 1 then
      return true
    else
        return false
    end
end
return tools