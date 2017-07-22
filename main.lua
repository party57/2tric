io.stdout:setvbuf("no") --For Console output in IDEs


require "torch"
require "cutorch"

function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end --For Zerobrane Debugging
end

function love.update(dt)
  
end

function love.draw()
  
end