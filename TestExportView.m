classdef TestExportView < matlab.unittest.TestCase

    properties
       model
       view
    end

    methods(TestClassSetup)
        
        function setup(testCase)
            
            testCase.model = ExportModel([1,2,3;1,2,3]);
            testCase.view = ExportView(testCase.model);
            
        end
        
    end
    
    methods(TestClassTeardown)
        
        function teardown(testCase)
            
            close(testCase.view.figure);
            delete(testCase.model);
            delete(testCase.view);
            
        end
        
    end
    
    methods (Test)
        
        function testConstructor(testCase)
            
            model = ExportModel([1,2,3;1,2,3]);
            view = ExportView(model);
            
            testCase.verifyEqual(view.model, model, ...
                'Constructor failed to correctly set model');
            
            testCase.verifyNotEmpty(view.figure, 'Constructor failed to correctly set figure');
            testCase.verifyNotEmpty(view.fileNameLabel, 'Constructor failed to correctly set fileNameLabel');
            testCase.verifyNotEmpty(view.fileNameTextField, 'Constructor failed to correctly set fileNameTextField');
            testCase.verifyNotEmpty(view.sheetNameLabel, 'Constructor failed to correctly set sheetNameLabel');
            testCase.verifyNotEmpty(view.sheetNameTextField, 'Constructor failed to correctly set sheetNameTextField');
            testCase.verifyNotEmpty(view.startRangeLabel, 'Constructor failed to correctly set startRangeLabel');
            testCase.verifyNotEmpty(view.startRangeTextField, 'Constructor failed to correctly set startRangeTextField');
            testCase.verifyNotEmpty(view.includeColumnHeadersCheckBox, 'Constructor failed to correctly set includeColumnHeadersCheckBox');
            testCase.verifyNotEmpty(view.okButton, 'Constructor failed to correctly set okButton');
            
            close(view.figure);
            
        end
       
    end

end