uart.setup(0, 9600, 8, 0, 1, 0 )

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
     hoge = tmr.now()
     print(hoge)
     print(tmr.time())
     tmr.delay(10000000)
     tmr.wdclr()
     
end

fnc = function()
     print("called")
end

tmr.alarm(1, 100,1,fnc)
tmr.alarm(0, 1000, 1, loop)
