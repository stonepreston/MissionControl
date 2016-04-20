classdef MissionControlModel < handle
    
    %% Properties
    properties (Access = public, SetObservable = true)
        
        % might need to implement observable at the Launcher and
        % LaunchSimulation level instead of here, we will see
        launcher
        simulation
        
    end
    
    %% Non-static methods
    methods
        
        % Constructor
        function this = MissionControlModel()
            
            % initialize a launcher with zeros for its initial values
            this.launcher = Launcher(0,0,0,0);
            this.simulation = LaunchSimulation(this.launcher);
             
        end
             
    end
end 
    
    