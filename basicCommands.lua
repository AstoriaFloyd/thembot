local basicCommands = {}

function basicCommands.helloWorld()
  return("Hello world!")
end

function basicCommands.figlet(string)
  local figleted = io.popen("figlet ".. string)
  local result = figleted:read("*all")
  return result
end

function basicCommands.cowsay(string)
  local cowsaid = io.popen("cowsay ".. string)
  local result = cowsaid:read("*all")
  return result
end

function basicCommands.echo(string)
  local echoed = io.popen("echo ".. string)
  local result = echoed:read("*all")
  return result
end

return basicCommands
