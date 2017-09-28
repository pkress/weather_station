function update_maxtemp(temp, temp_dec, dstr, tstr, connected)
-- takes temp, temp_dec, previous max temp, and current time. Outputs temp_max_str which includes max temp, max temp_dec, and time of 
	if  temp > temp_max_num then
		temp_max_num = temp
		temp_max_dec = temp_dec
		temp_max_time = "at UTC time: "..dstr.." "..tstr
		temp_max_str = "Maximum temperature is: "..string.format("%d.%01d.", 
			math.floor(temp_max_num), 
			temp_max_dec)
		temp_max_str = temp_max_str.." "..temp_max_time
		
	print(temp_max_str)
	if connected==1 then
	publish_maxtemp(m,temp_max_str)
	end
	end
end