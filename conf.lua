screen_width = 640
screen_height = 480

function love.conf(t)
	t.modules.joystick = false
    t.modules.physics = false
	t.console = true
end