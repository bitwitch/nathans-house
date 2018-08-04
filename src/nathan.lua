nathan = {}

function nathan:init() 
	self.pos = Vec2:new()
	self.vel = Vec2:new()
	self.acc = Vec2:new()

	self.w = 35
	self.h = 60
	self.hsp = 7
	self.vsp = 0
	self.jumpSpeed = 10
	self.grounded = false
end

function nathan:draw()
	love.graphics.setColor(255/255, 250/255, 181/255, 1)

	--TODO(shaw): make this a sprite when there is actually art in the game
	love.graphics.rectangle('fill', self.pos.x, self.pos.y, self.w, self.h)
end

function nathan:update()


	-- Collisions
	for i, platform in ipairs(platforms.list) do
		if (collision:check(self, platform)) then 
			-- Check if on ground 
			if collision:bottom(self, platform) then 
				self.grounded = true
				self.pos.y = platform.pos.y - self.h 
			end 			
		else
			self.grounded = false
		end
	end 

	
	
	-- Update horizontal vel, pos
	self.vel.x = self.vel.x + self.acc.x 
	self.pos.x = self.pos.x + self.vel.x
	

	-- Update vertical vel, pos

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

