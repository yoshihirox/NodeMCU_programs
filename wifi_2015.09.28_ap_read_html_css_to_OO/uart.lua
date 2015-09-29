--UART setup
uart.setup(0, 9600, 8, 0, 1, 0)
--0, baud, bit, parity, stop, echo

uart.on("data", "\n",
     function(data)
          print("receive from uart:", data)
          if data == "quit" then
               uart.on("data")
          end
     end,0)