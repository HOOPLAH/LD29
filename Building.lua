local class = require 'middleclass'

Building = class('Building')

function Building:initialize(x, y, path)
	self.x = x
	self.y = y
	self.width = 64
	self.height = 64
	self.img = love.graphics.newImage(path)
end

function Building:getX()
	return self.x
end

function Building:getY()
	return self.y
end

function Building:getImage()
	return self.img
end