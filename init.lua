dofile("config.lua")

-- some diagnostic
print('MAC: ',wifi.sta.getmac())
print('chip: ',node.chipid())
print('heap: ',node.heap())

dofile("main.lua")
