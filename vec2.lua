local Vec2 = {}

function Vec2:new(x,y)
	local vec2 = {} 

	vec2.x = x or 0
	vec2.y = y or 0


	function vec2:magnitude() 
		return math.sqrt(self.x * self.x + self.y * self.y)
	end

	function vec2:normalized() 
		local mag = self.magnitude()
		return Vec2:new(self.x / mag, self.y / mag)
	end

	-- function vec2:move(dx, dy, dt)
	-- 	local delta = dt or 1
	-- 	self.x = self.x + dx * delta
	-- 	self.y = self.y + dy * delta
	-- end

	return vec2
end

return Vec2


