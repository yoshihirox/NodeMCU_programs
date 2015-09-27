uart.setup(0, 9600, 8, 0, 1, 0)
setup = function()
     print("\n setupstarted")
     uart.on("data", 4,
          function(data)
               print("receive from uart:", data)
               if data == "quit" then
                    uart.on("data")
               end
     end, 0)
    
end
setup()

--
--for i=1,9 do
--     hoge=hoge+1
--     print(hoge)
--     tmr.delay(50000)
--     tmr.wdclr()
--end


loop = function()
     print("mugenLoop!!")
end

while 1 do
     if gpio.read(loopEndPin)==gpio.HIGH then
          break
     end
     loop()
     tmr.delay(15)  num = us
     tmr.wdclr()
end
