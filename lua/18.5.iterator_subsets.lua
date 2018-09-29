--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/29/2018
-- Time: 22:56
-- To change this template use File | Settings | File Templates.
--

package.path = './modules/?.lua;' .. package.path

local dump = require "dump"

local function iter(state)
    state.i = state.i + 1
    if state.i >= state.tot then
        return nil
    end
    local subset = {}
    local quot = state.i
    local rem
    for i = 1, #state.keys do
        rem = quot & 1
        quot = quot >> 1
        if rem == 1 then
            subset[state.keys[i]] = state.set[state.keys[i]]
        end
    end
    return subset
end

local function subsets(set)
    local keys = {}
    for k, _ in pairs(set) do
        table.insert(keys, k)
    end
    return iter, { set = set, keys = keys, i = -1, tot = 2 ^ (#keys) }
end

for subset in subsets({ a = 1, b = 2, c = 3 }) do
    print(dump(subset))
end
