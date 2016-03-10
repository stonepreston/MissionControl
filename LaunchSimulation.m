classdef LaunchSimulation < handle
    
    %% Constants
    properties (Constant)
        g = 9.81 % m/s^2
    end
    
    %% Properties
    properties
        launcher
    end
    
    %% Dependent Properties
    properties (Dependent)
        
        horizontalRange
        verticalRange
        timeOfFlight
        
    end
    
    %% Non-static Methods
    methods
        
        %% constructor
        function this = LaunchSimulation(launcher)
            this.launcher = launcher;
        end
        
        %% Launch data computation for user input values
        function computeHorizontalAndVerticalRange(this)
            
            
            this.launcher.launchVelocity = input('Enter launcher velocity: ');
            this.launcher.launchAngle = input('Enter launcher angle: ');
            
            DataDisplayer.displayLauncherSettingsTable(this);
            fprintf('Horizontal Range: %f \n', this.horizontalRange)
            fprintf('Vertical Range: %f \n', this.verticalRange)
            
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
        
    end
end