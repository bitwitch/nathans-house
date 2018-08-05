nathan = {}

nathan.pos = Vec2:new()
nathan.vel = Vec2:new()
nathan.acc = Vec2:new()

nathan.w = 35
nathan.h = 60
nathan.hsp = 7
nathan.vsp = 0
nathan.jumpSpeed = -17
nathan.jump = false
nathan.grounded = false


function nathan:draw()
	love.graphics.setColor(255/255, 250/255, 181/255, 1)

	--TODO(shaw): make this a sprite when there is actually art in the game
	love.graphics.rectangle('fill', self.pos.x, self.pos.y, self.w, self.h)
end

function nathan:update()

	-- Platform Collisions
	local collisionDetected = false 
	for i, platform in ipairs(platforms.list) do

		-- if there is about to be a collision, filter by direction
		if (collision:check(self, platform)) then 

			-- Check if bottom collision
			if collision:bottom(self, platform) then 
				collisionDetected = true
				self.grounded = true				
				self.pos.y = platform.pos.y - self.h 
				break -- TODO(shaw): this may prove to have issues but for now we just handle the first collision
			else 
				self.grounded = false
			end		
		end
	end

	if not collisionDetected then 
		self.grounded = false 		
	end 

	-- Update horizontal vel, pos
	self.vel.x = self.vel.x + self.acc.x 
	self.pos.x = self.pos.x + self.vel.x

	-- Update vertical vel, pos
	if (self.jump) then 
		self.vel.y = self.jumpSpeed
		self.jump = false 
		self.grounded = false
	end 

	-- fall if not on ground
	if self.grounded then 
		self.vel.y = 0
	else 
		self.vel.y = self.vel.y + GRAV

		if self.vel.y > TERMVEL then 
			self.vel.y = TERMVEL
		end 
	end 

	self.pos.y = self.pos.y + self.vel.y
end

