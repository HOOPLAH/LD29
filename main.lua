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
    
    camera:newLayer(1, draw_world)
    camera:newLayer(1, draw_player)
end

function draw_world()
    world:draw()
end

function draw_player()
    player:draw()
end

function love.draw()
	camera:draw()
	
	love.graphics.print("FPS: "..tostring(love.timer.getFPS()), 10, 10)
end

function love.update(dt)
	player:update(dt)
    
	world:update(dt)
    world:updatePlayer(player)
    
    camera:setCenter(player:get_center_x(), player:get_center_y())
end

function love.keypressed(key)
	if key == 'h' then
		love.load()
	else
        player:keypressed(key)
    end
end

function love.keyreleased(key)
    player:keyreleased(key)
end