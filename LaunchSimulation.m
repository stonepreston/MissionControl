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
    
    %% Methods
    methods
        
        % constructor
        function this = LaunchSimulation(launcher)
            this.launcher = launcher;
        end
        
        % Launch data computation for user input values
        function computeHorizontalAndVerticalRange(this)
            
            
            this.launcher.launchVelocity = input('Enter launcher velocity: ');
            this.launcher.launchAngle = input('Enter launcher angle: ');
            
            DataDisplayer.displayLauncherSettingsTable(this);
            fprintf('Horizontal Range: %f \n', this.horizontalRange)
            fprintf('Vertical Range: %f \n', this.verticalRange)
            
        end
        
        % Compute the table data for the angles for a given velocity
        function tableData = getAngleTableData(this, velocity)
            
            % save the orignal launcher data so we can set it back to the
            % original values when we are done computing the table data
            originalVelocity = this.launcher.launchVelocity;
            originalAngle = this.launcher.launchAngle;
            
            % set the launcher velocity to the specified velocity passed in
            simulation.launcher.launchVelocity = velocity;
            horizontalRanges = [];
            verticalRanges = [];
            angles = [];
            timeOfFlights = [];
            
            for angle = 0:15:90
                
                this.launcher.launchAngle = angle;
                angles(end+1) = angle;
                horizontalRanges(end+1) = this.horizontalRange;
                verticalRanges(end+1) = this.verticalRange;
                timeOfFlights(end+1) = this.timeOfFlight;
            end
            
            % reset the launcher back to original values
            this.launcher.launchVelocity = originalVelocity;
            this.launcher.launchAngle = originalAngle;
            
            
            tableData = [angles' horizontalRanges' verticalRanges' timeOfFlights'];
          
        end
        
        function predictionData = getPredictionData(this, horizontalRange)
            
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