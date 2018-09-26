--print "Hello World" -- <--> print("Hello World")
--dofile 'a.lua' -- <--> dofile ('a.lua')
--print [[a multi-line
-- message]] -- <-->      print([[a multi-line
--                    --  message]])
--f{x=10, y=20} -- <--> f({x=10, y=20})
--type{} -- <--> type({})

function exercise61(array)
    for i = 1, #array do
        print(array[i])
    end
end

-- exercise61({9,8,7,5,4,2,1})

function exercise62(first, ...)
    return ...
end

-- print(exercise62(1, 3, 5, 7, 11, 13, 17, 19, 23, 29))

function exercise63(...)
    return table.unpack({ ... }, 1, select('#', ...) - 1)
end

-- print(exercise63(1, 3, 5, 7, 11, 13, 17, 19, 23, 29))

-- Exercise 6.4
-- A simple array shuffle function for Lua implementing the Fisher-Yates shuffle.
function shuffle(tbl)
    local size = #tbl
    for i = size, 1, -1 do
        local rand = math.random(size)
        tbl[i], tbl[rand] = tbl[rand], tbl[i]
    end
    return tbl
end

-- Exercise 6.5
-- Prints all combinations of the elements in the array.
function combinations(array)
    local function next_element(list, e, ...)
        if e == nil then
            print(table.unpack(list))
        else
            local list_copy = { table.unpack(list) }
            table.insert(list_copy, e)
            next_element(list_copy, ...)
            next_element(list, ...)
        end
    end

    next_element({}, table.unpack(array))
end

combinations({ 1, 2, 3, 4, 5 })


--print(table.unpack({table.unpack({})}))