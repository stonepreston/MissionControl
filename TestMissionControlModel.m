classdef TestMissionControlModel < matlab.unittest.TestCase

    properties
        
    end

    methods (Test)
        
        function testConstructor(testCase)
            
            model = MissionControlModel();
            
            testCase.verifyNotEmpty(model.simulation, ...
                'Constructor failed to correctly set simulation');
            
            testCase.verifyNotEmpty(model.simulation.launcher, ...
                'Constructor failed to correctly set simulation.launcher');
            
        end
       
            
    end

end