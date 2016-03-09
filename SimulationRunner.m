%%Description: Used to simulate launches and display data

%% Cleanup
clc
clear


%% Simulate
springConstant = 500;
springDisplacement = .25;
projectileMass = .1;
launchAngle = 45;
launcher = Launcher(springConstant, springDisplacement, projectileMass, launchAngle);
simulation = LaunchSimulation(launcher);
[horizonalRange, verticalRange, flightTime] = simulation.launch();
fprintf('Horizontal Range: %f \n', horizonalRange)
fprintf('Vertical Range: %f \n', verticalRange)
fprintf('Flight Time: %f \n', flightTime)