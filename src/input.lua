-- function love.keypressed(key)
-- 	if (key == 'a' or key == 'left') then
-- 		nathan.vel.x = -nathan.hsp
-- 	elseif (key == 'd' or key == 'right') then 
-- 		nathan.vel.x = nathan.hsp
-- 	end
-- end 

-- function love.keyreleased(key)
-- 	if (key == 'a' or key == 'left') then
-- 		nathan.vel.x = 0
-- 	elseif (key == 'd' or key == 'right') then 
-- 		nathan.vel.x = 0
-- 	end
-- end 


function getInput()
	-- Horizontal
	if ( (love.keyboard.isDown("d") or love.keyboard.isDown("right") ) and 
		not (love.keyboard.isDown("a") or love.keyboard.isDown("left")) ) then 
			nathan.vel.x = nathan.hsp

	elseif ( (love.keyboard.isDown("a") or love.keyboard.isDown("left") ) and 
		not (love.keyboard.isDown("d") or love.keyboard.isDown("right")) ) then  
			nathan.vel.x = -nathan.hsp

	else 
		nathan.vel.x = 0
	end 

	
	
end

function love.keypressed(key)
	if (key == 'space' or key == 'w' or key == 'up') then 
		nathan.jump = true
	end 
end
