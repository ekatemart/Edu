-- There are eight basic types in Lua: nil, Boolean, number, string, userdata, function, thread, and table

type(nil) --> nil
type(true) --> boolean
type(10.4 * 3) --> number
type("Hello world") --> string
type(io.stdin) --> userdata
type(print) --> function
type(type) --> function
type({}) --> table
type(type(X)) --> string
