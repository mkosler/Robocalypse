-- Library imports
Class = require 'lib.hump.class'
GameState = require 'lib.hump.gamestate'
HC = require 'lib.HardonCollider'

-- Game imports
require 'src.entity.Entity'

-- Movement
require 'src.entity.Movement'
require 'src.entity.movement.Hover'
require 'src.entity.movement.Wheels'

-- Weapon
require 'src.entity.Weapon'

-- Armor
require 'src.entity.Armor'

-- Gamestates
states = {}
states.buy =    require 'src.gamestates.buy'
states.finish = require 'src.gamestates.finish'
states.play =   require 'src.gamestates.play'
states.setup =  require 'src.gamestates.setup'
states.title =  require 'src.gamestates.title'

function switchState(state, ...)
  GameState.switch(states[state], ...)
end

function love.load()
  GameState.registerEvents()
  switchState('play')
end

--function love.update(dt)
--end

--function love.draw()
--end
