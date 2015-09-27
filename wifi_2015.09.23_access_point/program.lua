print("Ready to start soft ap")

setup = function()
     local str = wifi.ap.getmac();
     local ssidTemp = string.format("%s%s%s",string.sub(str,10,11),string.sub(str,13,14),string.sub(str,16,17));

     cfg = {}
     cfg.ssid = "IoT.makers_IoTSynthesizer";
     --cfg.pwd = "12345678"
     wifi.ap.config(cfg)

     cfg={}
     cfg.ip="192.168.1.1";
     cfg.netmask="192.168.1.1";
     cfg.gateway = "192.168.1.1";
     wifi.ap.setip(cfg);
     wifi.setmode(wifi.STATIONAP)

     str = nil;
     ssidTemp = nil;
     collectgarbage();

     print("Soft AP started")
     print("Heep:(bytes)"..node.heap());
     print("MAC:"..wifi.ap.getmac().."\r\nIP:"..wifi.ap.getip());

     led1 = 3
     led2 = 4
     gpio.mode(led1, gpio.OUTPUT)
     gpio.mode(led2, gpio.OUTPUT)

     srv=net.createServer(net.TCP)
     srv:listen(80,function(conn)
          conn:on("receive", function(client,request)
               local buf = "";
                  local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
                  if(method == nil)then
                      _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
                  end
                  local _GET = {}
                  if (vars ~= nil)then
                      for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                          _GET[k] = v
                      end
                  end
                  buf = buf.."<h1> ESP8266 Web Server</h1>";
                  buf = buf.."<p>GPIO0 <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p>";
                  buf = buf.."<p>GPIO2 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p>";
                  local _on,_off = "",""
                  if(_GET.pin == "ON1")then
                        gpio.write(led1, gpio.HIGH);
                  elseif(_GET.pin == "OFF1")then
                        gpio.write(led1, gpio.LOW);
                  elseif(_GET.pin == "ON2")then
                        gpio.write(led2, gpio.HIGH);
                  elseif(_GET.pin == "OFF2")then
                        gpio.write(led2, gpio.LOW);
                  end
                  client:send(buf);
                  client:close();
                  collectgarbage();
              end)
          end)
end
setup()

loop = function()
end


--tmr.alarm(0, 10, 1, loop)
