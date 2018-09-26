--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/18/2018
-- Time: 00:48
-- To change this template use File | Settings | File Templates.
--

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end


a = {};
a.a = a
a.b = 3
print(dump(a))
