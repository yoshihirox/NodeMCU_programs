--[[
シリアル通信。
]]
loopEndPin = 0
gpio.mode(loopEndPin,gpio.INPUT)


countdown = 1
print("You can send some command for 2500ms")
tmr.alarm(0,2500,1,function()
    print(" ")
    countdown = countdown-1
    if countdown<1 then
        tmr.stop(0)
        countdown = nil
        local s,err

        if gpio.read(loopEndPin)==gpio.HIGH then
          file.close()
          --print("gpio16 is high....disable loop")
          print("closed")
         else
          --print("gpio16 is low....enable loop")
          print("loading[program.lua]\n")
          tmr.delay(1000000)
          tmr.wdclr()
          s,err = pcall(function() dofile("program.lua")end)
        end
        if 
          not s then print(err) 
       end
    
    end
end)


