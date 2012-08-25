Movement = Class{
  function (self, name, lv_bnd, av_bnd, traction, sounds)
    self.name = name

    self.lv = {x = 0, y = 0}
    self.lv_bnd = lv_bnd
    self.lv_acc = lv_bnd / 4

    self.av = 0
    self.av_bnd = av_bnd
    self.av_acc = av_bnd / 4

    self.angle = 0

    self.traction = traction
    self.sounds = sounds

    self.moving = nil
    self.sliding = nil
    self.turning = nil

    self.keys = {
      move = {
        up    = '',
        down  = '',
        left  = '',
        right = ''
      },
      turn = {
        clock   = '',
        counter = ''
      }
    }
  end
}

function Movement:keypressed(k, u)
  self:move(k, u)
  self:turn(k, u)
end

function Movement:keyreleased(k, u)
  if k == self.keys.move.up or k == self.keys.move.down then
    self.moving = nil
  end

  if k == self.keys.move.left or k == self.keys.move.right then
    self.sliding = nil
  end

  for _,v in pairs(self.keys.turn) do
    if k == v then
      self.turning = nil
    end
  end
end

function bound(x, l, u)
  return math.min(math.max(x, l), u)
end

function Movement:move(k, u)
  if k == self.keys.move.up then
    self.moving = 'forward'
  elseif k == self.keys.move.down then
    self.moving = 'reverse'
  end

  if k == self.keys.move.left then
    self.sliding = 'left'
  elseif k == self.keys.move.right then
    self.sliding = 'right'
  end
end

function Movement:turn(k, u)
  if k == self.keys.turn.clock then
    self.turning = 'clock'
  elseif k == self.keys.turn.counter then
    self.turning = 'counter'
  end
end

function Movement:update(dt)
  local acc = self.lv_acc
  if love.keyboard.isDown('lshift', 'rshift') then
    acc = acc / 2
  end

  self:updateHook(dt, acc)

  if self.lv.x < 0 then
    self.lv.x = math.min(self.lv.x + self.traction, 0)
  else
    self.lv.x = math.max(self.lv.x - self.traction, 0)
  end

  if self.lv.y < 0 then
    self.lv.y = math.min(self.lv.y + self.traction, 0)
  else
    self.lv.y = math.max(self.lv.y - self.traction, 0)
  end
end

function Movement:updateHook(dt, acc)
end
