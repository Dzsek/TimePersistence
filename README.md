# Installation instructions

1. Copy the included Scripts folder into C:\Users\<username>\Saved Games\DCS.openbeta\ overwriting if it asks.
2. Find the following file in your DCS installation directory: MissionEditor\modules/me_mission.lua
3. Open this file in a text editor and find the load function (``function load(fName, bLight)``)
4. Scroll down until you find the line ``if env.mission.theatre == nil then``, it should be preceded by ``fun()``
5. Between these two lines add the following code and save:
	```lua
		base.timepersistence={ env = env, lfs = lfs }
		base.dofile(lfs.writedir()..'Scripts/TimePersistence/MissionTimePersistenceLoad.lua')
	```
	
6. To enable time persistence for a mission you will have to add a trigger zone in the mission, anywhere on the map, and name it "props". Then create a property on that triggerzone called ``mission_name`` and set its value to something unique to your mission. This will be used to identify which time persistence file to load for each mission.


# Caveats

- It autoinserts a script into your mission if the mission is set up using the trigger zone mentioned above
- You will need to update me_mission.lua after each update as it gets reset
- If its not set up properly DCS might freeze when loading the mission, use at your own risk
- If the mission is opened in the ME it will update the time to whatever it was in the save file, so you might lose the original start time of the mission
- It only saves once per minute
- It might not work correctly if using the fly again button after stoping the mission or reloading the mission with Shift+R