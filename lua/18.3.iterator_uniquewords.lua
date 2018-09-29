--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/29/2018
-- Time: 22:24
-- To change this template use File | Settings | File Templates.
--

local function uniquewords()
    local line = io.read() -- current line
    local pos = 1 -- current position in the line
    local map = {}
    return function() -- iterator function
        while line do -- repeat while there are lines
            local w, e = string.match(line, "(%w+)()", pos)
            if w then -- found a new word?
                pos = e -- next position is after this word
                if not map[w] then
                    map[w] = 1
                    return w -- return the word
                end
            else
                line = io.read() -- word not found; try next line
                pos = 1 -- restart from first position
            end
        end
        return nil -- no more lines: end of traversal
    end
end

for w in uniquewords() do
    print(w)
end
