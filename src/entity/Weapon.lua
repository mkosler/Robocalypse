Weapon = Class{
  function (self, name, damage, sounds)
    self.name = name
    self.damage = damage
    self.sounds = sounds
  end
}

function Weapon:keypressed(k, u)
end

function Weapon:keyreleased(k, u)
end

function Weapon:update(dt)
end
