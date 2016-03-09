classdef Launcher < handle
    
    properties (Access = public)
        
        springConstant
        springDisplacement
        projectileMass
        launchAngle
        
    end
    
    properties (Dependent)
        
        launchVelocity
        
    end
    
    methods
        
        % Constructor
        function this = Launcher(springConstant, springDisplacement, projectileMass, launchAngle)
      
           this.springConstant = springConstant;
           this.springDisplacement = springDisplacement;
           this.projectileMass = projectileMass;
           this.launchAngle = launchAngle;
           
        end
        
        % Getter and Setters
        
        % launchVelocity
        function value = get.launchVelocity(this)
            
            value = this.springDisplacement * sqrt(this.springConstant / this.projectileMass);
            
        end
        
        
    end
end 
    
    