classdef TestExportController < matlab.unittest.TestCase

    properties
       model
       view
       controller
    end

    methods(TestClassSetup)
        
        function setup(testCase)
            
            testCase.model = ExportModel([1,2,3;1,2,3]);
            testCase.view = ExportView(testCase.model);
            testCase.controller = ExportController(testCase.model, testCase.view);
            
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
            
            model = ExportModel([1,2,3;1,2,3]);
            view = ExportView(model);
            controller = ExportController(model, view);
            
            testCase.verifyEqual(controller.model, model, ...
                'Constructor failed to correctly set model');
            
            testCase.verifyEqual(controller.view, view, ...
                'Constructor failed to correctly set view');
            
            close(view.figure);
             
        end
        
        
       
    end

end