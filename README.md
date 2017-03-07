# README #

The program consists of a launch simulator, velocity and angle calculator for a given target distance, and horizontal range, vertical range, and time of flight table generator for a given velocity. 

The program is designed to run using MATLAB on Mac OS X.

### Application Overview ###

![Screen Shot 2016-03-20 at 12.52.01 PM.png](https://github.com/stonepreston/MissionControl/blob/master/Images/Overview.png)



### How to run the simulator ###

Run run.m in order to use the application

### How to use the simulator ###

You must first provide values for the spring constant and projectile mass before running any simulations or calculations. 

![Screen Shot 2016-03-15 at 10.03.48 PM.png](https://github.com/stonepreston/MissionControl/blob/master/Images/LauncherSettings.png)

If you want to run a simulation, input a launch velocity and angle and then press the simulate button. You should see the relevant data appear in the simulation data table and the trajectory graph will animate.

![Screen Shot 2016-03-15 at 10.03.48 PM.png]
(https://github.com/stonepreston/MissionControl/blob/master/Images/SimulationSettings.png)

![Screen Shot 2016-03-15 at 10.48.52 PM.png](https://github.com/stonepreston/MissionControl/blob/master/Images/SimulationDataTrajectory.png)

To obtain velocity and launch angles for a target distance input a target distance and then press the calculate button

![Screen Shot 2016-03-18 at 11.42.56 PM.png](https://github.com/stonepreston/MissionControl/blob/master/Images/Predictions.png)

To generate a table of angles and the related ranges and flight times for a certain velocity, enter a velocity and then press the generate table button

![Screen Shot 2016-03-18 at 11.43.09 PM.png](https://github.com/stonepreston/MissionControl/blob/master/Images/Tables.png)

You can also export table data to excel by pressing one of the export buttons, and then providing a file name, sheet name, and start range. Once you click OK, the data will be imported to the excel file you specified. If the file does not exist, it will be created for you. 

![Screen Shot 2016-03-18 at 11.46.07 PM.png](https://github.com/stonepreston/MissionControl/blob/master/Images/Export.png)
