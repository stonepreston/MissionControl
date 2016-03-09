%%Description: Used to simulate launches and display data

%% Cleanup
clc
clear


%% Simulate
launcher = Launcher(10,45,15);
simulation = LaunchSimulation(launcher);
[horizonalRange, verticalRange, flightTime] = simulation.launch();
fprintf('Horizontal Range: %f \n', horizonalRange)
fprintf('Vertical Range: %f \n', verticalRange)
fprintf('Flight Time: %f \n', flightTime)