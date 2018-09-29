package.path = './modules/?.lua;' .. package.path

local queue = require "double_ended_queue"
local dump = require "dump"

local q = queue.listNew()
queue.pushFirst(q, 1)
queue.pushFirst(q, 10)
queue.pushFirst(q, 100)

print(queue.popLast(q))
print(queue.popLast(q))
print(dump(q))
