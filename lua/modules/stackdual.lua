--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 10/1/2018
-- Time: 01:14
-- To change this template use File | Settings | File Templates.
--

-- Exercise 21.3
-- Stack using dual representation
local Stack = {}

local list = {}

local function getList(key)
    if list[key] then return list[key] end
    list[key] = {}
    return list[key]
end

function Stack:push(e)
    local l = getList(self)
    l[#l + 1] = e
    return e
end

function Stack:pop()
    if self:isempty() then error "Stack is empty" end
    local l = getList(self)
    local e = l[#l]
    l[#l] = nil
    return e
end

function Stack:top()
    local l = getList(self)
    return l[#l]
end

function Stack:isempty()
    return #getList(self) == 0
end

function Stack:tostring()
    return "{" .. table.concat(getList(self), ", ") .. "}"
end

function Stack:new()
    local s = {}
    self.__index = self
    self.__tostring = self.tostring
    setmetatable(s, self)
    return s
end

return Stack
