vec2 = require 'vec2'

local test = {}

local user = {}
user.min = vec2:new(love.mouse.getX(), love.mouse.getY())
user.max = vec2:new(user.min.x+50, user.min.y+50)
user.color = {r=100/255, g=199/255, b=199/255, a=1}

local obstacle = {}
obstacle.min = vec2:new(600, 300)
obstacle.max = vec2:new(obstacle.min.x+400, obstacle.min.y+400)	

local md  = {}

function test.update()
	user.min = vec2:new(love.mouse.getX(), love.mouse.getY())
	user.max = vec2:new(user.min.x+50, user.min.y+50)

	md.min = vec2:sub(user.min, obstacle.max)
	md.max = vec2:new(md.min.x + user.max.x - user.min.x + obstacle.max.x - obstacle.min.x, md.min.y + user.max.y - user.min.y + obstacle.max.y - obstacle.min.y)

	-- if collision make user red
	if md.min.x <= 0 and
	   md.max.x >= 0 and
	   md.min.y <= 0 and
	   md.max.y >= 0
	then 
		user.color = {r=255/255, g=12/255, b=13/255, a=1}
	else 
		user.color = {r=100/255, g=199/255, b=199/255, a=1}
	end

end


function test.draw()
	love.graphics.setColor(12/255, 37/255, 18/255, 1)
	love.graphics.rectangle('fill', md.min.x, md.min.y, md.max.x - md.min.x, md.max.y - md.min.y)

	love.graphics.setColor(52/255, 87/255, 58/255, 1)
	love.graphics.rectangle('fill', obstacle.min.x, obstacle.min.y, obstacle.max.x - obstacle.min.x, obstacle.max.y - obstacle.min.y)

	love.graphics.setColor(user.color.r, user.color.g, user.color.b, user.color.a)
	love.graphics.rectangle('fill', user.min.x, user.min.y, user.max.x - user.min.x, user.max.y - user.min.y)
end

return test 