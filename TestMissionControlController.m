classdef TestMissionControlController < matlab.unittest.TestCase

    properties
       model
       view
       controller
    end

    methods(TestClassSetup)
        
        function setup(testCase)
            
            testCase.model = MissionControlModel();
            testCase.view = MissionControlView(testCase.model);
            testCase.controller = MissionControlController(testCase.model, testCase.view);
            
        end
        
    end
    
    methods(TestClassTeardown)
        
        function teardown(testCase)
            
            close(testCase.view.figure);
            delete(testCase.view);
            delete(testCase.model);
            delete(testCase.controller);
            
            
        end
        
    end
    
    methods (Test)
        
        function testConstructor(testCase)
            
            model = MissionControlModel();
            view = MissionControlView(model);
            controller = MissionControlController(model, view);
            
            testCase.verifyEqual(controller.model, model, ...
                'Constructor failed to correctly set model');
            
            testCase.verifyEqual(controller.view, view, ...
                'Constructor failed to correctly set view');
            
            close(view.figure);
             
        end
        
        
       
    end

end