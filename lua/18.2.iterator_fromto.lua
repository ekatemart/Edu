--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/29/2018
-- Time: 22:01
-- To change this template use File | Settings | File Templates.
--

package.path = './modules/?.lua;' .. package.path

local dump = require "dump"

-- Exercise 18.2
-- Implemented as a stateless iterator
local function iter(state, i)
    if i == nil then
        return state.left
    end
    local next = i + state.step
    return next <= state.right and next or nil
end

local function fromto(left, right, step)
    return iter, {left = left, right = right, step = step}, nil
end

for i in fromto(0, 100, 5) do
    print(i)
end
