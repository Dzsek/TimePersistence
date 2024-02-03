local function getDaysOfMonth(year, month)
	local leapDay = 0
	if year % 4 == 0 then
		if year % 100 == 0 then
			if year % 400 == 0 then
				leapDay = 1
			end
		else
			leapDay = 1
		end
	end

	local daysInMonth = 30
	if month == 2 then
		daysInMonth = 28 + leapDay;
	else
		daysInMonth = 31 - (month - 1) % 7 % 2;
	end
	
	return daysInMonth
end

local zn = nil
for i,v in ipairs(env.mission.triggers.zones) do
	if v.name == "props" then
		zn = v
		break
	end
end

if not TimePersistence then
	TimePersistence = {}
	TimePersistence.daysPast = 0

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
				local filename = lfs.writedir()..'Missions/Saves/'..param..'.time'
				
				local tm = nil
				local day = nil
				local month = nil
				local year = nil
				
				if lfs.attributes(filename) then
					env.info('TimePersistence - loading date')
					local dataFile = io.open(filename, "r")
					tm = tonumber(dataFile:read('*line'))
					day = tonumber(dataFile:read('*line'))
					month = tonumber(dataFile:read('*line'))
					year = tonumber(dataFile:read('*line'))
					dataFile:close()
					env.info('TimePersistence - date loaded')
				end

				env.info("Saving time")
				tm = timer.getAbsTime()
				tm = tm - (86400*TimePersistence.daysPast)

				if tm > 86400*(TimePersistence.daysPast+1) then
					TimePersistence.daysPast = TimePersistence.daysPast+1
					tm = tm - 86400

					if year and month and day then
						local daysinmonth = getDaysOfMonth(year, month)
						if day == daysinmonth then
							day = 1
							if month == 12 then 
								month = 1
								year = year + 1
								env.info('TimePersistence - year and month progressed')
							else
								month = month + 1
								env.info('TimePersistence - month progressed')
							end
						else
							day = day + 1
						end

						env.info('TimePersistence - day progressed')
					end
				end

				local out = tostring(tm)..'\n'..tostring(day)..'\n'..tostring(month)..'\n'..tostring(year)
				local f = io.open(lfs.writedir()..'Missions/Saves/'..param..'.time','w')
				f:write(out)
				f:close()
				env.info("TimePersistence - Time Saved")
				return time+60
			end, mname, timer.getTime()+60)
		end
	end

	env.info("TimePersistence - Time Save initialized")
end