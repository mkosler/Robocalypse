Hover = Class{
  inherits = Movement,
  function (self, level)
    local m = 4 - level
    Movement.construct(self, 'Hover', 100 / m, 30 / m, 5, nil)
    self.keys = {
      move = {
        up    = 'w',
        down  = 's',
        left  = 'a',
        right = 'd'
      },
      turn = {
        clock   = 'q',
        counter = 'e'
      }
    }
  end
}

function Hover:updateHook(dt, acc)
  if self.moving == 'forward' then
    self.lv.y = bound(self.lv.y - acc, -self.lv_bnd, self.lv_bnd)
  elseif self.moving == 'reverse' then
    self.lv.y = bound(self.lv.y + acc, -self.lv_bnd, self.lv_bnd)
  end

  if self.sliding == 'left' then
    self.lv.x = bound(self.lv.x - acc, -self.lv_bnd, self.lv_bnd)
  elseif self.sliding == 'right' then
    self.lv.x = bound(self.lv.x + acc, -self.lv_bnd, self.lv_bnd)
  end

  if self.turning == 'clock' then
  elseif self.turning == 'counter' then
  end
end
