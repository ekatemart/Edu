-- exclamation mark - UTC
--print(os.date("!%c", 0)) --> Thu Jan 1 00:00:00 1970
--print(dump(os.date("!*t")))

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

-- Exercise 12.1 --
function one_month_after(time)
    local date = os.date("*t", time)
    date.month = date.month + 1
    return os.time(date)
end

--local now = os.time()
--local test1 = 12345
--
--print(one_month_after(now) - now)
--print(one_month_after(test1) - test1)
--print(dump(os.date("*t", one_month_after(now))))

-- Exercise 12.3 --
-- takes a date–time (coded as a number) and returns the number of seconds
-- passed since the beginning of its respective day
function seconds_passed(time)
    local date = os.date("*t", time)
    date.hour = 0
    date.min = 0
    date.sec = 0
    return os.difftime(time, os.time(date))
end

--local now = os.time()
--print(seconds_passed(now) / 3600)

-- Exercise 12.4
-- takes a year and returns the day of its first Friday
function first_friday(year)
    local date = os.date("*t", os.time({year = year, month = 1, day = 1, hour = 0, min = 0, sec = 0}))
    return 7 - math.fmod(date.wday, 7)
    -- first day:
    -- (1) sunday -> 6
    -- (2) monday -> 5
end

--for y = 2018, 2025 do
--    print(y, first_friday(y))
--end

-- Exercise 12.8
-- produces the system's time zone
function timezone()
    return os.date("%z")
end

print(timezone())
