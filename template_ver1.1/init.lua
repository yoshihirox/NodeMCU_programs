--[[
シリアル通信。
]]
loopEndPin = 0
gpio.mode(loopEndPin,gpio.INPUT)


countdown = 3
print("booting the esp8266 module")
tmr.alarm(0,100,1,function()
    print("..."..100-countdown * 20 .."%")
    countdown = countdown-1
    if countdown<1 then
        print("...100%")
        tmr.stop(0)
        countdown = nil
        local s,err

        if gpio.read(loopEndPin)==gpio.HIGH then
          file.close()
          tmr.delay(1000000)
          tmr.wdclr()
          print("gpio16 is high....disable loop")
          print("closing the esp8266 module")
         else
          tmr.delay(1000000)
          tmr.wdclr()
          print("gpio16 is low....enable loop")
          print("loading program.lua\n")
          tmr.delay(1000000)
          tmr.wdclr()
          s,err = pcall(function() dofile("program.lua")end)
        end
        if 
          not s then print(err) 
       end
    
    end
end)


