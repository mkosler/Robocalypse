Sword = Class{
  inherits = Weapon,
  function (self, level)
    self.level = level
    local m = 4 - level
    Weapon.construct(self, 'Sword', 10 / m, nil)
    self.quad = sprites.weapons.sword[level]
  end
}
