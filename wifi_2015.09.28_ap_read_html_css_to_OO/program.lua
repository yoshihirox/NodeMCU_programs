require("APsetup")
dofile("uart.lua")
tmr.delay(50000)
tmr.wdclr()

AP:setup()
print("noError so far but....")
dofile("startWebServer.lua")


--in the [] is URI from client.
--value is to load files on esp
