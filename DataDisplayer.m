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
        
        % Create a table of varying angles using the data from a given
        % launcher
        function createAngleTable(launcher)
            
            for angle = 0:15:90
                
                launcher.launchAngle = angle;
                
            end
           
        end
    end
    
    %% Non-static methods
    methods
        
    end
    
end