classdef Launcher
    
    properties
        springConstant
        launchAngle
        launchVelocity
    end
    
    methods
        
        function obj = Launcher(springConstant, launchAngle, launchVelocity)
           obj.launchAngle = launchAngle;
           obj.springConstant = springConstant;
           obj.launchVelocity = launchVelocity;
        end
    end
end 
    
    