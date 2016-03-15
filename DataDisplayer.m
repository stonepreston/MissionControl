classdef DataDisplayer < handle
    
    properties
        
    end
    
    %% Static methods
    methods (Static)
        
        
       %% Plotting Methods
       function plotVerticalVsHorizontalPosition(simulation, axesToPlot)
           
           t = 0:.01:simulation.timeOfFlight;
           x = (simulation.launcher.launchVelocity * cosd(simulation.launcher.launchAngle) .* t);
           y = (simulation.launcher.launchVelocity * sind(simulation.launcher.launchAngle) .* t) + (-.5 * LaunchSimulation.g .* (t.^2));
         
           hold(axesToPlot);
           comet(axesToPlot,x,y);
           hold(axesToPlot);
  
       end
       
       function plotVerticalPositionVsTime(simulation, axesToPlot)
           
           t = 0:.01:simulation.timeOfFlight;
           y = (simulation.launcher.launchVelocity * sind(simulation.launcher.launchAngle) .* t) + (-.5 * LaunchSimulation.g .* (t.^2));
          
           hold(axesToPlot);
           comet(axesToPlot,t,y);
           hold(axesToPlot);
           
       end
        
       
    end
        
end