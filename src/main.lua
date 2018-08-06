function love.load()
	-- Load Modules
	vec2      = require 'vec2'
	input     = require 'input'
	collision = require 'collision'
	nathan    = require 'nathan'
	platforms = require 'platforms'
	camera    = require 'camera'

	aabb_test = require 'aabb_test'

	-- Setup
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setTitle('Nathan\'s House')
	
	-- Global Constants 
	WIDTH   = love.graphics.getWidth()
	HEIGHT  = love.graphics.getHeight()
	GRAV    = 0.98
	TERMVEL = 20

	-- Init 
	nathan.pos = vec2:new(WIDTH/2 - nathan.w/2, 10)

	platforms:new(0, 200, WIDTH-400, 25)
	platforms:new(0, 300, WIDTH-300, 25)
	platforms:new(0, 400, WIDTH-200, 25)
	platforms:new(0, HEIGHT - 50, WIDTH, 25)
end

function love.update(dt)

	aabb_test.update()

	-- input:getInput()

	-- nathan:update()
	
	-- -- update camera
	-- if (nathan.pos.x < camera.x + WIDTH/2 - camera.playerBoundWidth/2) then 
	-- 	camera:setPosition(nathan.pos.x - WIDTH/2 + camera.playerBoundWidth/2) 
	-- elseif(nathan.pos.x + nathan.w > camera.x + WIDTH/2 + camera.playerBoundWidth/2) then 
	-- 	camera:setPosition(nathan.pos.x + nathan.w - WIDTH/2 - camera.playerBoundWidth/2)
	-- end

end

function love.draw()
	love.graphics.clear(20/255, 57/255, 52/255)

	aabb_test.draw()

	-- camera:drawPlayerBounds()
	-- camera:set()

	-- platforms:draw()
	-- nathan:draw()

	-- camera:unset()
end

function love.resize(w, h)
    push:resize(w, h)
end
