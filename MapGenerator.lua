local M = {}

M.tiles = {}
local imageData
local grassImg
local wallImg
local voidImg
local waterImg
local tileWidth

local physTiles = {}

function M.init(mapname)
	mapname = mapname or 'map'
	imageData = love.image.newImageData('map/' .. mapname .. '.png')

	grassImg = love.graphics.newImage("assets/grass.png")
    wallImg = love.graphics.newImage("assets/wall.png")
    voidImg = love.graphics.newImage("assets/void.png")
    waterImg = love.graphics.newImage("assets/water.png")

    tileWidth = grassImg:getWidth()
	M.tiles = {}
	for i = 1, #physTiles do
		physTiles[i][1]:destroy()
	end
	physTiles = {}

	local height = imageData:getHeight()
	local width = imageData:getWidth()

	for y = 1, height do
	    for x = 1, width do
	        local r, g, b, a = imageData:getPixel(x - 1, y - 1)
        	if g == 255 then
        	    M.tiles[#M.tiles+1] = {"g", x, y}
        	elseif r == 255 then
        	    M.tiles[#M.tiles+1] = {"r", x, y}
        	    makeWall(x, y)
        	elseif b == 255 then
        		M.tiles[#M.tiles+1] = {"b", x, y}
        	end
	    end
	end
end

function makeWall(x, y)
	local physX = x*25+tileWidth/2-tileWidth
	local physY = y*25+tileWidth/2-tileWidth

	local body = love.physics.newBody(world, physX, physY)
	local shape = love.physics.newRectangleShape(tileWidth, tileWidth)
	local fixture = love.physics.newFixture(body, shape)

	table.insert(physTiles, {
		body,
		shape,
		fixture
	})
	    
end

function M.drawMap() 
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
    	M.init('map2')
    end
end


return M

