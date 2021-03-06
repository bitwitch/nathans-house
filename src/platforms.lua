-- vec2 = require 'vec2'

local platforms = {}
platforms.list = {}

function platforms:new(x,y,w,h)
	local platform = {}
	
	platform.pos = vec2:new(x,y)
	platform.w = w
	platform.h = h
	
	function platform:update()
		
	end
	
	function platform:draw() 
		love.graphics.setColor(0/255, 10/255, 12/255, 1)
		love.graphics.rectangle('fill', self.pos.x, self.pos.y, self.w, self.h)
	end
	
	-- Add to list of all platforms
	table.insert(platforms.list, platform)

	return platform
end

function platforms:draw()
	for i, platform in ipairs(self.list) do
		platform:draw()
	end
end

return platforms

