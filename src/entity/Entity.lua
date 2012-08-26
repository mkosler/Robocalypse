Entity = Class{
  function (self, name, movement, armor, weapon)
    self.name = name

    self.x = 0
    self.y = 0

    self.color = color or {255, 0, 0, 0}

    self.movement = movement
    self.armor = armor
    self.weapon = weapon

    self.unlock = {
      movement = {
        hover = 1,
        legs = 1,
        treads = 1,
        wheels = 1,
      },
      weapon = {
        bolt = 1,
        ram = 1,
        sword = 1,
      },
    }
  end
}

function Entity:keypressed(k, u)
  self.movement:keypressed(k, u)
  self.weapon:keypressed(k, u)
end

function Entity:keyreleased(k, u)
  self.movement:keyreleased(k, u)
  self.weapon:keyreleased(k, u)
end

function Entity:update(dt)
  self.movement:update(dt)
  self.weapon:update(dt)

  if self.movement.origin_offset == 'left' then
    self.origin.x = 0
  elseif self.movement.origin_offset == 'right' then
    self.origin.x = self.image:getWidth()
  elseif self.movement.origin_offset == 'middle' then
    self.origin.x = self.image:getWidth() / 2
  end

  self.x = self.x + (self.movement.lv.x * dt)
  self.y = self.y + (self.movement.lv.y * dt)
end

function Entity:draw()
  love.graphics.draw(
    self.image,
    self.x,
    self.y,
    self.movement.angle,
    1,
    1,
    self.origin.x,
    self.origin.y
  )
end

function Entity:changegear(new_gear, kind)
  if self[kind] ~= nil and self[kind].name ~= new_gear.name and self[kind] then
    return false
  else
    self[kind] = new_gear
    return true
  end
end

function Entity:assemblegraphic()
  if self.movement == nil or self.weapon == nil or self.armor == nil then return false end
  self.image = love.graphics.newCanvas(32, 25)
  self.image:renderTo(
    function()
      love.graphics.drawq(sprites.image, sprites.chassis, 8, 9)
      love.graphics.drawq(sprites.image, self.movement.quad, 0, 9)
      love.graphics.drawq(sprites.image, self.movement.quad, 24, 9, math.pi)
      love.graphics.drawq(sprites.image, self.weapon.quad, 8, 0)
    end)
  self.origin = {
    x = self.image:getWidth() / 2,
    y = self.image:getHeight() / 2
  }
  return true
end
