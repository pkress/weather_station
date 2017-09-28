function publish_maxhumi(m,humi_max_str)
m:publish("/publish_location/max_humi",humi_max_str,0,1)
end