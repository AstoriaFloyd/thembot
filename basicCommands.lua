local basicCommands = {}

function basicCommands.helloWorld()
  return("Hello world!")
end

function basicCommands.figlet(string)
  local figleted = io.popen("figlet ".. string)
  local result = figleted:read("*all")
  return result
end

return basicCommands
