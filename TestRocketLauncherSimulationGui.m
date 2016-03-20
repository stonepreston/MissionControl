classdef TestRocketLauncherSimulationGui < matlab.unittest.TestCase
    
    properties
        simulationGui
        simulationGuiData
    end

    methods(TestClassSetup)
        
        function setupOnce(testCase)
            
            testCase.simulationGui = RocketLauncherSimulationGUI;
            testCase.simulationGuiData = guidata(testCase.simulationGui);
            
        end
        
    end
    
    methods(TestClassTeardown)
        
        function teardownOnce(testCase)
            
            delete(testCase.simulationGui);
              
        end
        
    end
    
    methods (Test)
        
        
    end

end