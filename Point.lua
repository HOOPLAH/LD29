local class = require 'middleclass'

Point = class('Point')

function Point:initialize(x, y)
	self.x = x
	self.y = y
end

function Point:getX()
	return self.x
end

function Point:getY()
	return self.y
end