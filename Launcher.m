classdef Launcher < handle
    
    %% Properties
    properties (Access = public)
        
        springConstant
        projectileMass
        launchVelocity
        launchAngle
        
    end
    
    %% Dependent Properties
    properties (Dependent)
        
        springDisplacement
        
    end
    
    
    %% Non-static methods
    methods
        
        % Constructor
        function this = Launcher(springConstant, projectileMass, launchVelocity, launchAngle)
      
           this.springConstant = springConstant;
           this.projectileMass = projectileMass;
           this.launchVelocity = launchVelocity;
           this.launchAngle = launchAngle;
           
        end
        
        % Getter and Setters
        
        % springDisplacement
        function value = get.springDisplacement(this)
            
            %value = this.launchVelocity / sqrt(this.springConstant / this.projectileMass);
            value = this.launchVelocity / sqrt(this.springConstant / this.projectileMass);
        end
         
    end
end 
    
    