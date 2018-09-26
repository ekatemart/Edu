-- Exercise 10.1
-- Compatibility: Lua-5.1
function split(str, pat)
    local t = {}  -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pat
    local last_end = 1
    local s, e, cap = str:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(t,cap)
        end
        last_end = e+1
        s, e, cap = str:find(fpat, last_end)
    end
    if last_end <= #str then
        cap = str:sub(last_end)
        table.insert(t, cap)
    end
    return t
end

--local str = "a whole new world"
--print(table.unpack(split(str, " ")))
--
--local empty = ""
--print(#split(empty, " "))


-- Excercise 10.3
function transliterate(str, map)
    return (str:gsub("(.)", function(c)
        return map[c] or ""
    end))
end

print(transliterate("abcdefg", {
    a = "z",
    b = "y",
    c = "x"
}))
