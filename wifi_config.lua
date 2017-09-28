local wifiConfig = {}

-- wifi.STATION         -- station: join a WiFi network
-- wifi.SOFTAP          -- access point: create a WiFi network
-- wifi.wifi.STATIONAP  -- both station and access point
wifiConfig.mode = wifi.STATIONAP  -- both station and access point

wifiConfig.accessPointConfig = {}
wifiConfig.accessPointConfig.ssid = "ESP-"..node.chipid()   -- Name of the SSID you want to create
wifiConfig.accessPointConfig.pwd = "ESP-"..node.chipid()    -- WiFi password - at least 8 characters

wifiConfig.accessPointIpConfig = {} 						-- AP infromation, from device
wifiConfig.accessPointIpConfig.ip = "AP_ip"
wifiConfig.accessPointIpConfig.netmask = "AP_netmask"
wifiConfig.accessPointIpConfig.gateway = "AP_gateway"

wifiConfig.stationPointIpConfig = {}						-- Station point infromation, from network admin
wifiConfig.stationPointIpConfig.ip = "SP_ip"			
wifiConfig.stationPointIpConfig.netmask = "SP_netmask"		
wifiConfig.stationPointIpConfig.gateway = "SP_gateway"		

wifiConfig.stationPointConfig = {}
wifiConfig.stationPointConfig.ssid = "AP_name"        -- Name of the WiFi network you want to join
wifiConfig.stationPointConfig.pwd =  "AP_password"                -- Password for the WiFi network




-- Tell the chip to connect to the access point

wifi.setmode(wifiConfig.mode)
print('set (mode='..wifi.getmode()..')')

if (wifiConfig.mode == wifi.SOFTAP) or (wifiConfig.mode == wifi.STATIONAP) then
    print('AP MAC: ',wifi.ap.getmac())
    wifi.ap.config(wifiConfig.accessPointConfig)
    wifi.ap.setip(wifiConfig.accessPointIpConfig)
end
if (wifiConfig.mode == wifi.STATION) or (wifiConfig.mode == wifi.STATIONAP) then
    print('Client MAC: ',wifi.sta.getmac())
    wifi.sta.config(wifiConfig.stationPointConfig.ssid, wifiConfig.stationPointConfig.pwd, 1)
end
net.dns.setdnsserver("128.239.51.1", 1)
print('DNS Server 1: '..net.dns.getdnsserver(1))