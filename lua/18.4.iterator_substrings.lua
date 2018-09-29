--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/29/2018
-- Time: 22:38
-- To change this template use File | Settings | File Templates.
--

local function iter(state)
    if state.right < #state.str then
        state.right = state.right + 1
        return state.str:sub(state.left, state.right)
    elseif state.left < #state.str then
        state.left = state.left + 1
        state.right = state.left
        return state.str:sub(state.left, state.right)
    end
    return nil
end

local function substrings(str)
    return iter, {str = str, left = 1, right = 0}
end

for sub in substrings("lua") do
    print(sub)
end
