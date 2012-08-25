local play = GameState.new()

local entities = {}

function play:init()
end

function play:enter(prv, player)
  entities = {}
  
  local hover = Hover(1)
  local wheels = Wheels(1)
  local legs = Legs(1)
  local treads = Treads(1)
  local weapon = Weapon('test weapon', 10, nil)
  local armor = Armor('test armor', 1, 1, 0)

  entities.player = Entity('test player', nil, {0,0,255}, treads, armor, weapon)
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
