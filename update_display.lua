function update_display()
	disp:firstPage()
	repeat
		draw()
	until disp:nextPage() == false

	tmr.start(tmr_display)
end

-- set up timer for display update
tmr.register(tmr_display, display_update_interval, tmr.ALARM_SEMI, function() update_display() end)

print("--- Starting Display Updates ---")
tmr.start(tmr_display)
