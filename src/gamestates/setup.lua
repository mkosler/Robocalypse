local setup = GameState.new()
local menu = {}
local menu_default = {
  armor = false,
  weapons = {
    main = false,
    ram = false,
    sword = false,
    bolt = false,
  },
  movement = {
    main = false,
    hover = false,
    legs = false,
    treads = false,
    wheels = false,
  },
}
local label = {
  pos = {10, 400},
  text = nil
}
local failed = false

function setup:init()
end

function setup:enter(prev)
  menu = menu_default
end

function setup:leave()
  label.text = nil
end

function setup:update(dt)
  -- {{{ Main }}}
  GUI.group.push{grow = 'down', pos = {10, 10}}

  if GUI.Button{text = 'Armor'} then
    menu.armor = not menu.armor
  end

  if menu.armor then
    -- {{{ Armor }}}
    GUI.group.push{grow = 'right'}

    if GUI.Button{text = 'Rubber'} then
      label.text = 'Weak physical protection\nLightweight\nHigh electrical protection'
      self:attemptchange(Rubber(), 'armor')
    end
    if GUI.Button{text = 'Plastic'} then
      label.text = 'Medium physical protection\nAverage weight\nNo electrical protection'
      self:attemptchange(Plastic(), 'armor')
    end
    if GUI.Button{text = 'Steel'} then
      label.text = 'High physical protection\nHeavyweight\nEnhances electrical damage'
      self:attemptchange(Steel(), 'armor')
    end

    GUI.group.pop{}
    -- {{{ END Armor }}}
  end

  if GUI.Button{text = 'Weapons'} then
    menu.weapons.main = not menu.weapons.main
  end

  if menu.weapons.main then
    -- {{{ Weapons }}}
    GUI.group.push{grow = 'right'}
    if GUI.Button{text = 'Sword'} then
      menu.weapons.sword = not menu.weapons.sword
    end

    if menu.weapons.sword then
      local default_sword_text = 'Use angular velocity to damage opponents!\n'

      -- {{{ Swords }}}
      GUI.group.push{grow = 'down'}

      local widget_info = {
        short_name = { 'Dull', 'Sharp', 'Diamond' },
        description = { 'Low quality', 'High quality', 'Ferocious' },
      }
      for i = 1, PLAYER.unlock.weapon.sword do
        if GUI.Button{text = widget_info.short_name[i]} then
          label.text = default_sword_text .. widget_info.description[i]
          self:attemptchange(Sword(i), 'weapon')
        end
      end

      GUI.group.pop{}
      -- {{{ END Swords }}}
    end

    if GUI.Button{text = 'Ram'} then
      menu.weapons.ram = not menu.weapons.ram
    end

    if menu.weapons.ram then
      local default_ram_text = 'Use linear velocity to crash into your opponents!\n'

      -- {{{ Ram }}}
      GUI.group.push{grow = 'down'}

      local widget_info = {
        short_name = { 'Balsa', 'Oak', 'Spring' },
        description = {
          'Softwood\nDoes minor recoil damage',
          'Hardwood\nDoes major recoil damage',
          'Hardwood\nDoes no recoil damage',
        },
      }
      for i = 1, PLAYER.unlock.weapons.ram do
        if GUI.Button{text = widget_info.short_name[i]} then
          label.text = default_ram_text .. widget_info.description[i]
          self:attemptchange(Ram(i), 'weapon')
        end
      end

      GUI.group.pop{}
      -- {{{ END Ram }}}
    end

    if GUI.Button{text = 'Bolt'} then
      menu.weapons.bolt = not menu.weapons.bolt
    end

    if menu.weapons.bolt then
      local default_bolt_text = 'Zap your opponents at range! The further away, the better!\n'

      -- {{{ Bolt }}}
      GUI.group.push{grow = 'down'}

      local widget_info = {
        short_name = { 'Static', 'Pulse', 'Stream' },
        description = {
          'Fires immediately after build-up of charge',
          'User activated (press SPACE)\nPulse firing',
          'User activated (press SPACE)\ncontinuous stream',
        },
      }
      for i = 1, PLAYER.unlock.weapons.bolt do
        if GUI.Button{text = widget_info.short_name[i]} then
          label.text = default_bolt .. widget_info.description[i]
          self:attemptchange(Bolt(i), 'weapon')
        end
      end

      GUI.group.pop{}
      -- {{{ END Bolt }}}
    end

    GUI.group.pop{}
    -- {{{ END Weapons }}}
  end

  if GUI.Button{text = 'Movement'} then
    menu.movement.main = not menu.movement.main
  end

  if menu.movement.main then
    -- {{{ Movement }}}
    GUI.group.push{grow = 'right'}

    if GUI.Button{text = 'Hover'} then
      menu.movement.hover = not menu.movement.hover
    end

    if menu.movement.hover then
      label.text = 'Omni-directional movement (WASD)\nExtremely slow rotation (Q/E counter-clockwise/clockwise)\nLow traction'

      -- {{{ Hover }}}
      GUI.group.push{grow = 'down'}

      for i = 1, PLAYER.unlock.movement.hover do
        if GUI.Button{text = 'Level ' .. i} then
          self:attemptchange(Hover(i), 'movement')
        end
      end

      GUI.group.pop{}
      -- {{{ END Hover }}}
    end

    if GUI.Button{text = 'Legs'} then
      menu.movement.legs = not menu.movement.legs
    end

    if menu.movement.legs then
      label.text = 'Similar to wheel steering (W/S acceleration/reverse, A/D turn)\nZero turn radius'

      -- {{{ Legs }}}
      GUI.group.push{grow = 'down'}

      for i = 1, PLAYER.unlock.movement.legs do
        if GUI.Button{text = 'Level ' .. i} then
          self:attemptchange(Legs(i), 'movement')
        end
      end

      GUI.group.pop{}
      -- {{{ END Legs }}}
    end

    if GUI.Button{text = 'Treads'} then
      menu.movement.treads = not menu.movement.treads
    end

    if menu.movement.treads then
      label.text = 'Tank steering (W/S forward/reverse for left tread, UP/DOWN for right tread)\nSlow linear velocity, but highest angular velocity'

      -- {{{ Treads }}}
      GUI.group.push{grow = 'down'}

      for i = 1, PLAYER.unlock.movement.treads do
        if GUI.Button{text = 'Level ' .. i} then
          self:attemptchange(Treads(i), 'movement')
        end
      end

      GUI.group.pop{}
      -- {{{ END Treads }}}
    end

    if GUI.Button{text = 'Wheels'} then
      menu.movement.wheels = not menu.movement.wheels
    end

    if menu.movement.wheels then
      label.text = 'Typical car steering (W/S forward/reverse, A/D turn left/turn right)\nHighest linear velocity available'

      -- {{{ Wheels }}}
      GUI.group.push{grow = 'down'}

      for i = 1, PLAYER.unlock.movement.wheels do
        if GUI.Button{text = 'Level ' .. i} then
          self:attemptchange(Wheels(i), 'movement')
        end
      end

      GUI.group.pop{}
      -- {{{ END Wheels }}}
    end

    GUI.group.pop{}
    -- {{{ END Movement }}}
  end

  GUI.group.pop{}
  -- {{{ END Main }}}
  
  -- {{{ Options }}}
  GUI.group.push{pos = {530, 10}, grow = 'left'}

  if GUI.Button{text = 'Quit'} then
    self:quit()
  end
  if GUI.Button{text = 'Start'} then
    if PLAYER:assemblegraphic() then
      switchState('play')
    end
  end
  if GUI.Button{text = 'Scrap/Salvage'} then
  end

  GUI.group.pop{}
  -- {{{ END Options }}}

  if label.text ~= nil then
    GUI.Label(label)
  end
  if failed then
    GUI.Label{
      pos = {love.graphics.getWidth() / 2, love.graphics.getHeight() / 4},
      text = 'Cannot add gear to occupied slot\nPlease scrap and salvage before changing gear'
    }
  end
end

function setup:attemptchange(new_gear, kind)
  failed = PLAYER:changegear(new_gear, kind)
end

function setup:draw()
  GUI.core.draw()
end

function setup:keypressed(k, u)
  GUI.keyboard.pressed(k, u)
end

function setup:quit()
  print('Quitting...')
end

return setup
