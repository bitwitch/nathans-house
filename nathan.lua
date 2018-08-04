local Nathan = {}
local Vec2 = require 'vec2'

function Nathan:new() 
	local nathan = {}

	nathan.pos = Vec2:new()
	nathan.vel = Vec2:new()
	nathan.acc = Vec2:new()

	nathan.w = 35
	nathan.h = 60
	nathan.hsp = 10
	nathan.jumpSpeed = 50

	--TODO(shaw): make this a sprite when there is actually art in the game
	

	function nathan:draw()
		love.graphics.setColor(255/255, 250/255, 181/255, 1)
		love.graphics.rectangle('fill', self.pos.x - (self.w / 2), self.pos.y - (self.h / 2), self.w, self.h)
	end

	return nathan
end

return Nathan

