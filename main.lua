require 'Player'
require 'Camera'
require 'World'
require 'Collision'

math.randomseed(os.time())

function love.load()
	--set window details
	love.window.setTitle("Platformer")
	love.window.setMode(screen_width, screen_height, {resizable = false})
	
	--initialize world
	world = World:new()
	
	--create player
	player = Player:new()
end

function love.draw()
	camera:set()
	player:draw()
	world:draw()
	camera:unset()
	camera:draw()
	
	love.graphics.print("FPS: "..tostring(love.timer.getFPS()), 10, 10)
end

function love.update(dt)
	player:update(dt)
    
	camera:setCenter(player:get_center_x(), player:get_center_y())
    
	world:update(dt)
end

function love.keypressed(key)
	if key == ' ' then
		love.load()
	else
        player:keypressed(key)
    end
end

function love.keyreleased(key)
    player:keyreleased(key)
end