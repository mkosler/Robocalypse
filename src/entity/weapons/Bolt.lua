Bolt = Class{
  inherits = Weapon,
  function (self, level)
    local m = 4 - level
    Weapon.construct(self, 'Bolt', 3 / m, nil)
    self.image = sprites.weapons.bolt[m]
    self.start = 2
    self.fire = false
  end
}

function Bolt:keypressed(k, u)
  if k == ' ' then
    self.fire = true
  end
end

function Bolt:update(dt)
  self.start = self.start - dt
  if self.start < 0 and self.fire then
    self.start = 2
    self.fire = false
    -- Damage other player
  end
end
