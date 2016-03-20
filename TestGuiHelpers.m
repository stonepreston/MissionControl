classdef TestGuiHelpers < matlab.unittest.TestCase
    
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
        
        function testOpenExportDataGui(testCase)
            
            table = testCase.simulationGuiData.tablePredictions;
            
            % table is not populated with data yet, so openExportDataGui()
            % should not open the export window and open a message box
            % instead
            exportWindowHandle = GuiHelpers.openExportDataGui(table);
         
            % Find the message box, verify it exists, then close it
            messageBoxHandle = findall(0,'Type','figure','Name','Error');
            testCase.verifyNotEmpty(messageBoxHandle, 'Error message failed to display when trying to export empty data set');
            close(messageBoxHandle);
            
            % set the table data using random matrices for the angles and
            % velocities
            angles = rand(7,1);
            velocities = rand(7,1);
            tableData = [angles velocities];
            set(table, 'Data', tableData);
            
            % table is now populated, export window should open
            exportWindowHandle = GuiHelpers.openExportDataGui(table);
            testCase.verifyNotEmpty(exportWindowHandle, 'Export window failed to open');
            % close the export window
            close(exportWindowHandle);
                
        end
        
        function testAddJavaPoiLibs(testCase)
            
            GuiHelpers.addJavaPoiLibs();
            javaPath = javaclasspath('-dynamic');
            testCase.verifyNotEmpty(javaPath, 'POI libs were not added to javapath');

        end
        
        function testErrorMessage(testCase)
            
            messageBoxHandle = GuiHelpers.errorMessage('test');
            testCase.verifyNotEmpty(messageBoxHandle, 'Message box failed to open');
            errorString = messageBoxHandle.Children(3).Children.String(1);
            testCase.verifyEqual(errorString, {'test'}, 'Message box was not set with correct message');
            % close the message box
            close(messageBoxHandle);
        end
        
        function testIsTextFieldValid(testCase)
            
            % pick one of the text fields and respective label to test with
            textFieldHandle = testCase.simulationGuiData.editLaunchVelocity;
            labelHandle = testCase.simulationGuiData.labelLaunchVelocity;
            
            % set the string of the text field to be blank
            textFieldHandle.String = '';
            validity = GuiHelpers.isTextFieldValid(textFieldHandle, labelHandle);
            testCase.verifyEqual(validity, false, 'Textfield validation allowed blank value');
            % Find the error message box that was opened and close it
            messageBoxHandle = findall(0,'Type','figure','Name','Error');
            close(messageBoxHandle);
            
            % set the string of the text field to contain letters
            textFieldHandle.String = '123abc';
            validity = GuiHelpers.isTextFieldValid(textFieldHandle, labelHandle);
            testCase.verifyEqual(validity, false, 'Textfield validation allowed letters');
            % Find the error message box that was opened and close it
            messageBoxHandle = findall(0,'Type','figure','Name','Error');
            close(messageBoxHandle);
            
            % set the string of the text field to contain numbers with
            % spaces in between the digits
            textFieldHandle.String = '123 456 789';
            validity = GuiHelpers.isTextFieldValid(textFieldHandle, labelHandle);
            testCase.verifyEqual(validity, false, 'Textfield validation allowed numbers with spaces in between them');
            % Find the error message box that was opened and close it
            messageBoxHandle = findall(0,'Type','figure','Name','Error');
            close(messageBoxHandle);
            
            % set the string of the text field to contain numbers
            textFieldHandle.String = '123';
            validity = GuiHelpers.isTextFieldValid(textFieldHandle, labelHandle);
            testCase.verifyEqual(validity, true, 'Textfield validation did not allow valid value');
            % Find the error message box that was opened and close it
            messageBoxHandle = findall(0,'Type','figure','Name','Error');
            close(messageBoxHandle);
            
        end
        
        function testStripWhitespace(testCase)
            
            testString = ' test ';
            strippedString = GuiHelpers.stripWhitespace(testString);
            testCase.verifyEqual(strippedString, 'test', 'spaces were not trimmed from the ends of the string');
            
            testString = ' t e s t ';
            strippedString = GuiHelpers.stripWhitespace(testString);
            testCase.verifyEqual(strippedString, 'test', 'spaces were not removed from inside the string');
            
        end
        
    end

end