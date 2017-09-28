function update_mintemp(temp, temp_dec, dstr, tstr, connected)
-- takes temp, temp_dec, previous min temp, and current time. Outputs temp_min_str which includes min temp, min temp_dec, and time of 
	if  temp < temp_min_num then
		temp_min_num = temp
		temp_min_dec = temp_dec
		temp_min_time = "at UTC time: "..dstr.." "..tstr
		temp_min_str = "Minimum temperature is: "..string.format("%d.%01d.", 
			math.floor(temp_min_num), 
			temp_min_dec)
		temp_min_str = temp_min_str.." "..temp_min_time
		
	print(temp_min_str)
	if connected==1 then
	publish_mintemp(m,temp_min_str)
	end
	end
end