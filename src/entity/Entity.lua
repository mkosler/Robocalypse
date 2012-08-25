Entity = Class{
  function (self, name, image, color, movement, armor, weapon)
    self.name = name

    self.x = 0
    self.y = 0

    self.image = image
    self.color = color or {255, 0, 0, 0}

    -- Components
    self.movement = movement
    self.armor = armor
    self.weapon = weapon
  end
}

function Entity:keypressed(k, u)
  self.movement:keypressed(k, u)
  --self.weapon:keypressed(k, u)
end

function Entity:keyreleased(k, u)
  self.movement:keyreleased(k, u)
  --self.weapon:keyreleased(k, u)
end

function Entity:update(dt)
  self.movement:update(dt)

  self.x = self.x + (self.movement.lv.x * dt)
  self.y = self.y + (self.movement.lv.y * dt)
end

function Entity:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle('fill', self.x, self.y, 10, 10)

  -- Reset color
  love.graphics.setColor(255, 255, 255)
end
