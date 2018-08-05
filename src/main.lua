function love.load()
	-- Setup
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setTitle('Nathan\'s House')

	-- Global Constants 
	WIDTH   = love.graphics.getWidth()
	HEIGHT  = love.graphics.getHeight()
	GRAV    = 0.98
	TERMVEL = 20
    
	-- Load Modules
	require 'vec2'
	require 'input'
	require 'collision'
	require 'nathan'
	require 'platforms'
	require 'camera'

	-- Init 
	nathan.pos = Vec2:new(WIDTH/2 - nathan.w/2, 10)

	platforms:new(0, 200, WIDTH-400, 25)
	platforms:new(0, 300, WIDTH-300, 25)
	platforms:new(0, 400, WIDTH-200, 25)
	platforms:new(0, HEIGHT - 50, WIDTH, 25)
end


function love.update(dt)
	getInput()
	nathan:update()
	
	-- update camera
	if (nathan.pos.x < camera.x + WIDTH/2 - camera.playerBoundWidth/2) then 
		camera:setPosition(nathan.pos.x - WIDTH/2 + camera.playerBoundWidth/2) 
	elseif(nathan.pos.x + nathan.w > camera.x + WIDTH/2 + camera.playerBoundWidth/2) then 
		camera:setPosition(nathan.pos.x + nathan.w - WIDTH/2 - camera.playerBoundWidth/2) 
	end

end

function love.draw()
	love.graphics.clear(20/255, 57/255, 52/255)

	camera:drawPlayerBounds()
	camera:set()

	platforms:draw()
	nathan:draw()

	camera:unset()
end

