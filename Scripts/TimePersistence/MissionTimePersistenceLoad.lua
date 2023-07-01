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
end