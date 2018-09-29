--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/29/2018
-- Time: 22:01
-- To change this template use File | Settings | File Templates.
--

-- Exercise 18.1
-- Implemented as a stateless iterator
local function iter(m, i)
    return i < m and i + 1 or nil
end

local function fromto(n, m)
    return iter, m, n - 1
end

for i in fromto(1, 10) do
    print(i)
end

