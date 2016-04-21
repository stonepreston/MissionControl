classdef TestMissionControlView < matlab.unittest.TestCase

    properties
       model
       view
    end

    methods(TestClassSetup)
        
        function setup(testCase)
            
            testCase.model = MissionControlModel();
            testCase.view = MissionControlView(testCase.model);
            
        end
        
    end
    
    methods(TestClassTeardown)
        
        function teardown(testCase)
            
            % Delete the simulation
            close(testCase.view.figure);
            delete(testCase.model);
            
        end
        
    end
    
    methods (Test)
        
        function testConstructor(testCase)
            
            model = MissionControlModel();
            view = MissionControlView(model);
            
            testCase.verifyEqual(view.model, model, ...
                'Constructor failed to correctly set model');
            
            testCase.verifyNotEmpty(view.figure, 'Constructor failed to correctly set figure');
            
            % Launcher Settings
            testCase.verifyNotEmpty(view.launcherSettingsPanel, 'Constructor failed to correctly set launcherSettingsPanel');
            testCase.verifyNotEmpty(view.springConstantLabel, 'Constructor failed to correctly set springConstantLabel');
            testCase.verifyNotEmpty(view.springConstantTextField, 'Constructor failed to correctly set springConstantTextField');
            testCase.verifyNotEmpty(view.projectileMassLabel, 'Constructor failed to correctly set projectileMassLabel');
            testCase.verifyNotEmpty(view.projectileMassTextField, 'Constructor failed to correctly set projectileMassTextField');
            
            % Simulation
            testCase.verifyNotEmpty(view.simulationPanel, 'Constructor failed to correctly set simulationPanel');
            testCase.verifyNotEmpty(view.launchVelocityLabel, 'Constructor failed to correctly set launchVelocityLabel');
            testCase.verifyNotEmpty(view.launchVelocityTextField, 'Constructor failed to correctly set launchVelocityTextField');
            testCase.verifyNotEmpty(view.launchAngleLabel, 'Constructor failed to correctly set launchAngleLabel');
            testCase.verifyNotEmpty(view.launchAngleTextField, 'Constructor failed to correctly set launchAngleTextField');
            testCase.verifyNotEmpty(view.simulateButton, 'Constructor failed to correctly set simulateButton');
            testCase.verifyNotEmpty(view.simulationDataPanel, 'Constructor failed to correctly set simulationDataPanel');
            testCase.verifyNotEmpty(view.simulationDataTable, 'Constructor failed to correctly set simulationDataTable');
            testCase.verifyNotEmpty(view.trajectoryPanel, 'Constructor failed to correctly set trajectoryPanel');
            testCase.verifyNotEmpty(view.trajectoryAxes, 'Constructor failed to correctly set trajectoryAxes');

            % Predictions
            testCase.verifyNotEmpty(view.predictionsPanel, 'Constructor failed to correctly set predictionsPanel');
            testCase.verifyNotEmpty(view.targetDistanceLabel, 'Constructor failed to correctly set targetDistanceLabel');
            testCase.verifyNotEmpty(view.targetDistanceTextField, 'Constructor failed to correctly set targetDistanceTextField');
            testCase.verifyNotEmpty(view.predictionsCalculateButton, 'Constructor failed to correctly set predictionsCalculateButton');
            testCase.verifyNotEmpty(view.predictionsExportButton, 'Constructor failed to correctly set predictionsExportButton');
            testCase.verifyNotEmpty(view.predictionsTable, 'Constructor failed to correctly set predictionsTable');

            % Tables
            testCase.verifyNotEmpty(view.tablesPanel, 'Constructor failed to correctly set tablesPanel');
            testCase.verifyNotEmpty(view.launchVelocityTablesLabel, 'Constructor failed to correctly set launchVelocityTablesLabel');
            testCase.verifyNotEmpty(view.launchVelocityTablesTextField, 'Constructor failed to correctly set launchVelocityTablesTextField');
            testCase.verifyNotEmpty(view.tablesCalculateButton, 'Constructor failed to correctly set tablesCalculateButton');
            testCase.verifyNotEmpty(view.tablesExportButton, 'Constructor failed to correctly set tablesExportButton');
            testCase.verifyNotEmpty(view.angleTable, 'Constructor failed to correctly set angleTable');
            
            % Conversions
            testCase.verifyNotEmpty(view.conversionsPanel, 'Constructor failed to correctly set conversionPanel');
            testCase.verifyNotEmpty(view.metersLabel, 'Constructor failed to correctly set metersLabel');
            testCase.verifyNotEmpty(view.metersTextField, 'Constructor failed to correctly set metersTextField');
            testCase.verifyNotEmpty(view.inchesLabel, 'Constructor failed to correctly set inchesLabel');
            testCase.verifyNotEmpty(view.inchesValueLabel, 'Constructor failed to correctly set inchesValueLabel');
            testCase.verifyNotEmpty(view.convertButton, 'Constructor failed to correctly set convertButton');
            
            close(view.figure);
            
        end
       
    end

end