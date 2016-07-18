local M = {}

M.tiles = {}
local imageData

function M:init()
	imageData = love.image.newImageData('map/map.png')
	M.tiles = {}
	local height = imageData:getHeight()
	local width = imageData:getWidth()

	for y = 1, height do
	    for x = 1, width do
	        local r, g, b, a = imageData:getPixel(x - 1, y - 1)
	        	if g == 255 then
	        	    M.tiles[#M.tiles+1] = {"g", x, y}
	        	elseif r == 255 then
	        	    M.tiles[#M.tiles+1] = {"r", x, y}
	        	elseif b == 255 then
	        		M.tiles[#M.tiles+1] = {"b", x, y}
	        	end
	    end
	end
end

return M