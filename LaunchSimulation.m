classdef LaunchSimulation
    
    properties (Constant)
        g = 9.81 % m/s^2
    end
    
    properties
        launcher
    end
    
    methods
        
        % constructor
        function obj = LaunchSimulation(launcher)
            obj.launcher = launcher;
        end
        
        % Function: Launch
        % Description: Returns  the launch data of a simulation's launcher
        % Parameters:
        % obj = this object
        % Return:
        % horizontalRange = the horizontal range of the projectile in m
        % verticalRange = the vertical range of the projectile in m
        % flightTime = the flight time of the projectile in s
        function [horizontalRange, verticalRange, flightTime] = launch(obj)
            
            % https://en.wikipedia.org/wiki/Range_of_a_projectile
            horizontalRange = ((obj.launcher.launchVelocity)^2 * sind(2 * obj.launcher.launchAngle)) / LaunchSimulation.g;
            verticalRange = ((obj.launcher.launchVelocity^2) * sind(obj.launcher.launchAngle)^2) / (2 * LaunchSimulation.g);
            flightTime = ((2 * obj.launcher.launchVelocity) * sind(obj.launcher.launchAngle)) / LaunchSimulation.g;
            
        end
    end
end