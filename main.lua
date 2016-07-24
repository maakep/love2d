local M = require("MapGenerator")
local P = require("Player")
world = {}
function love.load()
    world = love.physics.newWorld(0, 0, true)
    success = love.window.setMode(1920, 1080)
	M.init('map', world)
    P.init(world)
    
end

function love.update(dt)
    world:update(dt)
    P.update(dt)
end

function love.draw()
    M.drawMap()
    P.drawPlayer()
end


function love.keypressed(key, scancode, isrepeat)
    if key == 'escape' then
        love.event.quit()
    end
    P.keypressed(key, scancode, isrepeat)
end