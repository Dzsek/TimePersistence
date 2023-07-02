# Installation instructions

1. Copy the included Scripts folder into C:\Users\<username>\Saved Games\DCS.openbeta\ overwriting if it asks.
2. Find the following file in your DCS installation directory: ``MissionEditor\modules\me_mission.lua``
3. Open this file in a text editor and find the load function: ``function play(params, returnScreen, a_missionPath, doNotApplyOptions, doSave, doApplyOnlyName)``
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
   
6. To enable time persistence for a mission you will have to add a trigger zone in the mission, anywhere on the map, and name it "props". Then create a property on that triggerzone called ``mission_name`` and set its value to something unique to your mission. This will be used to identify which time persistence file to load for each mission. You can also activate randomization of temperature, clouds and wind. See image below

![Trigger zone example](/triggerzone.png)


# Caveats

- You will need to update me_mission.lua after each DCS update as it gets reset
- If its not set up properly DCS might freeze when loading the mission, use at your own risk
- It only saves once per minute
- It does not work correctly if using the fly again button after stoping the mission or reloading the mission with Shift+R