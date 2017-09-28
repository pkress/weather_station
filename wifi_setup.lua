-- setup wifi
wifi.sta.config(AP_name, AP_password)
wifi.setmode(wifi.STATION)

-- Connecting to the network
tmr.alarm(tmr_tmp, 1000, tmr.ALARM_AUTO, function()
	if wifi.sta.getip() == nil then
		print("Connecting to AP...")
	else
		myIP = wifi.sta.getip()
		IPstr1 = "IP1:"..string.sub( myIP, 1, 7)
		IPstr2 = "IP2:"..string.sub( myIP, 8, -1)
		print('Connected as: ', wifi.sta.getip() )
		tmr.stop(tmr_tmp)
		tmr.unregister(tmr_tmp)
		dofile("sync_clock.lua")
	end
end)


