Entity = Class{
  function (self, name, image, color, movement, armor, weapon)
    self.name = name

    self.x = 0
    self.vx = 0

    self.y = 0
    self.vy = 0

    self.image = image
    self.color = color or {255, 0, 0, 0}

    -- Components
    self.movement = movement
    self.armor = armor
    self.weapon = weapon
  end
}

function Entity:input()
  self.movement:input()
  self.weapon:input()
end

function Entity:update(dt)
  local v = self.movement:update(dt)
  self.weapon:update(v)
end

function Entity:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle('fill', self.x, self.y, 10, 10)

  -- Reset color
  love.graphics.setColor(255, 255, 255)
end
