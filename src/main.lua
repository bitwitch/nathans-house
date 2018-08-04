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
	require 'vec2'
	require 'input'
	require 'collision'
	require 'nathan'
	require 'platforms'

	-- Init 
	nathan:init()
	nathan.pos = Vec2:new(250, 450)

	-- platforms:new(0, HEIGHT - 25, WIDTH, 25)
	platforms:new(0, HEIGHT - 75, WIDTH-100, 25)
end


function love.update(dt)
	getInput()

	nathan:update()
end

function love.draw()
	love.graphics.clear(20/255, 57/255, 52/255)
	
	-- Platforms
	for i, platform in ipairs(platforms.list) do
		platform:draw()
	end
		
	nathan:draw()
end

