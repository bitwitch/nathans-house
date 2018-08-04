function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	WIDTH  = love.graphics.getWidth()
	HEIGHT = love.graphics.getHeight()
	
	Nathan = require 'nathan'
	nathan = Nathan.new()

end

function love.update(dt)

end

function love.draw()
	love.graphics.clear(86/255, 57/255, 52/255)
	-- renderer:draw()
	love.graphics.setColor(0, 230/255, 90/255)
	love.graphics.rectangle('fill', WIDTH / 2, HEIGHT / 2, 100, 100)
end 

