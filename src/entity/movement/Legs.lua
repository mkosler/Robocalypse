Legs = Class{
  inherits = Movement,
  function (self, level)
    local m = 4 - level
    Movement.construct(self, 'Legs', 75 / m, 30 / m, 15, nil)
    self.keys = {
      move = {
        up    = 'w',
        down  = 's',
        left  = '',
        right = ''
      },
      turn = {
        clock   = 'd',
        counter = 'a'
      }
    }
    self.da = 30
    self.magn = 0
  end
}

function Legs:updateHook(dt, acc)
  if self.turning == 'clock' then
    self.angle = self.angle - self.da
  elseif self.turning == 'counter' then
    self.angle = self.angle + self.da
  end
end
