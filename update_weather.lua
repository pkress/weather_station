
function update_weather()
	-- Check weather sensor
	status, temp, humi, temp_dec, humi_dec = dht.read(dht_pin)
	if status == dht.OK then
		temp_str = string.format("%d.%01d",
			math.floor(temp),
			temp_dec
		)
		humi_str = string.format("%d.%01d",    
			math.floor(humi),                   
			humi_dec                            
		) 
		if tav == tavinit then
			tav = temp
		else
			tav = tau*(tav)+ (1-tau)*temp
		end 
		if hav == havinit then
			hav = humi
		else
			hav = tau*(hav)+ (1-tau)*humi
		end
	
	
	deltat = temp-tav
	deltah = humi-hav
	if math.abs(deltat) < deltat_tol then
		update_maxtemp(temp, temp_dec, dstr, tstr, connected)                                        
		update_mintemp(temp, temp_dec, dstr, tstr, connected)
	end
	if math.abs(deltah) < deltah_tol then
		update_maxhumi(humi, humi_dec, dstr, tstr, connected)
		update_minhumi(humi, humi_dec, dstr, tstr, connected)
	end
	
		
	wstr = "T"..""..temp_str.."H"..humi_str 
	timestr = "Date"..dstr.."Time"..tstr
	wstr_max = temp_max_str.." "..humi_max_str
	wstr_min = temp_min_str.." "..humi_min_str
	
	if connected==1 then
		publish_weather(m, wstr, temp_str, humi_str)
	end
	elseif status == dht.ERROR_CHECKSUM then
		wstr = "DHT error"
	elseif status == dht.ERROR_TIMEOUT then
		wstr = "DHT error."
	end
	tmr.start(tmr_weather)
end



-- set up timer for weather update
tmr.register(tmr_weather, weather_update_interval, tmr.ALARM_SEMI, function() update_weather() end)

print("--- Starting Weather Updates ---")
tmr.start(tmr_weather)

