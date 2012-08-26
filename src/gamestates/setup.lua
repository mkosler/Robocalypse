local setup = GameState.new()
local menu = {}

function setup:init()
end

function setup:enter(prev)
  menu = {
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
      wheels = false,
      treads = false,
    },
  }
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

    end
    if GUI.Button{text = 'Plastic'} then
    end
    if GUI.Button{text = 'Steel'} then
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
      -- {{{ Swords }}}
      GUI.group.push{grow = 'down'}

      if GUI.Button{text = 'Dull'} then
      end
      if GUI.Button{text = 'Sharp'} then
      end
      if GUI.Button{text = 'Diamond'} then
      end

      GUI.group.pop{}
      -- {{{ END Swords }}}
    end

    if GUI.Button{text = 'Ram'} then
      menu.weapons.ram = not menu.weapons.ram
    end

    if menu.weapons.ram then
      -- {{{ Ram }}}
      GUI.group.push{grow = 'down'}

      if GUI.Button{text = 'Balsa'} then
      end
      if GUI.Button{text = 'Oak'} then
      end
      if GUI.Button{text = 'Spring'} then
      end

      GUI.group.pop{}
      -- {{{ END Ram }}}
    end

    if GUI.Button{text = 'Bolt'} then
      menu.weapons.bolt = not menu.weapons.bolt
    end

    if menu.weapons.bolt then
      -- {{{ Bolt }}}
      GUI.group.push{grow = 'down'}

      if GUI.Button{text = 'Static'} then
      end
      if GUI.Button{text = 'Pulse'} then
      end
      if GUI.Button{text = 'Stream'} then
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
      -- {{{ Hover }}}
      GUI.group.push{grow = 'down'}

      if GUI.Button{text = 'Level 1'} then
      end
      if GUI.Button{text = 'Level 2'} then
      end
      if GUI.Button{text = 'Level 3'} then
      end

      GUI.group.pop{}
      -- {{{ END Hover }}}
    end

    if GUI.Button{text = 'Legs'} then
      menu.movement.legs = not menu.movement.legs
    end

    if menu.movement.legs then
      -- {{{ Legs }}}
      GUI.group.push{grow = 'down'}

      if GUI.Button{text = 'Level 1'} then
      end
      if GUI.Button{text = 'Level 2'} then
      end
      if GUI.Button{text = 'Level 3'} then
      end

      GUI.group.pop{}
      -- {{{ END Legs }}}
    end

    if GUI.Button{text = 'Treads'} then
      menu.movement.treads = not menu.movement.treads
    end

    if menu.movement.treads then
      -- {{{ Treads }}}
      GUI.group.push{grow = 'down'}

      if GUI.Button{text = 'Level 1'} then
      end
      if GUI.Button{text = 'Level 2'} then
      end
      if GUI.Button{text = 'Level 3'} then
      end

      GUI.group.pop{}
      -- {{{ END Treads }}}
    end

    if GUI.Button{text = 'Wheels'} then
      menu.movement.wheels = not menu.movement.wheels
    end

    if menu.movement.wheels then
      -- {{{ Wheels }}}
      GUI.group.push{grow = 'down'}

      if GUI.Button{text = 'Level 1'} then
      end
      if GUI.Button{text = 'Level 2'} then
      end
      if GUI.Button{text = 'Level 3'} then
      end

      GUI.group.pop{}
      -- {{{ END Wheels }}}
    end

    GUI.group.pop{}
    -- {{{ END Movement }}}
  end

  GUI.group.pop{}
  -- {{{ END Main }}}
end

function setup:draw()
  GUI.core.draw()
end

function setup:keypressed(k, u)
  GUI.keyboard.pressed(k, u)
end

function setup:quit()
end

return setup
