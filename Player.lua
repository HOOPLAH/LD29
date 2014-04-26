local class = require 'middleclass'

Player = class('Player')

function Player:initialize()
	self.x = 0
	self.y = -1
	self.width = 64
	self.height = 64
	self.center_x = self.x + self.width/2
	self.center_y = self.y + self.height/2
	self.speed_x = 300
	self.speed_y = 300
	self.img = love.graphics.newImage("Content/Textures/ammocrate.png")
	self.move_up = false
	self.move_down = false
	self.move_left = false
	self.move_right = false
end

function Player:keypressed(key)
    if key == 'w' then
        self.move_up = true
    elseif key == 's' then
        self.move_down = true
    elseif key == 'a' then
        self.move_left = true
    elseif key == 'd' then
        self.move_right = true
    end
end

function Player:keyreleased(key)
    if key == 'w' then
        self.move_up = false
    elseif key == 's' then
        self.move_down = false
    elseif key == 'a' then
        self.move_left = false
    elseif key == 'd' then
        self.move_right = false
    end
end

function Player:draw()
	love.graphics.draw(self.img, self.x, self.y)
end

function Player:update(dt)
	self.center_x = self.x + self.width/2
	self.center_y = self.y + self.height/2
	
	if self.move_up then
		self.y = self.y - self.speed_y*dt
	elseif self.move_down then
		self.y = self.y + self.speed_y*dt
	end
	
	if self.move_left then
		self.x = self.x - self.speed_x*dt
	elseif self.move_right then
		self.x = self.x + self.speed_x*dt
	end
end