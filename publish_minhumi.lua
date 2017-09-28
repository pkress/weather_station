function publish_minhumi(m,humi_min_str)
m:publish("/publish_location/min_humi",humi_min_str,0,1)
end