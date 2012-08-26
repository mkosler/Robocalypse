Sword = Class{
  inherits = Weapon,
  function (self, level)
    local m = 4 - level
    Weapon.construct(self, 'Sword', 10 / m, nil)
    self.image = sprites.weapons.sword[m]
  end
}
