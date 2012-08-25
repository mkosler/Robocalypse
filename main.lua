-- Library imports
Class = require 'lib.hump.class'
HC = require 'lib.HardonCollider'

-- Game imports
require 'src.entity.Entity'
require 'src.entity.Movement'
require 'src.entity.Weapon'
require 'src.entity.Armor'

function love.load()
  local movement = Movement('test', 10, 10, 0.5, nil)
  local weapon = Weapon('test', 10, nil)
  local armor = Armor('test', 5, 5, 0.5)
  entities = {}
  entities.player = Entity('test', nil, {0, 0, 255}, movement, armor, weapon)
end

function love.update(dt)
  for _,v in pairs(entities) do
    v:input()
    v:update(dt)
  end
end

function love.draw()
  for _,v in pairs(entities) do
    v:draw()
  end
end
