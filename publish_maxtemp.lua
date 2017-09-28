function publish_maxtemp(m,temp_max_str)
m:publish("/publish_location/max_temp",temp_max_str,0,1)
end
