function update_minhumi(humi, humi_dec, dstr, tstr, connected)
-- takes humi, humi_dec, and current time. Outputs humi_min_str which includes min humi, min humi_dec, and time of 
	if humi < humi_min_num then
		humi_min_num = humi
		humi_min_dec = humi_dec
		humi_min_time = "at UTC time: "..dstr.." "..tstr
		humi_min_str = 'Minimum humidity is: '..string.format("%d.%01d", 
			math.floor(humi_min_num),
			humi_min_dec).." ".. humi_min_time
		
	print(humi_min_str)
	if connected==1 then
	publish_minhumi(m,humi_min_str)
	end
	end
end