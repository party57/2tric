scale = {}

setmetatable(scale,scale)

function scale:setup(levelWidth, levelHeight)
  self._screenWidth, self._screenHeight = love.window.getMode()
  self._levelWidth, self._levelHeight = levelWidth, levelHeight
  self._levelScale = math.min( self._screenWidth / self._levelWidth , self._screenHeight / self._levelHeight )
  self._levelOffsetX = ( self._screenWidth - self._levelWidth * self._levelScale ) / 2
  self._levelOffsetY = ( self._screenHeight - self._levelHeight * self._levelScale ) / 2
end

function scale:resize(screenWidth, screenHeight)
  self._screenWidth, self._screenHeight = screenWidth, screenHeight
  self._levelScale = math.min( self._screenWidth / self._levelWidth , self._screenHeight / self._levelHeight )
  self._levelOffsetX = ( self._screenWidth - self._levelWidth * self._levelScale ) / 2
  self._levelOffsetY = ( self._screenHeight - self._levelHeight * self._levelScale ) / 2
end

function scale:start()
  love.graphics.push()
  love.graphics.translate( self._levelOffsetX , self._levelOffsetY )
  love.graphics.setScissor( self._levelOffsetX , self._levelOffsetY , self._levelWidth * self._levelScale, self._levelHeight * self._levelScale )
  love.graphics.scale(self._levelScale)
end

function scale:finish()
  love.graphics.pop()
  love.graphics.setScissor()
end

function scale:--[[Coordinate]]toReal(x, y)
  return x * self._levelScale + self._levelOffsetX , y * self._levelScale + self._levelOffsetY
end

function scale:--[[Coordinate]]toLevel(x, y)
  return ( x - self._levelOffsetX ) / self._levelScale, ( y - self._levelOffsetY ) / self._levelScale 
end

return scale