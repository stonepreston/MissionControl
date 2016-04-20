classdef LaunchSimulation < handle
    
    %% Constants
    properties (Constant)
        g = 9.81 % m/s^2
    end
    
    %% Properties
    properties (SetObservable)
        launcher
        angleTableData
        predictionsTableData
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
            this.angleTableData = [];
            this.predictionsTableData = [];
        end
        
        
        % Compute the table data for the angles for a given velocity
        function computeAngleData(this, velocity)
            

            % Create temporary simulation and launcher objects for
            % computing the table data
            tempLauncher = Launcher(this.launcher.springConstant, this.launcher.projectileMass, velocity, this.launcher.launchAngle);
            tempSimulation = LaunchSimulation(tempLauncher);
            
            
            horizontalRanges = [];
            verticalRanges = [];
            angles = [];
            timeOfFlights = [];
            
            for angle = 0:15:90
                
                tempSimulation.launcher.launchAngle = angle;
                angles(end+1) = angle;
                horizontalRanges(end+1) = tempSimulation.horizontalRange;
                verticalRanges(end+1) = tempSimulation.verticalRange;
                timeOfFlights(end+1) = tempSimulation.timeOfFlight;
            end
            

            
            this.angleTableData = [angles' horizontalRanges' verticalRanges' timeOfFlights'];
            
            % Delete the temporary objects
            delete(tempLauncher);
            delete(tempSimulation);
            
        end
        
        % compute the angle and velocity data for a given range
        function computePredictionData(this, horizontalRange)

            % Create temporary simulation and launcher objects for
            % computing the table data
            tempLauncher = Launcher(this.launcher.springConstant, this.launcher.projectileMass, this.launcher.launchVelocity, this.launcher.launchAngle);
            tempSimulation = LaunchSimulation(tempLauncher);
            
            
            velocities = [];
            angles = [];
           
            for angle = 0:15:90
                
                
                tempSimulation.launcher.launchAngle = angle;
                
                % solve for the velocity at the current angle
                % range = ((this.launcher.launchVelocity)^2 * sind(2 * this.launcher.launchAngle)) / LaunchSimulation.g;
                % range * g = ((this.launcher.launchVelocity)^2 * sind(2 * this.launcher.launchAngle))
                % (range * g) / sind(2 * this.launcher.launchAngle) = (this.launcher.launchVelocity)^2
                % this.launcher.launchVelocity = sqrt((range * g) / sind(2 * this.launcher.launchAngle))
                
                velocity = sqrt((horizontalRange * LaunchSimulation.g) / sind(2 * tempSimulation.launcher.launchAngle));
                angles(end+1) = angle;
                velocities(end+1) = velocity;
                
            end
            
            this.predictionsTableData = [angles' velocities'];
            
            % Delete the temporary objects
            delete(tempLauncher);
            delete(tempSimulation);
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