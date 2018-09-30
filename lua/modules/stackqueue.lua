--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 10/1/2018
-- Time: 00:34
-- To change this template use File | Settings | File Templates.
--

-- Exercise 21.2
local StackQueue = require "stack":new({l = 1})

function StackQueue:isempty()
    return self.r >= self.l
end

function StackQueue:insertbottom(e)
    self.l = self.l - 1
    self.list[self.l] = e
    return e
end

function StackQueue:tostring()
    local l = {}
    for i = self.l, self.r do
        l[#l + 1] = self.list[i]
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

return StackQueue
