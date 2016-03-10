classdef DataDisplayer < handle
    
    properties
        
    end
    
    %% Static methods
    methods (Static)
        
        
        function displaySimulationData(simulation)
            
            fprintf('Spring Displacement: %f \n', simulation.launcher.springDisplacement)
            fprintf('Horizontal Range: %f \n', simulation.horizontalRange)
            fprintf('Vertical Range: %f \n', simulation.verticalRange)
            fprintf('Flight Time: %f \n', simulation.timeOfFlight)
            
        end
        
        %% Table creation
        
        % display a table of varying angles using the data from a given
        % launcher
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
            
            disp(horizontalRanges)
            anglesAsStrings = strread(num2str(angles),'%s');
            
            angleTable = table(horizontalRanges', verticalRanges', timeOfFlights', 'rowNames', anglesAsStrings,...
            'VariableNames',{'Horizontal_Range_meters' 'Vertical_Range_meters' 'Time_of_Flight_seconds'});
            
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