local weather_data = {
	default={
		[1]={
			temp= { min=-1, max=7}
		},
		[2]={
			temp= { min=0, max=8}
		},
		[3]={
			temp= { min=2, max=10}
		},
		[4]={
			temp= { min=6, max=15}
		},
		[5]={
			temp= { min=10, max=19}
		},
		[6]={
			temp= { min=15, max=22}
		},
		[7]={
			temp= { min=18, max=23}
		},
		[8]={
			temp= { min=19, max=24}
		},
		[9]={
			temp= { min=16, max=22}
		},
		[10]={
			temp= { min=11, max=18}
		},
		[11]={
			temp= { min=6, max=14}
		},
		[12]={
			temp = { min=2, max=9}
		}
	}
}


local env = timepersistence.env
local lfs = timepersistence.lfs

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
		local filename = lfs.writedir()..'Missions/Saves/'..mname..'.time'
		if lfs.attributes(filename) then
			local dataFile = io.open(filename, "r")
			local datastr = dataFile:read('*all')
			dataFile:close()
			local tm = tonumber(datastr)
			if tm then
				if tm > 86400 then
					local leapDay = 0
					if env.mission.date.Year % 4 == 0 then
						if env.mission.date.Year % 100 == 0 then
							if env.mission.date.Year % 400 == 0 then
								leapDay = 1
							end
						else
							leapDay = 1
						end
					end

					local daysInMonth = 30
					if env.mission.date.Month == 2 then
						daysInMonth = 28 + leapDay;
					else
						daysInMonth = 31 - (env.mission.date.Month - 1) % 7 % 2;
					end

					if env.mission.date.Day == daysInMonth then
						env.mission.date.Day = 1
						if env.mission.date.Month == 12 then 
							env.mission.date.Month = 1
							env.mission.date.Year = env.mission.date.Year + 1
						else
							env.mission.date.Month = env.mission.date.Month + 1
						end
					else
						env.mission.date.Day = env.mission.date.Day + 1
					end

					tm = tm - 86400

					local f = io.open(filename, "w")
					f:write(tostring(tm))
					f:close()
				end

				env.mission.start_time = tm
			end
		end
		
		local trig = nil
		for i,v in ipairs(env.mission.trigrules) do
			if v.comment=="timesave" then
				trig = v
			end
		end

		local actions = {
			{
				text="if lfs then local file = lfs.writedir()..'/Scripts/TimePersistence/MissionTimePersistenceSave.lua' if lfs.attributes(file) then dofile(file) end end",
				predicate = "a_do_script"
			}
		}

		if not trig then
			table.insert(env.mission.trigrules,
			{
				rules={},
				comment="timesave",
				eventlist="",
				actions=actions,
				predicate="triggerStart"
			})
		else
			trig.predicate = "triggerStart"
			trig.actions = actions
		end
	end

	local temp = nil
	for i,v in ipairs(zn.properties) do
		if v.key == "temp" then
			temp = v.value
			break
		end
	end

	if temp and temp=="true" then
		local month = weather_data.default[env.mission.date.Month]
		local diff_from_noon = math.abs(env.mission.start_time - (86400/2))

		local min = month.temp.min
		local max = month.temp.max

		local inRange = (86400/2)
		local outRange = min - max
		local normalizedValue = diff_from_noon / inRange
		local mappedValue = max + (normalizedValue * outRange)

		env.mission.weather.season.temperature = mappedValue
	end
end