Ram = Class{
  inherits = Weapon,
  function (self, level)
    local m = 4 - level
    Weapon.construct(self, 'Ram', 20 / m, nil)
    self.quad = sprites.weapons.ram[m]
  end
}
