local weather_data = {
	default={
		[1]={
			temp= { min=-1, max=7 },
			clouds = { none=0.1, light=0.2, medium=0.4, heavy=0.9, rain=1.0 }
		},
		[2]={
			temp= { min=0, max=8 },
			clouds = { none=0.1, light=0.2, medium=0.4, heavy=0.9, rain=1.0 }
		},
		[3]={
			temp= { min=2, max=10 },
			clouds = { none=0.1, light=0.3, medium=0.5, heavy=0.8, rain=1.0 }
		},
		[4]={
			temp= { min=6, max=15 },
			clouds = { none=0.2, light=0.4, medium=0.6, heavy=0.8, rain=1.0 }
		},
		[5]={
			temp= { min=10, max=19 },
			clouds = { none=0.2, light=0.4, medium=0.6, heavy=0.8, rain=1.0 }
		},
		[6]={
			temp= { min=15, max=22 },
			clouds = { none=0.4, light=0.7, medium=0.85, heavy=0.95, rain=1.0 }
		},
		[7]={
			temp= { min=18, max=23 },
			clouds = { none=0.4, light=0.8, medium=0.85, heavy=0.95, rain=1.0 }
		},
		[8]={
			temp= { min=19, max=24 },
			clouds = { none=0.4, light=0.8, medium=0.85, heavy=0.95, rain=1.0 }
		},
		[9]={
			temp= { min=16, max=22 },
			clouds = { none=0.2, light=0.4, medium=0.6, heavy=0.8, rain=1.0 }
		},
		[10]={
			temp= { min=11, max=18 },
			clouds = { none=0.2, light=0.4, medium=0.6, heavy=0.8, rain=1.0 }
		},
		[11]={
			temp= { min=6, max=14 },
			clouds = { none=0.1, light=0.3, medium=0.5, heavy=0.8, rain=1.0 }
		},
		[12]={
			temp = { min=2, max=9 },
			clouds = { none=0.1, light=0.2, medium=0.4, heavy=0.9, rain=1.0 }
		}
	}
}

local clouds_data = {
	none = {
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
		}
	},
	light = {
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
	},
	medium = {
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
		}
	},
	heavy = {
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
	},
	rain = {		
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
}


local lfs = timepersistence.lfs

local dir = lfs.writedir()..'Missions/Saves/'
lfs.mkdir(dir)

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
		local skip_night = nil
		for i,v in ipairs(zn.properties) do
			if v.key == "skip_night" then
				skip_night = v.value
				break
			end
		end
	
		local dusk = 86400
		local dawn = 0
		if skip_night then
			local match = skip_night:gmatch("([0-9.]*)|([0-9.]*)") 
			dusk, dawn = match()
			dusk = dusk*60*60
			dawn = dawn*60*60
		end	

		local filename = lfs.writedir()..'Missions/Saves/'..mname..'.time'
		if lfs.attributes(filename) then
			local dataFile = io.open(filename, "r")
			local tm = tonumber(dataFile:read('*line'))
			local day = tonumber(dataFile:read('*line'))
			local month = tonumber(dataFile:read('*line'))
			local year = tonumber(dataFile:read('*line'))
			dataFile:close()
			if tm then
				local skip_day = false
				if tm > dusk then
					tm = dawn
					skip_day = true
				end
				   
				if tm < dawn then
					tm = dawn
					skip_day = true
				end

				if skip_day then
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

					if day == daysInMonth then
						day = 1
						if month == 12 then 
							month = 1
							year = year + 1
						else
							month = month + 1
						end
					else
						day = day + 1
					end
				end
				
				timepersistence.mission.start_time = tm

				if day and month and year then
					timepersistence.mission.date.Year = year
					timepersistence.mission.date.Month = month
					timepersistence.mission.date.Day = day

					local out = tostring(tm)..'\n'
					out = out..tostring(day)..'\n'
					out = out..tostring(month)..'\n'
					out = out..tostring(year)

					local f = io.open(lfs.writedir()..'Missions/Saves/'..mname..'.time','w')
					f:write(out)
					f:close()
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
		local month = weather_data.default[timepersistence.mission.date.Month]
		
		local cloud = nil
		local choice = math.random()
		if choice <= month.clouds.none then -- none
			cloud = clouds_data.none[math.random(1,#clouds_data.none)]
		elseif choice <= month.clouds.light then -- light
			cloud = clouds_data.light[math.random(1,#clouds_data.light)]
		elseif choice <= month.clouds.medium then -- medium
			cloud = clouds_data.medium[math.random(1,#clouds_data.medium)]
		elseif choice <= month.clouds.heavy then -- heavy
			cloud = clouds_data.heavy[math.random(1,#clouds_data.heavy)]
		elseif choice <= month.clouds.rain then -- rain
			cloud = clouds_data.rain[math.random(1,#clouds_data.rain)]
		else
			cloud = clouds_data.none[1]
		end
		
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
			atGround = { speed = math.random(0,3), dir = math.random(0,360) },
			at2000 = { speed = math.random(0,10), dir = math.random(0,360) },
			at8000 = { speed = math.random(0,20), dir = math.random(0,360) },
		}
	end
end