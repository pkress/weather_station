-- This simple telnet/http server operating on the same port.
-- It works like telnet if first string is "telnet" or "file." 
-- So one can update code via internet with commands like:
--    luatool.py --ip 192.168.2.132:80 --src server.lua
-- The code is slightly modified from original taken at
-- https://github.com/Malte-D/nodemcu-http-telnet

port = 80

dofile("httphandler.lua")

function setHttpHandler(h)
    httphandler = h
end

srv=net.createServer(net.TCP,180)
srv:listen(port,function(c)
    c:on("receive",function(c,d)
        tmr.stop(6)
        -- check whether the request was sent by putty or luatool 
        if (d:sub(1,6) == "telnet" or d:sub(1,5) == "file.") then
	    print("Telnet connection at "..dstr.." "..tstr)
            -- switch to telnet service
            node.output(function(s)
                if c ~= nil then c:send(s) end
            end,0)
            c:on("receive",function(c,d)
                if d:byte(1) == 4 then c:close() -- ctrl-d to exit
                else node.input(d) end
            end)
            c:on("disconnection",function(c)
                node.output(nil)
            end)
            node.input("\r\n")
            if  d:sub(1,5) == "file." then
                node.input(d)
            end
        else
            c:on("sent", function(c) c:close() end)
	    print("Web connection at "..dstr.." "..tstr)
            -- handle http request
            httphandler(c,d)
        end
    end)
    -- luatool needs to receive a response before it sends anything
    tmr.alarm(tmr_server,500,0,function() c:send("HTTP/1.1 200 OK\r\n\r\n") end )
end)
