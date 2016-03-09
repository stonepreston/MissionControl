classdef LaunchSimulation < handle
    
    properties (Constant)
        g = 9.81 % m/s^2
    end
    
    properties
        launcher
    end
    
    methods
        
        % constructor
        function this = LaunchSimulation(launcher)
            this.launcher = launcher;
        end
        
        % Function: Launch
        % Description: Returns  the launch data of a simulation's launcher
        % Arguments:
        % obj = this object
        % Return:
        % horizontalRange = the horizontal range of the projectile in m
        % verticalRange = the vertical range of the projectile in m
        % flightTime = the flight time of the projectile in s
        function [horizontalRange, verticalRange, flightTime] = launch(this)
            
            % https://en.wikipedia.org/wiki/Range_of_a_projectile
            horizontalRange = ((this.launcher.launchVelocity)^2 * sind(2 * this.launcher.launchAngle)) / LaunchSimulation.g;
            verticalRange = ((this.launcher.launchVelocity^2) * sind(this.launcher.launchAngle)^2) / (2 * LaunchSimulation.g);
            flightTime = ((2 * this.launcher.launchVelocity) * sind(this.launcher.launchAngle)) / LaunchSimulation.g;
            
        end
    end
end