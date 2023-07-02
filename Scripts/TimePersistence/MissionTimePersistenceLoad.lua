local weather_data = {
	default={
		[1]={
			temp= { min=-1, max=7 }
		},
		[2]={
			temp= { min=0, max=8 }
		},
		[3]={
			temp= { min=2, max=10 }
		},
		[4]={
			temp= { min=6, max=15 }
		},
		[5]={
			temp= { min=10, max=19 }
		},
		[6]={
			temp= { min=15, max=22 }
		},
		[7]={
			temp= { min=18, max=23 }
		},
		[8]={
			temp= { min=19, max=24 }
		},
		[9]={
			temp= { min=16, max=22 }
		},
		[10]={
			temp= { min=11, max=18 }
		},
		[11]={
			temp= { min=6, max=14 }
		},
		[12]={
			temp = { min=2, max=9 }
		}
	}
}

local clouds_data = {
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset1"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset2"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset3"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset4"
	},
	{
		thickness = 200,
		density = 0,
		base = 4600,
		iprecptns = 0,
		preset = "Preset5"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset6"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset7"
	},
	{
		thickness = 200,
		density = 0,
		base = 5500,
		iprecptns = 0,
		preset = "Preset8"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset9"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset10"
	},
	{
		thickness = 200,
		density = 0,
		base = 5500,
		iprecptns = 0,
		preset = "Preset11"
	},
	{
		thickness = 200,
		density = 0,
		base = 3400,
		iprecptns = 0,
		preset = "Preset12"
	},
	{
		thickness = 200,
		density = 0,
		base = 3400,
		iprecptns = 0,
		preset = "Preset13"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset14"
	},
	{
		thickness = 200,
		density = 0,
		base = 4200,
		iprecptns = 0,
		preset = "Preset15"
	},
	{
		thickness = 200,
		density = 0,
		base = 4200,
		iprecptns = 0,
		preset = "Preset16"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset17"
	},
	{
		thickness = 200,
		density = 0,
		base = 3800,
		iprecptns = 0,
		preset = "Preset18"
	},
	{
		thickness = 200,
		density = 0,
		base = 2900,
		iprecptns = 0,
		preset = "Preset19"
	},
	{
		thickness = 200,
		density = 0,
		base = 3800,
		iprecptns = 0,
		preset = "Preset20"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset21"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset22"
	},
	{
		thickness = 200,
		density = 0,
		base = 3400,
		iprecptns = 0,
		preset = "Preset23"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "Preset24"
	},
	{
		thickness = 200,
		density = 0,
		base = 3400,
		iprecptns = 0,
		preset = "Preset25"
	},
	{
		thickness = 200,
		density = 0,
		base = 2900,
		iprecptns = 0,
		preset = "Preset26"
	},
	{
		thickness = 200,
		density = 0,
		base = 3500,
		iprecptns = 0,
		preset = "Preset27"
	},
	{
		thickness = 200,
		density = 0,
		base = 2900,
		iprecptns = 0,
		preset = "RainyPreset1"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "RainyPreset2"
	},
	{
		thickness = 200,
		density = 0,
		base = 2500,
		iprecptns = 0,
		preset = "RainyPreset3"
	}
}


local lfs = timepersistence.lfs

local zn = nil
for i,v in ipairs(timepersistence.mission.triggers.zones) do
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
			local tm = tonumber(dataFile:read('*line'))
			local day = tonumber(dataFile:read('*line'))
			local month = tonumber(dataFile:read('*line'))
			local year = tonumber(dataFile:read('*line'))
			dataFile:close()
			if tm then
				if tm > 86400 then
					tm = tm - 86400
				end
				
				timepersistence.mission.start_time = tm

				if day and month and year then
					timepersistence.mission.date.Year = year
					timepersistence.mission.date.Month = month
					timepersistence.mission.date.Day = day
				end
			end
		else
			local out = tostring(timepersistence.mission.start_time)..'\n'
			out = out..tostring(timepersistence.mission.date.Day)..'\n'
			out = out..tostring(timepersistence.mission.date.Month)..'\n'
			out = out..tostring(timepersistence.mission.date.Year)

			local f = io.open(lfs.writedir()..'Missions/Saves/'..mname..'.time','w')
			f:write(out)
			f:close()
		end
		
		local actions = {
			{
				text="if lfs then local file = lfs.writedir()..'/Scripts/TimePersistence/MissionTimePersistenceSave.lua' if lfs.attributes(file) then dofile(file) end end",
				predicate = "a_do_script"
			}
		}

		local new = {
			rules={},
			comment="timesave",
			eventlist="",
			actions=actions,
			predicate="triggerStart"
		}

		local conv = timepersistence.trig.loadTriggers({new})

		table.insert(timepersistence.mission.trigrules, conv[1])
	end

	local temp = nil
	for i,v in ipairs(zn.properties) do
		if v.key == "temp" then
			temp = v.value
			break
		end
	end

	if temp and temp=="true" then
		local month = weather_data.default[timepersistence.mission.date.Month]
		local diff_from_noon = math.abs(timepersistence.mission.start_time - (86400/2))

		local min = month.temp.min
		local max = month.temp.max

		local inRange = (86400/2)
		local outRange = min - max
		local normalizedValue = diff_from_noon / inRange
		local mappedValue = max + (normalizedValue * outRange)

		mappedValue = mappedValue + math.random(-2,2)
		timepersistence.mission.weather.season.temperature = mappedValue
	end

	local clouds = nil
	for i,v in ipairs(zn.properties) do
		if v.key == "clouds" then
			clouds = v.value
			break
		end
	end

	if clouds and clouds=="true" then
		
		local cloud = clouds_data[math.random(1,#clouds_data)]

		timepersistence.mission.weather.clouds = cloud
	end

	local wind = nil
	for i,v in ipairs(zn.properties) do
		if v.key == "wind" then
			wind = v.value
			break
		end
	end

	if wind and wind=="true" then
		timepersistence.mission.weather.wind = {
			atGround = { speed = math.random(0,5), dir = math.random(0,360) },
			at2000 = { speed = math.random(0,15), dir = math.random(0,360) },
			at8000 = { speed = math.random(0,77), dir = math.random(0,360) },
		}
	end
end