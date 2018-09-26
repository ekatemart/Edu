-- Exercise 16.1
function loadwithprefix(prefix, ld, ...)
    local i = 0
    local function new_ld()
        if i == 0 then
            i = i + 1
            return prefix
        elseif type(ld) == "string" and i == 1 then
            i = i + 1
            return ld
        elseif type(ld) == "function" then
            return ld()
        end
        return nil
    end

    return load(new_ld, ...)
end

--loadwithprefix("print('This is prefix 1!')", "print('Original chunk')")()
--loadwithprefix("print('This is prefix 2!')", io.lines("test.lua", "*L"))()


-- Exercise 16.2
function multiload(...)
    local lds = { ... }
    local i = 1
    local function new_ld()
        while i <= #lds do
            local ld = lds[i]
            if not ld then return nil end
            if type(ld) == "string" then
                i = i + 1
                return ld
            elseif type(ld) == "function" then
                local pass = ld()
                if pass then return pass end
                i = i + 1
            end
        end
        return nil
    end
    return load(new_ld)
end

--f = multiload("local x = 10;", io.lines("test.lua", "*L"), " print(x)")
--f()

