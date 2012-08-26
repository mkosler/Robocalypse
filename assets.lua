-- Image: 208, 96
--
-- {{{ Field }}}
-- top-left:    0,   0,  32,  32
-- top-mid:    32,   0,  32,  32
-- top-right:  64,   0,  32,  32
-- left-mid:    0,  32,  32,  32
-- middle:     32,  32,  32,  32
-- right-mid:  64,  32,  32,  32
-- bot-left:    0,  64,  32,  32
-- bot-mid:    32,  64,  32,  32
-- bot-right:  64,  64,  32,  32
-- ground:     96,   0,  32,  32
--
-- {{{ Weapons }}}
-- { Ram }
-- first:      96,  32,  16,   9
-- second:     96,  41,  16,   9
-- third:      96,  50,  16,   9
-- { Bolt }
-- first:     112,  32,  16,   9
-- second:    112,  41,  16,   9
-- third:     112,  50,  16,   9
-- { Sword }
-- first:     128,  32,  16,   9
-- second:    128,  41,  16,   9
-- third:     128,  50,  16,   9
--
-- {{{ Movement }}}
-- { Wheels }
-- first:      96,  59,   8,  16
-- second:    104,  59,   8,  16
-- third:     112,  59,   8,  16
-- { Treads }
-- first:     120,  59,   8,  16
-- second:    128,  59,   8,  16
-- { Legs }
-- first-l:    96,  75,   8,  16
-- first-r:   104,  75,   8,  16
-- second-l:  112,  75,   8,  16
-- second-r:  120,  75,   8,  16
-- { Hover }
-- left:      128,   0,   8,  16
-- right:     136,   0,   8,  16
--
-- {{{ Avatars }}}
-- slug:      144,   0,  32,  32
-- hairy:     176,   0,  32,  32
-- shark:     144,  32,  32,  32
-- robot:     176,  32,  32,  32

local newQuad = love.graphics.newQuad

return {
  image = love.graphics.newImage('assets/gfx/spritesheet.png')
  field = {
    newQuad(0, 0, 32, 32, 208, 96),
    newQuad(32, 0, 32, 32, 208, 96),
    newQuad(64, 0, 32, 32, 208, 96),
    newQuad(0, 32, 32, 32, 208, 96),
    newQuad(32, 32, 32, 32, 208, 96),
    newQuad(32, 64, 32, 32, 208, 96),
    newQuad(0, 64, 32, 32, 208, 96),
    newQuad(32, 64, 32, 32, 208, 96),
    newQuad(64, 64, 32, 32, 208, 96),
  },
  weapons = {
    ram = {
      newQuad(96, 32, 16, 9, 208, 96),
      newQuad(96, 41, 16, 9, 208, 96),
      newQuad(96, 50, 16, 9, 208, 96),
    },
    bolt = {
      newQuad(112, 32, 16, 9, 208, 96),
      newQuad(112, 41, 16, 9, 208, 96),
      newQuad(112, 50, 16, 9, 208, 96),
    },
    sword = {
      newQuad(128, 32, 16, 9, 208, 96),
      newQuad(128, 41, 16, 9, 208, 96),
      newQuad(128, 50, 16, 9, 208, 96),
    },
  },
  movement = {
    wheels = {
      newQuad(96, 59, 8, 16, 208, 96),
      newQuad(104, 59, 8, 16, 208, 96),
      newQuad(112, 59, 8, 16, 208, 96),
    },
    treads = {
      newQuad(120, 59, 8, 16, 208, 96),
      newQuad(128, 59, 8, 16, 208, 96),
    },
    legs = {
      newQuad(96, 75, 8, 16, 208, 96),
      newQuad(104, 75, 8, 16, 208, 96),
      newQuad(112, 75, 8, 16, 208, 96),
      newQuad(120, 75, 8, 16, 208, 96),
    },
    hover = {
      newQuad(128, 0, 8, 16, 208, 96),
      newQuad(136, 0, 8, 16, 208, 96),
    }.
  },
  avatars = {
    slug = newQuad(144, 0, 32, 32, 208, 96),
    hairy = newQuad(176, 0, 32, 32, 208, 96),
    shark = newQuad(144, 32, 32, 32, 208, 96),
    robot = newQuad(176, 32, 32, 32, 208, 96),
  },
}
