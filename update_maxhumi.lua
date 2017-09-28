function update_maxhumi(humi, humi_dec, dstr, tstr, connected)
-- takes humi, humi_dec, and current time. Outputs humi_max_str which includes max humi, max humi_dec, and time of 
	if humi > humi_max_num then
		humi_max_num = humi
		humi_max_dec = humi_dec
		humi_max_time = "at UTC time: "..dstr.." "..tstr
		humi_max_str = "Maximum humidity is: "..string.format("%d.%01d", 
			math.floor(humi_max_num), 
			humi_max_dec).." ".. humi_max_time
		
	print(humi_max_str)
	if connected==1 then
	publish_maxhumi(m,humi_max_str)
	end
	end
end