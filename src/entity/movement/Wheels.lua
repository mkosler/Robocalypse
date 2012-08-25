Wheels = Class{
  inherits = Movement,
  function (self, level)
    local m = 4 - level
    Movement.construct(self, 'Wheels', 125 / m, 30 / m, 15, nil)
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
    self.da = 70
    self.magn = 0
  end
}

function Wheels:updateHook(dt, acc)
  if self.magn ~= 0 then
    if self.turning == 'clock' then
      self.angle = self.angle - self.da
    elseif self.turning == 'counter' then
      self.angle = self.angle + self.da
    end
  end

  local rad = self.angle * math.pi / 180

  if self.moving == 'forward' then
    self.magn = math.min(self.magn + acc, self.lv_bnd)
  elseif self.moving == 'reverse' then
    self.magn = math.max(self.magn - acc, -self.lv_bnd)
  end

  self.lv.x = self.magn * math.cos(rad)
  self.lv.y = self.magn * math.sin(rad)
end
