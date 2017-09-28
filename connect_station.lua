function connect_station()

function success_connect()
	m:publish("/weatherstation","success_connect",0,0)
	connected=1

end
m=mqtt.Client("nodemcu1",60,"","")
m:connect("server_name",1883,0,1,function(client) success_connect() end,'')
end