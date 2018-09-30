--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/30/2018
-- Time: 20:17
-- To change this template use File | Settings | File Templates.
--

local Set = {}
local mt = {} -- metatable for sets

-- create a new set with the values of a given list
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do set[v] = true end
    return set
end

function Set.union(a, b)
    local res = Set.new {}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end

function Set.intersection(a, b)
    local res = Set.new {}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

function Set.difference(a, b)
    local res = Set.new {}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = nil end
    return res
end

function Set.length(a)
    local count = 0
    for _ in pairs(a) do count = count + 1 end
    return count
end

-- presents a set as a string
function Set.tostring(set)
    local l = {} -- list to put all elements from the set
    for e in pairs(set) do
        l[#l + 1] = tostring(e)
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

mt.__add = Set.union
mt.__mul = Set.intersection
mt.__sub = Set.difference -- Exercise 20.1
mt.__len = Set.length -- Exercise 20.2
mt.__le = function (a, b) -- subset
    for k in pairs(a) do
        if not b[k] then return false end
    end
    return true
end
mt.__lt = function (a, b) -- proper subset
    return a <= b and not (b <= a)
end
mt.__eq = function (a, b)
    return a <= b and b <= a
end
mt.__tostring = Set.tostring


return Set
