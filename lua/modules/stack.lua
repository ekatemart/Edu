--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/30/2018
-- Time: 23:35
-- To change this template use File | Settings | File Templates.
--


-- Exercise 21.1
local Stack = {}

function Stack:push(e)
    self.r = self.r + 1
    self.list[self.r] = e
    return e
end

function Stack:pop()
    if self:isempty() then error"Stack is empty" end
    local e = self.list[self.r]
    self.list[self.r] = nil
    self.r = self.r - 1
    return e
end

function Stack:top()
    return self.list[self.r]
end

function Stack:isempty()
    return self.r == 0
end

function Stack:tostring()
    return "{" .. table.concat(self.list, ", ") .. "}"
end

function Stack:new(s)
    s = s or {}
    s.list = s.list or {}
    s.r = #s.list
    self.__index = self
    self.__tostring = self.tostring
    setmetatable(s, self)
    return s
end

return Stack
