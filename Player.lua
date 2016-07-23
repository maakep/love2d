local P = {}

local x
local y
local ms = 2
local bool = false



player = {}

function P.init()
	x = 1800
	y = 300

	player.body = love.physics.newBody(world, x, y, "dynamic")
	player.shape = love.physics.newCircleShape(20)
	player.fixture = love.physics.newFixture(player.body, player.shape, 1)
end

function P.drawPlayer()
	love.graphics.circle("fill", player.body:getX(), player.body:getY(), player.shape:getRadius())
end

function P.update(dt)
	if love.keyboard.isDown("a") then
		player.body:applyForce(-400, 0)
	end
	if love.keyboard.isDown("d") then
		player.body:applyForce(400, 0)
	end
	if love.keyboard.isDown("w") then
		player.body:applyForce(0, -400)
	end
	if love.keyboard.isDown("s") then
		player.body:applyForce(0, 400)
	end


end


return P