Background = {}


function Background:load()
    self.universe = love.graphics.newImage("assets/universe.png")
    self.planets = love.graphics.newImage("assets/planets.png")
    self.width = self.planets:getWidth()
    self.height = self.planets:getHeight()
    self.centerX = self.width / 2
    self.centerY = self.height / 2
    self.rotation = 0
end

function Background:update(dt)
    self.rotation = self.rotation + 0.05 * dt
end

function Background:draw()
    love.graphics.draw(self.universe, 0, 0)
    love.graphics.draw(self.planets, self.centerX, self.centerY, self.rotation, 1, 1, self.centerX, self.centerY)
end