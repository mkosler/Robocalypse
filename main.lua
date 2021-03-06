-- Library imports
Class = require 'lib.hump.class'
GameState = require 'lib.hump.gamestate'
HC = require 'lib.HardonCollider'
GUI = require 'lib.Quickie'

-- Game imports
sprites = require 'assets'
require 'src.entity.Entity'

-- Movement
require 'src.entity.Movement'
require 'src.entity.movement.Hover'
require 'src.entity.movement.Wheels'
require 'src.entity.movement.Legs'
require 'src.entity.movement.Treads'

-- Weapon
require 'src.entity.Weapon'
require 'src.entity.weapons.Bolt'
require 'src.entity.weapons.Ram'
require 'src.entity.weapons.Sword'

-- Armor
require 'src.entity.Armor'
require 'src.entity.armor.Plastic'
require 'src.entity.armor.Rubber'
require 'src.entity.armor.Steel'

-- Gamestates
states = {}
states.buy =    require 'src.gamestates.buy'
states.finish = require 'src.gamestates.finish'
states.play =   require 'src.gamestates.play'
states.setup =  require 'src.gamestates.setup'
states.title =  require 'src.gamestates.title'

PLAYER = Entity('Player')

function switchState(state, ...)
  GameState.switch(states[state], ...)
end

function love.load()
  GameState.registerEvents()
  switchState('setup')
end
