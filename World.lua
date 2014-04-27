require 'Player'
require 'Point'
local class = require 'middleclass'

World = class('World')

function World:initialize()
	self.lastMadePoint = Point:new(0, 0)
	self.points = {self.lastMadePoint}
end

function World:createNewPoint()
	local random_y = math.abs(love.math.random(self.lastMadePoint.y, self.lastMadePoint.y+256))
	table.insert(self.points, Point:new(self.lastMadePoint.x+64, -random_y))
	self.lastMadePoint = self.points[table.getn(self.points)]
end

function World:draw()
	for i, v in ipairs(self.points) do
		love.graphics.rectangle("fill", v:getX(), v:getY(), 4, 4)
		if i > 1 then
			love.graphics.line(self.points[i-1]:getX(), self.points[i-1]:getY(), v:getX(), v:getY())
		end
		--love.graphics.line( x1, y1, x2, y2, ... )
	end
end

function World:update(dt)
	if player.x > self.lastMadePoint.x then
		self:createNewPoint()
	end
end