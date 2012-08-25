Movement = Class{
  function (self, name, max_lv, max_av, traction, sounds)
    self.name = name
    self.max_lv = max_lv
    self.max_av = max_av
    self.traction = traction
    self.sounds = sounds
  end
}

function Movement:input()
end

function Movement:update(dt)
end
