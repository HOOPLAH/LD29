local class = require 'middleclass'

Point = class('Point')

function Point:initialize(x, y)
	self.x = x
	self.y = y
end

function Point:get_y()
	return self.x
end

function Point:get_y()
	return self.y
end