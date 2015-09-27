
setup = function()
   
end
setup()

aKeyLog = {}
aKeyLog.new = function(noteNum, velocity, pushTime, releaseTime)
     local obj = {}
     obj.noteNum = noteNum
     obj.velocity = velocity
     obj.pushTime = pushTime
     obj.releaseTime = releaseTime
     return obj
end

keyRecord = {
     count =0
}



keyRecord[1] = 3


print(keyRecord[1])
print(keyRecord.count)


print("succesed")

--loop = function()
--end
--
--
--tmr.alarm(0, 10, 1, loop)
