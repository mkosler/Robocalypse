local play = GameState.new()

local entities = {}

function play:init()
end

function play:enter(prev)
  entities = {}
  entities.player = PLAYER
end

function play:leave()
  entities.player = nil
end


function play:update(dt)
  for k,v in pairs(entities) do
    v:update(dt)
  end
end

function play:draw()
  for _,v in pairs(entities) do
    v:draw()
  end
end

function play:quit()
end

function play:keypressed(k, u)
  for _,v in pairs(entities) do
    v:keypressed(k, u)
  end
end

function play:keyreleased(k, u)
  for _,v in pairs(entities) do
    v:keyreleased(k, u)
  end
end

return play
