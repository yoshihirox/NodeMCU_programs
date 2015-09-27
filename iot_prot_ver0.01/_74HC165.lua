local M = {}

--[[private memba]]
local loadpin =nil
local clockpin = nil
local datapin = nil
local isDebug = false
local isLSBFIRST = true

M.new = function(load, clock, data)
     loadpin = load
     clockpin = clock
     datapin = data
     gpio.mode(loadpin, gpio.OUTPUT)
     gpio.mode(clockpin, gpio.OUTPUT)
     gpio.mode(datapin, gpio.INPUT)
end

M.getAllState = function(BitNumToRead)
     local result = 0
     gpio.write(loadpin, gpio.LOW)
     gpio.write(loadpin, gpio.HIGH)
     for i=0,BitNumToRead-1 do
          if isLSBFIRST then
               result = bit.bor(result, bit.lshift(gpio.read(datapin), i))
          else
               result = bit.bor(result, bit.lshift(gpio.read(datapin),BitNumToRead - 1-i) )
          end
               gpio.write(clockpin, gpio.HIGH)
               gpio.write(clockpin, gpio.LOW)
     end
       
     if isDebug then
         print(result)
     end
    return result
end

M.LSBFIRSTMODE = function()
     isLSBFIRST = true
end

M.MSBFIRSTMODE = function()
     isLSBFIRST = false
end

M.debugMode = function()
     isDebug = true
end

return M


