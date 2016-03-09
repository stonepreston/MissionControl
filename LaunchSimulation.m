classdef LaunchSimulation < handle
    
    properties (Constant)
        g = 9.81 % m/s^2
    end
    
    properties
        launcher
    end
    
    properties (Dependent)
        
        horizontalRange
        verticalRange
        timeOfFlight
        
    end
    
    methods
        
        %% constructor
        function this = LaunchSimulation(launcher)
            this.launcher = launcher;
        end
         
        %% Getters and Setters
        
        % horizontalRange
        function value = get.horizontalRange(this)
            
            value = ((this.launcher.launchVelocity)^2 * sind(2 * this.launcher.launchAngle)) / LaunchSimulation.g;
            
        end
        
        % verticalRange
        function value = get.verticalRange(this)
            
            value = ((this.launcher.launchVelocity^2) * sind(this.launcher.launchAngle)^2) / (2 * LaunchSimulation.g);
            
        end
        
        % timeOfFlight
        function value = get.timeOfFlight(this)
            
            value = ((2 * this.launcher.launchVelocity) * sind(this.launcher.launchAngle)) / LaunchSimulation.g;
            
        end
        
        %% Data display
        function displayData(this)
            
            fprintf('Spring Displacement: %f \n', this.launcher.springDisplacement)
            fprintf('Horizontal Range: %f \n', this.horizontalRange)
            fprintf('Vertical Range: %f \n', this.verticalRange)
            fprintf('Flight Time: %f \n', this.timeOfFlight)
        end
        
    end
end