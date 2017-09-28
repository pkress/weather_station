-- synchronize clock
sntp.sync(ntp_server,
  function(sec,usec,server)
    print('time sync data: ', sec, usec, server)
  end,
  function()
   print('Time synchronization failed!')
  end
)

