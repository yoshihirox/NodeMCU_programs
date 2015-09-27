hoge = 0
loopEndPin = 0
gpio.mode(loopEndPin,gpio.INPUT);

     print("hoge")

if hoge== 0 then
     print("hogeis0")
end



for i=1,9 do
     hoge=hoge+1
     print("called")
     print(hoge)
     tmr.delay(50000)
     tmr.wdclr()
     --tmr.delay(50000)
    -- tmr.wdclr()
end

if gpio.read(loopEndPin)==gpio.HIGH then
     print("on")
else
     print("off")
end




loop = function()


     print("mugenLoop!!")

    
end



while 1 do
     if gpio.read(loopEndPin)==gpio.HIGH then
          break
     end
     loop()
     tmr.delay(1)
     tmr.wdclr()
end


