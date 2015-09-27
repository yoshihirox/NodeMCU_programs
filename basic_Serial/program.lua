uart.setup(0, 115200, 8, 0, 1, 0 )

aBeatNum = 470
beat =0
currentBar =0
fourBar = 0
looptime = 10


setup = function()
     uart.on("data", 4,
          function(data)
               print("receive from uart:", data)
               if data == "quit" then
                    uart.on("data")
               end
     end, 0)
end

setup()


loop = function()
    beat = beat + looptime
    print(bit.arshift(16,2))
    if beat >= aBeatNum then
     fourBar = fourBar + 1
     if fourBar >= 4 then
          currentBar = currentBar+ 1
          print(currentBar)
          fourBar = 0
     end
     beat = 0
     print("beating")
    end
end


tmr.alarm(0, looptime, 1, loop)
