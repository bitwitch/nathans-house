local vec2 = {}

function vec2:new(x,y)
	local v = {} 

	v.x = x or 0
	v.y = y or 0

	function v:add(v2)
		self.x = self.x + v2.x
		self.y = self.y + v2.y
	end

	function v:add(v2)
		self.x = self.x + v2.x
		self.y = self.y + v2.y
	end

	function v:div(val)
		assert(val ~= 0, "Error: Division by zero.")
		self.x = self.x / val
		self.y = self.y / val
	end

	-- scalar mult
	function v:mult(val)
		self.x = self.x * val
		self.y = self.y + val
	end

	--vector mult, cross-product
	function v:cross(v2)

	end

	return v
end

-- module functions, nondestructive
function vec2:add(v1, v2)
	return vec2:new(v1.x + v2.x, v1.y + v2.y)
end

function vec2:sub(v1, v2)
	return vec2:new(v1.x - v2.x, v1.y - v2.y)
end

function vec2:mult(v1, v2)
	return vec2:new(v1.x - v2.x, v1.y - v2.y)
end

function vec2:dot(v1, v2) 
	return v1.x * v2.x + v1.y * v2.y
end

function vec2:magnitude() 
	return math.sqrt(self.x * self.x + self.y * self.y)
end

function vec2:normalized() 
	local mag = self.magnitude()
	return vec2:new(self.x / mag, self.y / mag)
end

return vec2

