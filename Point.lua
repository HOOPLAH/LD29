local class = require 'middleclass'

Point = class('Point')

function Point:initialize(x, y, is_gap, boost)
	self.x = x
	self.y = y
    self.is_gap = is_gap
	self.boost = boost
end