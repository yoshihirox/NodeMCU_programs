setup = function()

end
setup()

loop = function()
end



--[[call loop]]
while 1 do
     if gpio.read(loopEndPin)==gpio.HIGH then
          break
     end
     loop()
     tmr.delay(15)  --num = us
     tmr.wdclr()
end
