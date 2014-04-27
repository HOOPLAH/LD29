require 'Player'
require 'Point'
local class = require 'middleclass'

World = class('World')

function World:initialize()
	self.lastMadePoint = Point:new(0, 0)
	self.points = {self.lastMadePoint}
end

function World:createNewPoint()
	local random_y = math.abs(love.math.random(self.lastMadePoint.y, self.lastMadePoint.y+192))
	table.insert(self.points, Point:new(self.lastMadePoint.x+128, -random_y))
	self.lastMadePoint = self.points[table.getn(self.points)]
end

function World:draw()
	for i, v in ipairs(self.points) do
		love.graphics.rectangle("fill", v.x, v.y, 4, 4)
		if i > 1 then
			love.graphics.line(self.points[i-1].x, self.points[i-1].y, v.x, v.y)
		end
	end
end

function World:update(dt)
	if player.x+500 > self.lastMadePoint.x then
		self:createNewPoint()
	end
end

function distance(obj_a, obj_b)
    local dist_x = obj_b.x - obj_a.x
    local dist_y = obj_b.y - obj_a.y
    return math.sqrt(dist_x*dist_x + dist_y*dist_y)
end

function World:updatePlayer(player)
    if table.getn(self.points) > player.point_index then
        if player.x >= self.points[player.point_index+1].x then
            player.x = self.points[player.point_index+1].x
            player.y = self.points[player.point_index+1].y
            player.point_index = player.point_index + 1
        end
    
        local point_a = self.points[player.point_index]
        local point_b = self.points[player.point_index+1]
    
        local segLenY = point_b.y-point_a.y
        local segLenX = point_b.x-point_a.x
        local compRatio = (player.x-point_a.x) / segLenX -- completion ratio
        
		if (player.jump_height ~= 0 or player.jump_speed ~= 0) and player.jump_initial_height - player.jump_height < point_a.y + (compRatio*segLenY) then
			player.y = player.jump_initial_height - player.jump_height
		else
			player.jump_height = 0
			player.jump_speed = 0
			player.y = point_a.y + (compRatio*segLenY)
		end
    end
end