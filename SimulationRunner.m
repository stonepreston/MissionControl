%%Description: Used to simulate launches and display data

%% Cleanup
clc
clear


%% Simulate
springConstant = 15;
projectileMass = .1;
launchVelocity = 20;
launchAngle = 45;
launcher = Launcher(springConstant, projectileMass, launchVelocity, launchAngle);
simulation = LaunchSimulation(launcher);
%DataDisplayer.displaySimulationData(simulation);
%DataDisplayer.displayAngleTable(simulation);
simulation.computeHorizontalAndVerticalRange();





