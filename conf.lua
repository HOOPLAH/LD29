screen_width = 800
screen_height = 600

function love.conf(t)
	t.modules.joystick = false
    t.modules.physics = false
	t.console = true
    t.vsync = false
end