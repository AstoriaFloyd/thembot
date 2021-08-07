local basicCommands = {}

--Hello World!
function basicCommands.helloWorld()
  return("Hello world!")
end

--Executes Figlet on the host machine.
function basicCommands.figlet(string)
  local figleted = io.popen("figlet ".. string)
  local result = figleted:read("*all")
  return result
end

--Executes Cowsay on the host machine.
function basicCommands.cowsay(string)
  local cowsaid = io.popen("cowsay ".. string)
  local result = cowsaid:read("*all")
  return result
end

--Takes input and makes it output. GIGO.
function basicCommands.echo(string)
  return string
end

return basicCommands
