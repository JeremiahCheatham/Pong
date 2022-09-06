Player = {}

function Player:load()
    self.img = love.graphics.newImage("assets/1.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = 50
    self.y = ( love.graphics.getHeight() - self.height ) / 2
    self.speed = 500
    self.score = 0

    self.yVel = 0
    self.timer = 0.25
    self.rate = 0.5
end

function Player:update(dt)
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:aquireTarget()
    end
    Player:move(dt)
    Player:checkBoundries()
end

function Player:move(dt)
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
    self.y = self.y + self.yVel * dt
end

function Player:checkBoundries()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Player:aquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yVel = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVel = self.speed
    else
        self.yVel = 0
    end
end

function Player:draw()
    love.graphics.draw(self.img, self.x, self.y)
end