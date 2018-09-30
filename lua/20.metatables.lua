--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/29/2018
-- Time: 23:52
-- To change this template use File | Settings | File Templates.
--

package.path = './modules/?.lua;' .. package.path

local Set = require "set"
local dump = require "dump"

--print(dump(getmetatable("hi")))

local function readOnly (t)
    local proxy = {}
    local mt = { -- create metatable
        __index = t,
        __newindex = function (t, k, v)
            error("attempt to update a read-only table", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end


local a = Set.new {1,2,3}
local b = Set.new {3,4}
print(a - b)
print(#(a - b))

