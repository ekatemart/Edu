--
-- Created by IntelliJ IDEA.
-- User: Andrew
-- Date: 9/30/2018
-- Time: 23:53
-- To change this template use File | Settings | File Templates.
--

package.path = "./modules/?.lua;" .. package.path

local Stack = require "stack"
local StackQueue = require "stackqueue"
local StackDual = require "stackdual"
local dump = require "dump"

local s = Stack:new()

s:push("AT&T")
s:push("Amazon")
s:push("Apple")
s:push("Acronis")

print(s)
print(s:pop())
print(s:top())
print(s)

print("============")

local sq = StackQueue:new(s)
sq:insertbottom("JD")
print(sq)

print("============")

local sd = StackDual:new()
sd:push("Camel")
sd:push("Snake")
sd:push("Kebab")
print(sd)
print(sd:pop())
print(sd:top())
print(sd)
