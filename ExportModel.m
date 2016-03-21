classdef ExportModel < handle
    
    %% Properties
    properties (Access = public, SetObservable = true)
       
        data
        
    end
    
    %% Non-static methods
    methods
        
        % Constructor
        function this = ExportModel(data)
            
            this.data = data;
            
        end
             
    end
end 
    