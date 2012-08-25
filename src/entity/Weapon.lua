Weapon = Class{
  function (self, name, damage, sounds)
    self.name = name
    self.damage = damage
    self.sounds = sounds
  end
}

function Weapon:input()
end

function Weapon:update(v)
end
