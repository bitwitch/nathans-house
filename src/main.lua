function love.load()
	-- Setup
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setTitle('Nathan\'s House')

	-- Global Constants 
	WIDTH   = love.graphics.getWidth()
	HEIGHT  = love.graphics.getHeight()
	GRAV    = 0.448
	TERMVEL = 12
    
	-- Load Modules
	require 'vec2'
	require 'input'
	require 'collision'
	require 'nathan'
	require 'platforms'

	-- Init 
	nathan:init()
	nathan.pos = Vec2:new(250, 10)

	platforms:new(0, 200, WIDTH-400, 25)
	platforms:new(0, 300, WIDTH-300, 25)
	platforms:new(0, 400, WIDTH-200, 25)
	platforms:new(0, 500, WIDTH-100, 25)
end


function love.update(dt)
	getInput()

	nathan:update()
end

function love.draw()
	love.graphics.clear(20/255, 57/255, 52/255)
	platforms:draw()
	nathan:draw()
end

