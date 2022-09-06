require("player")
require("ball")
require("ai")
require("background")


function love.load()
    Player:load()
    Ball:load()
    AI:load()
    Background:load()
    local font = love.graphics.newFont(30)
    love.graphics.setFont(font)
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    AI:update(dt)
    Background:update(dt)
end

function love.draw()
    Background:draw()
    Player:draw()
    Ball:draw()
    AI:draw()
    love.graphics.print("Artificial Player 1: " .. Player.score, 50, 20)
    love.graphics.print("Artificial Player 2: " .. AI.score, 900, 20)
end
