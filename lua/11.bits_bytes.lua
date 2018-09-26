local x = 3 << 62
print(x)
print(string.format("%u", x)) -- unsigned representation

print(0x7fffffffffffffff)
print(0x8000000000000000 - 1)

math.ult(0x7fffffffffffffff, 0x8000000000000000) -- to compare unsigned integers
