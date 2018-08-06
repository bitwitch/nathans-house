--
-- Love Overrides
--
function love.keypressed(key)
	if key == 'escape' then
		love.event.quit() 
	elseif key == 'space' or key == 'w' or key == 'up' then 
		nathan.jump = true
	end 
end

--
-- Input Module
--
local input = {}

function input:getInput()
	self.right = false
	self.left  = false
	self.up    = false
	self.down  = false

	-- Right
	if ( (love.keyboard.isDown("d") or love.keyboard.isDown("right") ) and 
		not (love.keyboard.isDown("a") or love.keyboard.isDown("left")) ) then 
			self.right = true

	-- Left
	elseif ( (love.keyboard.isDown("a") or love.keyboard.isDown("left") ) and 
		not (love.keyboard.isDown("d") or love.keyboard.isDown("right")) ) then  
			self.left = true
	end 

	
	
end

return input 