local M = require("MapGenerator")

local bool = false


function love.load()
	M:init()
    grassImg = love.graphics.newImage("assets/grass.png")
    wallImg = love.graphics.newImage("assets/wall.png")
    voidImg = love.graphics.newImage("assets/void.png")
    waterImg = love.graphics.newImage("assets/water.png")
    tileWidth = grassImg:getWidth()
    success = love.window.setMode(1000, 1000)
end

function love.draw()
    for i = 1, #M.tiles do
        img = voidImg
        if M.tiles[i][1] == "g" then
            img = grassImg
        elseif M.tiles[i][1] == "r" then
            img = wallImg
        elseif M.tiles[i][1] == "b" then
            img = waterImg
        end
        love.graphics.draw(
            img, 
            M.tiles[i][2]*tileWidth-tileWidth, 
            M.tiles[i][3]*tileWidth-tileWidth)
    end
end

function love.textinput(text)
	if text == "#" then
    	M:init()
    end
end