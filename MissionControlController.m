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
            this.model = model;
            this.missionControlView = missionControlView;
            
        end
             
    end
end 
    
    