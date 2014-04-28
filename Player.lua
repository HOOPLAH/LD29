local class = require 'middleclass'

Player = class('Player')

function Player:initialize()
	self.x = 0
	self.y = -1
	self.width = 64
	self.height = 80
	self.speed_x = 200
	self.img = love.graphics.newImage("Content/Textures/dwarfInCart.png")
	
	self.boost_w = false
	self.boost_s = false
	self.boost_a = false
	self.boost_d = false
    self.point_index = 1
	
	self.jump_initial_height = 0
	self.jump_height = 0
	self.max_jump_height = 128 --pixels
	self.jump_speed = 0
end

function Player:keypressed(key)
    if key == 'w' then
        self.boost_w = true
    elseif key == 's' then
        self.boost_s = true
    elseif key == 'a' then
        self.boost_a = true
    elseif key == 'd' then
        self.boost_d = true
    end
	
	if key == ' ' and self.jump_height == 0 then
		self.jump_initial_height = self.y
		self.jump_speed = 400
	end
end

function Player:keyreleased(key)
    if key == 'w' then
        self.boost_w = false
    elseif key == 's' then
        self.boost_s = false
    elseif key == 'a' then
        self.boost_a = false
    elseif key == 'd' then
        self.boost_d = false
    end
end

function Player:draw()
	love.graphics.draw(self.img, self.x - (self.height/2), self.y-self.height)
end

function Player:update(dt)	
	self.x = self.x + self.speed_x*dt
	
	if self.jump_height ~= 0 or self.jump_speed ~= 0 then
		self.jump_height = self.jump_height + self.jump_speed*dt
		self.jump_speed = self.jump_speed - 800*dt
	end
	
end

function Player:get_center_x()
    return self.x + (self.width/2)
end

function Player:get_center_y()
    return self.y + (self.height/2)
end