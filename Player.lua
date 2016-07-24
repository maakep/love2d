local P = {}

local x
local y
local ms = 2
local bool = false



player 		=	{ radius = 20 }

projectiles	=	{}
bulletSpeed = 1000


function P.init()
	player.x = 1800
	player.y = 300

	player.body = love.physics.newBody(world, player.x, player.y, "dynamic")
	player.shape = love.physics.newCircleShape(20)
	player.fixture = love.physics.newFixture(player.body, player.shape, 1)
end

function P.drawPlayer()
	love.graphics.circle("fill", player.body:getX(), player.body:getY(), player.shape:getRadius())

	for i, v in ipairs(projectiles) do
		love.graphics.circle("fill", v.x, v.y, 3)
	end

	love.graphics.print(player.body:getAngularVelocity(), 10, 60) 
end

function P.update(dt)
	print("huh")

	for i, v in ipairs(projectiles) do
		v.y = v.y + (v.dy * dt)
		v.x = v.x + (v.dx * dt)
	end
end


function love.keypressed(key, scancode, isrepeat)

	print("wat")
	local x, y = player.body:getLinearVelocity()
	if key == "a" then
		player.body:setLinearVelocity(-400, y)
	end
	if key == "d" then
		player.body:setLinearVelocity(400, y)
	end
	if key == "w" then
		player.body:setLinearVelocity(x, -400)
	end
	if key == "s" then
		player.body:setLinearVelocity(x, 400)
	end
end

function love.keyreleased(key)
	local x, y = player.body:getLinearVelocity()

	if key == "s" or key == "w" then
		player.body:setLinearVelocity(x, 0)
	end
	if key == "a" or key == "d" then
		player.body:setLinearVelocity(0, y)
	end
end

function love.mousepressed(x, y, button)
	if button == 1 then
		local startX = player.body:getX() + player.radius / 2
		local startY = player.body:getY() + player.radius / 2
		local mouseX = x
		local mouseY = y
 
		local angle = math.atan2((mouseY - startY), (mouseX - startX))
 
		local bulletDx = bulletSpeed * math.cos(angle)
		local bulletDy = bulletSpeed * math.sin(angle)
 
		table.insert(projectiles, {x = startX, y = startY, dx = bulletDx, dy = bulletDy})
	end
end


return P