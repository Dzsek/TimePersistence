local zn = nil
for i,v in ipairs(env.mission.triggers.zones) do
	if v.name == "props" then
		zn = v
		break
	end
end

if zn then
	local mname = nil
	for i,v in ipairs(zn.properties) do
		if v.key == "mission_name" then
			mname = v.value
			break
		end
	end
	
	if mname then
	
		local dir = lfs.writedir()..'Missions/Saves/'
		lfs.mkdir(dir)
		
		timer.scheduleFunction(function(param,time) 
			local outtime = timer.getAbsTime()
			local f = io.open(lfs.writedir()..'Missions/Saves/'..param..'.time','w')
			f:write(tostring(outtime))
			f:close()
			return time+60
		end, mname, timer.getTime()+60)
	end
end

