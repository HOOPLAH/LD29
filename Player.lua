local class = require 'middleclass'

Player = class('Player')

function Player:initialize()
	self.x = 0
	self.y = -1
	self.width = 64
	self.height = 64
	self.speed_x = 300
	self.speed_y = 300
	self.img = love.graphics.newImage("Content/Textures/ammocrate.png")
	
	self.move_up = false
	self.move_down = false
	self.move_left = false
	self.move_right = false
    self.point_index = 1
	
	self.jump_initial_height = 0
	self.jump_height = 0
	self.max_jump_height = 128 --pixels
	self.jump_speed = 0
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
	
	if key == ' ' and self.jump_height == 0 then
		self.jump_initial_height = self.y
		self.jump_speed = 400
		--print("jump")
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
	if self.move_up then
		self.y = self.y - self.speed_y*dt
	elseif self.move_down then
		self.y = self.y + self.speed_y*dt
	end
	
	self.x = self.x + self.speed_x*dt
	
	if self.jump_height > 0 or self.jump_speed > 0 then
		self.jump_height = self.jump_height + self.jump_speed*dt
		self.jump_speed = self.jump_speed - 800*dt
	elseif self.jump_height < 0 then
		self.jump_height = 0
		self.jump_speed = 0
	end
	
end

function Player:get_center_x()
    return self.x + (self.width/2)
end

function Player:get_center_y()
    return self.y + (self.height/2)
end