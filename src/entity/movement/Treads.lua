Treads = Class{
  inherits = Movement,
  function (self, level)
    local m = 4 - level
    Movement.construct(self, 'Treads', 100 / m, 30 / m, 5, nil)
    self.da = 15
    self.magn = 0
    self.origin = {x = 5, y = 5} -- change when using images
  end
}

function Treads:move(k, u)
  self.origin.x = 5
  if love.keyboard.isDown('w') and love.keyboard.isDown('up') then
    self.moving = 'forward'
  elseif love.keyboard.isDown('s') and love.keyboard.isDown('down') then
    self.moving = 'reverse'
  end
end

-- Ugly...
function Treads:turn(k, u)
  if k == 'w' and not love.keyboard.isDown('up') then
    self.turning = 'clock'
    if not love.keyboard.isDown('down') then
      self.origin.x = 10
    end
  elseif k == 's' and not love.keyboard.isDown('down') then
    self.turning = 'clock'
    if not love.keyboard.isDown('up') then
      self.origin.x = 0
    end
  elseif k == 'up' and not love.keyboard.isDown('w') then
    self.turning = 'counter'
    if not love.keyboard.isDown('s') then
      self.origin.x = 10
    end
  elseif k == 'down' and not love.keyboard.isDown('s') then
    self.turning = 'counter'
    if not love.keyboard.isDown('w') then
      self.origin.x = 0
    end
  end
end

function Treads:keyreleased(k, u)
  if k == 'w' or k == 's' or k == 'up' or k == 'down' then
    self.moving = nil
    self.turning = nil
  end
end

function Treads:updateHook(dt, acc)
  print('moving:', self.moving)
  print('turning:', self.turning)

  local md = 1
  if self.magn < 0 then
    md = -1
  end
  self.magn = math.sqrt(self.lv.x ^ 2 + self.lv.y ^ 2) * md

  if self.moving == 'forward' then
    self.magn = math.min(self.magn + acc, self.lv_bnd)
    self.turning = nil
  elseif self.moving == 'reverse' then
    self.magn = math.max(self.magn - acc, -self.lv_bnd)
    self.turning = nil
  else
    if self.turning == 'clock' then
      self.angle = self.angle - self.da
    elseif self.turning == 'counter' then
      self.angle = self.angle + self.da
    end
  end

  local rad = self.angle * math.pi / 180

  self.lv.x = self.magn * math.cos(rad)
  self.lv.y = self.magn * math.sin(rad)
end
