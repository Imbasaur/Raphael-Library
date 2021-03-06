Point = { __class = 'Point' }
PointMT = { __index = Point }

function Point:new(x, y)
    if type(x) == 'Point' then
        return x
    elseif type(x) == 'table' or type(x) == 'userdata' then
        if x.x ~= nil then
            x, y = x.x, x.y
        else
            x, y = x[1], x[2]
        end
    elseif type(x) == 'string' or type(x) == 'string' then
        x = tonumber(x)
        y = tonumber(y)
    end

    if type(x) ~= 'number' or type(y) ~= 'number' then
        return nil
    end

    x, y = math.round(x), math.round(y)

    local newObj = {x = x, y = y}
    setmetatable(newObj, PointMT)
    return newObj
end

function PointMT:__add(value)
    self = Point:new(self)
    value = Point:new(value)

    return Point:new(self.x + value.x, self.y + value.y)
end

function PointMT:__sub(value)
    self = Point:new(self)
    value = Point:new(value)

    return Point:new(self.x - value.x, self.y - value.y)
end

function PointMT:__mul(value)
    self = Point:new(self)
    value = Point:new(value)

    return Point:new(self.x * value.x, self.y * value.y)
end

function PointMT:__div(value)
    self = Point:new(self)
    value = Point:new(value)

    return Point:new(self.x / value.x, self.y / value.y)
end

function PointMT:__unm()
    return self * {-1, -1}
end

function PointMT:__eq(value)
    return self.x == value.x and self.y == value.y
end

function PointMT:__tostring()
    return '{x = ' .. self.x .. ', y = ' .. self.y .. '}'
end
