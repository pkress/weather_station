function publish_weather(m,wstr,temp_str, humi_str)
m:publish("/publish_location/current_status",wstr,0,0)
m:publish("/publish_location/current_temp",temp_str,0,0)
m:publish("/publish_location/current_humi",humi_str,0,0)
end
