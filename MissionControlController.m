classdef MissionControlController < handle
    
    %% Properties
    properties (Access = public)
        
        model
        missionControlView
        
    end
    
    %% Non-static methods
    methods
        
        % Constructor
        function this = MissionControlController(model, missionControlView)
            
            % initialize the model and view
            this.model = Model();
            this.missionControlView = MissionControlView(this.model);
            
        end
             
    end
end 
    
    