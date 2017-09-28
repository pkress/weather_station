function update_time()
	-- Update time
	sec, usec  = rtctime.get()
	if ( sec > 0) then
		tm = rtctime.epoch2cal(sec)
		dstr = string.format("%04d/%02d/%02d", tm["year"], tm["mon"], tm["day"])
		tstr = string.format("%02d:%02d:%02d", tm["hour"], tm["min"], tm["sec"])
	else
		sec = 0;
		dstr = ""
		tstr = ""
	end

	tmr.start(tmr_time)
end

-- set up timer for time update
tmr.register(tmr_time, time_update_interval, tmr.ALARM_SEMI, function() update_time() end)

print("--- Starting Time Updates ---")
tmr.start(tmr_time)
