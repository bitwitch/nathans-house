collision = {}

function collision:check(a,b)
	return a.pos.x + a.vel.x <= b.pos.x+b.w         and
		   b.pos.x           <= a.pos.x+a.w+a.vel.x and
		   a.pos.y+a.vel.y   <= b.pos.y+b.h         and
		   b.pos.y           <= a.pos.y+a.h+a.vel.y
end

function collision:right(a,b)
-- 	return a.newX < b.x+b.w and a.x > b.x+b.w 
	return a.pos.x + a.w >= b.pos.x 
end

function collision:left(a,b)
-- 	return a.newX+a.w > b.x and a.x+a.w < b.x 
	return a.pos.x <= b.pos.x + b.w
end

function collision:top(a,b)
	return a.pos.y + a.vel.y <= b.pos.y + b.h --and a.pos.y + a.vel.y + a.h > b.pos.y
end

-- this is used to check if a is about to collide with b 
function collision:bottom(a,b)
	return a.pos.y + a.h + a.vel.y >= b.pos.y --and a.pos.y + a.vel.y < b.pos.y + b.h
end

-- this is used to check if a 1 pixel away from b
function collision:directBottom(a,b)
	return a.pos.y + a.h >= b.pos.y
end


