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
	test  = Building:new(64, 64, "Content/Textures/ammocrate.png")
end

function love.draw()
	camera:set()
	player:draw()
	love.graphics.draw(test.img, test.x, test.y)
	world:draw()
	camera:unset()
	camera:draw()
	
	love.graphics.print("FPS: "..tostring(love.timer.getFPS()), 10, 10)
	
	if check_collision(player, test) then
		handle_collision(player, test)
	end
end

function love.update(dt)
	player:update(dt)
	camera:setCenter(player.center_x, player.center_y)
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