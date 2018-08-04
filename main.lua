function love.load()
	-- Setup
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setTitle('Nathan\'s House')

	-- Global Constants 
	WIDTH   = love.graphics.getWidth()
	HEIGHT  = love.graphics.getHeight()
	GRAV    = 0.098
	TERMVEL = 12
    
	-- Load Modules
	require 'input'
	Vec2 = require 'vec2'
	_Nathan = require 'nathan'

	-- Init 
	Nathan = _Nathan.new()
	Nathan.pos = Vec2:new(250, 250)
end


function love.update(dt)
	getInput()

	Nathan.vel.x = Nathan.vel.x + Nathan.acc.x 
	Nathan.pos.x = Nathan.pos.x + Nathan.vel.x
end

function love.draw()
	love.graphics.clear(20/255, 57/255, 52/255)
	
	-- Floor
	love.graphics.setColor(0/255, 10/255, 12/255, 1)
	love.graphics.rectangle('fill', 0, HEIGHT - 25, WIDTH, 25)
		
	Nathan:draw()
end
