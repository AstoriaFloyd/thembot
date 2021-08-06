local tools = {}


function tools.reseed()
    local seed = os.time()
    math.randomseed(seed)
end

function tools.printFile(file)
    local rawFile = io.open(file, r)
    local message = rawFile:read("*all")
    rawFile:close()
    return message
end

function tools.messageDectection(message, search)
    local distinctMessage = message.content
    local key = "!"
    local keyedSearch = key .. search
    if string.find(distinctMessage, keyedSearch) == 1 then
      return true
    else
        return false
    end
end
return tools