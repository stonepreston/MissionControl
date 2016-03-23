classdef TestExportModel < matlab.unittest.TestCase

    properties
        
    end

    methods (Test)
        
        function testConstructor(testCase)
            
            % pass in 1 as the data argument
            model = ExportModel(1);
            
            testCase.verifyEqual(model.data, 1, ...
                'Constructor failed to correctly set data');
            
            
            
        end
       
            
    end

end