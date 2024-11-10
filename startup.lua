local w, h = term.getSize()

function printCentered(y, s)
  local x = math.floor((w - string.len(s)) / 2)
  term.setCursorPos(x, y)
  term.clearLine()
  term.write(s)
end

local nOption = 1

local function drawMenu()
  term.clear()
  term.setCursorPos(1, 1)
  term.write("Our first_OS")

  term.setCursorPos(w - 11, 1)
  if nOption == 1 then
    term.write("Command")
  elseif nOption == 2 then
    term.write("Programs")
  elseif nOption == 3 then
    term.write("Shutdown")
  elseif nOption == 4 then
    term.write("Uninstall")
  end
end

-- GUI

local function drawFrontend()
  printCentered(math.floor(h / 2) - 3, "")
  printCentered(math.floor(h / 2) - 2, "Start Menu")
  printCentered(math.floor(h / 2) - 1, "")
  printCentered(math.floor(h / 2) - 0, (nOption == 1 and "[ Command ]") or "Command")
  printCentered(math.floor(h / 2) + 1, (nOption == 2 and "[ Programs ]") or "Programs")
  printCentered(math.floor(h / 2) + 2, (nOption == 3 and "[ Shutdown ]") or "Shutdown")
  printCentered(math.floor(h / 2) + 3, (nOption == 4 and "[ Uninstall ]") or "Uninstall")
end

-- Display

drawMenu()
drawFrontend()

while true do
  local e, p = os.pullEvent()
  if e == "key" then
    local key = p
    if key == 17 or key == 200 then  -- Fixed syntax here (changed "od" to "or")
      if nOption > 1 then
        nOption = nOption - 1
        drawMenu()
        drawFrontend()  -- Fixed typo ("drawFrotend" -> "drawFrontend")
      end
    elseif key == 31 or key == 208 then
      if nOption < 4 then
        nOption = nOption + 1
        drawFrontend()  -- Fixed typo ("drawFrotend" -> "drawFrontend")
      end
    elseif key == 28 then  -- Enter key
      break
    end
  end
end

term.clear()

-- Conditions for running different scripts
if nOption == 1 then
  shell.run("os/command")  -- Fixed path formatting (no ".")
elseif nOption == 2 then
  shell.run("os/programs")  -- Fixed path formatting (no ".")
elseif nOption == 3 then
  os.shutdown()
else
  shell.run("os/uninstall")  -- Fixed path formatting (no ".")
end
