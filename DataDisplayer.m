classdef DataDisplayer < handle
    
    properties
        
    end
    
    %% Static methods
    methods (Static)
        
        
       %% Display Methods
       function displaySimulationData(simulation)
            
            DataDisplayer.displayLauncherSettingsTable(simulation);
            fprintf('Spring Displacement (m): %f \n', simulation.launcher.springDisplacement)
            fprintf('Horizontal Range (m): %f \n', simulation.horizontalRange)
            fprintf('Vertical Range (m): %f \n', simulation.verticalRange)
            fprintf('Flight Time (s): %f \n', simulation.timeOfFlight)
            
       end
        
       %% Plotting Methods
       function plotPosition(simulation)
           
           t = 0:.01:simulation.timeOfFlight;
           x = (simulation.launcher.launchVelocity * cosd(simulation.launcher.launchAngle) .* t);
           y = (simulation.launcher.launchVelocity * sind(simulation.launcher.launchAngle) .* t) + (-.5 * LaunchSimulation.g .* (t.^2));
           % x(end+1) = (simulation.launcher.launchVelocity * cosd(simulation.launcher.launchAngle) * t);
          
           plot(x,y);
         
       end
        
        %% Table creation
        
        % Display a table of the launcher settings for a simulation
        function displayLauncherSettingsTable(simulation)
            launcher = simulation.launcher;
            
            tableHeadings = {'Spring_Constant' 'Projectile_Mass' 'Launch_Velocity' 'Launch_Angle'};
            springConstant = [launcher.springConstant];
            projectileMass = [launcher.projectileMass];
            launchVelocity = [launcher.launchVelocity];
            launchAngle = [launcher.launchAngle];
            
            settingsTable = table(springConstant', projectileMass', launchVelocity', launchAngle',...
            'VariableNames', tableHeadings);
            
            disp('Launcher Settings:')
            disp(settingsTable)
            
            
        end
        
        % display a table of varying angles using the data from a given
        % simulation
        function displayAngleTable(simulation)
            
            velocity = simulation.launcher.launchVelocity;
            originalAngle = simulation.launcher.launchAngle;
            horizontalRanges = [];
            verticalRanges = [];
            angles = [];
            timeOfFlights = [];
            
            for angle = 0:15:90
                
                simulation.launcher.launchAngle = angle;
                angles(end+1) = angle;
                horizontalRanges(end+1) = simulation.horizontalRange;
                verticalRanges(end+1) = simulation.verticalRange;
                timeOfFlights(end+1) = simulation.timeOfFlight;
            end
          
            anglesAsStrings = strread(num2str(angles),'%s');
            tableHeadings = {'Horizontal_Range_m' 'Vertical_Range_m' 'Time_of_Flight_s'};
            angleTable = table(horizontalRanges', verticalRanges', timeOfFlights', 'rowNames', anglesAsStrings,...
            'VariableNames', tableHeadings);
            
            disp('Angle Chart')
            fprintf('Velocity: %f m/sec \n', velocity)
            disp(angleTable)
            
            % Reset launch angle back to original angle
            simulation.launcher.launchAngle = originalAngle;

            
        end
        
    end
    
    %% Non-static methods
    methods
        
    end
    
end