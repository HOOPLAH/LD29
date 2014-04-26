require 'Player'
require 'Building'
local class = require 'middleclass'

World = class('World')

function World:initialize()
	self.lastMadeBuilding = Building:new(128, -1, 'Content/Textures/ammocrate.png')
	self.buildings = {self.lastMadeBuilding}
end

function World:createNewBuilding()
	local random_y = math.abs(love.math.random(self.lastMadeBuilding.y, self.lastMadeBuilding.y+128))
	table.insert(self.buildings, Building:new(self.lastMadeBuilding.x+128, -random_y, 'Content/Textures/ammocrate.png'))
	self.lastMadeBuilding = self.buildings[table.getn(self.buildings)-1]
end

function World:draw()
	for _, v in ipairs(self.buildings) do
		love.graphics.draw(v:getImage(), v:getX(), v:getY())
	end
end

function World:update(dt)
	if player.x > self.lastMadeBuilding.x then
		self:createNewBuilding()
	end
end