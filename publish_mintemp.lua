function publish_mintemp(m,temp_min_str)
m:publish("/publish_location/min_temp",temp_min_str,0,1)
end
