# This mod is experimental at the moment. You may encounter frequent issues.

# Version 0.1

# Installation instructions

1. Copy the included Scripts folder into C:\Users\<username>\Saved Games\DCS.openbeta\ overwriting if it asks.
2. Find the following file in your DCS installation directory: ``MissionEditor\modules\me_mission.lua``
3. Open this file in a text editor and find the play function: ``function play(params, returnScreen, a_missionPath, doNotApplyOptions, doSave, doApplyOnlyName)``
4. Right below this line, after the comments add the following code and save:
```lua
base.timepersistence={ mission = mission, lfs = lfs, trig = Trigger}
base.dofile(lfs.writedir()..'Scripts/TimePersistence/MissionTimePersistenceLoad.lua')
```

![me_mission.lua example](/me_mission.png)

5. Edit `\Scripts\MissionScripting.lua` inside your DCS installation folder:
   
  Change the following section:
  ```lua
  do
      sanitizeModule('os')
      sanitizeModule('io')
      sanitizeModule('lfs')
      _G['require'] = nil
      _G['loadlib'] = nil
      _G['package'] = nil
  end
  ```
  To look like this:
  ```lua
  do
      sanitizeModule('os')
      --sanitizeModule('io')
      --sanitizeModule('lfs')
      _G['require'] = nil
      _G['loadlib'] = nil
      _G['package'] = nil
  end
  ```
   
6. To enable time persistence for a mission you will have to add a trigger zone in the mission, anywhere on the map, and name it "props". Then create a property on that triggerzone called ``mission_name`` and set its value to something unique to your mission. This will be used to identify which time persistence file to load for each mission. You can also activate randomization of temperature, clouds and wind. See image below. To disable a setting either delete it or rename it to something else (ex. skip_night_disabled).

![Trigger zone example](/triggerzone.png)


|Parameter|Value|
|:---|:---|
|mission_name|String that identifies the time save file used for this mission|
|temp|If value is 'true', temperature will be updated based on date and time of day on mission start|
|clouds|If value is 'true', cloud preset will be randomized on mission start|
|wind| If value is 'true', wind speed and direction will be randomized on mission start|
|skip_night| Value should be in the following format: dusk hr\|dawn hr. For example "20.5\|8" means dusk is at 20:30 and dawn is at 8:00. If property is present and last saved time is between these values the mission will skip ahead to the dawn value. |

# Caveats

- You will need to update me_mission.lua after each DCS update as it gets reset
- If its not set up properly DCS might freeze when loading the mission, use at your own risk
- It only saves once per minute
- It does not work correctly if using the fly again button after stoping the mission or reloading the mission with Shift+R
- It does not work correctly in multiplayer
