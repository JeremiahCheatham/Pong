Ball = {}

function Ball:load()
    self.img = love.graphics.newImage("assets/ball.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = ( love.graphics.getWidth() -  self.width ) / 2
    self.y = ( love.graphics.getHeight()  -  self.height ) / 2
    self.speed = 400
    self.xVel = -self.speed
    self.yVel = 0
end

function Ball:update(dt)
    self:move(dt)
    self:checkCollision()
end

function Ball:checkPaddle(Paddle)
    if self.x + self.width > Paddle.x and self.x < Paddle.x + Paddle.width then
        if self.y + self.height > Paddle.y and self.y < Paddle.y + Paddle.height then
            local middleBall = self.y + self.height / 2
            local middlePaddle = Paddle.y + Paddle.height / 2
            local collisionPosition = middleBall - middlePaddle
            self.yVel = collisionPosition * 5
            if Paddle == Player then
                self.xVel = self.speed
            else
                self.xVel = -self.speed
            end
        end
    end
end

function Ball:checkCollision()
    self:checkPaddle(Player)
    self:checkPaddle(AI)
    self:checkScore()
    self:checkWall()
end

function Ball:checkScore()
    if self.x < 0 then
        self:resetPossition()
        AI.score = AI.score + 1
    elseif self.x + self.width > love.graphics.getWidth() then
        self:resetPossition()
        Player.score = Player.score + 1
    end
end

function Ball:resetPossition()
    self.x = ( love.graphics.getWidth() -  self.width ) / 2
    self.y = ( love.graphics.getHeight()  -  self.height ) / 2
    self.yVel = 0
    self.xVel = -self.xVel
end

function Ball:checkWall()
    if self.y < 0 then
        self.y = 0
        self.yVel = -self.yVel
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end
end

function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:draw()
    love.graphics.draw(self.img, self.x, self.y)
end
