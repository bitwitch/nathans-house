local collision = {}

function collision:minowski_difference(a, b)
	local aabb  = {} 
	aabb.left   = a.pos.x - b.pos.x + b.w
	aabb.top    = a.pos.y - b.pos.y + b.h
	aabb.right  = aabb.left + a.w + b.w
	aabb.bottom = aabb.top + a.h + b.h
	return aabb
end 

function collision:check(a,b)

	-- local md = self:minowski_difference(a, b)

	-- print("Minowski - left: (" , md.left, ") right: (", md.right, ") top: (", md.top, ") bottom: (", md.bottom, ")")

	-- return md.left   <= 0 and
	-- 	   md.right  >= 0 and
	-- 	   md.top    <= 0 and
	--        md.bottom >= 0

	-- if md.left   <= 0 and
	--    md.right  >= 0 and
	--    md.top    <= 0 and
	--    md.bottom >= 0
	-- then 
	-- 	print('COLLIDE')
	-- end

	return a.pos.x + a.vel.x <= b.pos.x+b.w         and
		   b.pos.x           <= a.pos.x+a.w+a.vel.x and
		   a.pos.y+a.vel.y   <= b.pos.y+b.h         and
		   b.pos.y           <= a.pos.y+a.h+a.vel.y
end

function collision:right(a, b)
-- 	return a.newX < b.x+b.w and a.x > b.x+b.w 
	return a.pos.x + a.w >= b.pos.x 
end

function collision:left(a, b)
-- 	return a.newX+a.w > b.x and a.x+a.w < b.x 
	return a.pos.x <= b.pos.x + b.w
end

function collision:top(a, b)
	return a.pos.y + a.vel.y <= b.pos.y + b.h --and a.pos.y + a.vel.y + a.h > b.pos.y
end

-- this is used to check if a is about to collide with b 
function collision:bottom(a,b)
	return a.pos.y + a.h + a.vel.y >= b.pos.y --and a.pos.y + a.vel.y < b.pos.y + b.h
end

-- this is used to check if a 1 pixel away from b
function collision:directBottom(a, b)
	return a.pos.y + a.h >= b.pos.y
end

return collision