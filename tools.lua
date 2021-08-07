---@diagnostic disable: undefined-global
local tools = {}

--initializes or re-initializes the seed of RNG, based on Unix Time.
function tools.seed()
    local seed = os.time()
    math.randomseed(seed)
end

--Reads an entire file, outputs as string.
function tools.printFile(file)
    local rawFile = io.open(file, r)
    local message = rawFile:read("*all")
    rawFile:close()
    return message
end

--Message detection logic. If string.find detects both the desired string, and the key, starting at position 1, do the thing.
function tools.messageDectection(message, search)
    local distinctMessage = string.lower(message.content)
    local key = "!"
    local keyedSearch = key .. search
    if string.find(distinctMessage, keyedSearch) == 1 then
      return true
    else
        return false
    end
end

--Special message detection logic. If string.find detects both the desired string, do the thing. Useful for chat filers.
function tools.messageDectectionAnywhere(message, search)
    local distinctMessage = string.lower(message.content)
    if string.find(distinctMessage, search) ~= nil then
      return true
    else
        return false
    end
end

return tools