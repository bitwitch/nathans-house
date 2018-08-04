local name = "Nathan's House"
local author = "bitwitch"
local version = 0.0
local build = "-alpha"
print (name .. " " .. version .. build .. " by " .. author)
local default_width = 1288
local default_height = 768

function love.conf(t)
	t.identity = name
	t.version = "11.1"
	t.window.title = name .. " " .. version
	t.window.width = default_width
	t.window.height = default_height
	t.window.minwidth = default_width
	t.window.minheight = default_height
	-- t.modules.joystick = true
	-- t.modules.physics = false
	-- t.modules.touch = false
	-- t.modules.video = false 
	-- t.window.msaa = 0
	-- t.window.fsaa = 0
	-- t.window.display = 1
	t.window.resizable = true
	-- t.window.vsync = false
	-- t.window.fullscreen = false
	-- t.window.fullscreentype = "desktop"
	t.console = true;
end