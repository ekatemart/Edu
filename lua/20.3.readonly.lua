--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/30/2018
-- Time: 20:49
-- To change this template use File | Settings | File Templates.
--

-- Exercise 20.3

local mt = {
    __index = function(t, k)
        return t[k]
    end,
    __newindex = function(t, k, v)
        error("attempt to update a read-only table", 2)
    end
}

function readOnly(t)
    local proxy = {}
    setmetatable(proxy, mt)
    return proxy
end
