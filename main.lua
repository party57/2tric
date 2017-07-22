io.stdout:setvbuf("no") --For Console output in IDEs

require "torch"
require "cutorch"


scale = require "code/scale"
--statemachine:
state = require "code/exlib/gamestate"
--states:
splash = require "code/states/splash"
mainmenu = require "code/states/mainmenu"

function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end --For Zerobrane Debugging
  state.registerEvents()
  state.switch(splash)
end

function love.update(dt)
  
end

function love.draw()
  
end

function love.resize(w,h)
  scale:resize(w,h)
end