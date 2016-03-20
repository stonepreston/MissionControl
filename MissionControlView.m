classdef MissionControlView < handle
    
    %% Properties
    properties (Access = public)
        
        model
        
        figure
        
        % Launcher Settings
        launcherSettingsPanel
        springConstantLabel
        springConstantTextField
        projectileMassLabel
        projectileMassTextField
        
        % Simulation
        simulationPanel
        launchVelocityLabel
        launchVelocityTextField
        launchAngleLabel
        launchAngleTextField
        simulateButton
        simulationDataPanel
        simulationDataTable
        trajectoryPanel
        trajectoryAxes
        
        % Predictions
        predictionsPanel
        targetDistanceLabel
        targetDistanceTextField
        predictionsCalculateButton
        predictionsExportButton
        predictionsTable
        
        % Tables
        tablesPanel
        launchVelocityTablesLabel
        launchVelocityTablesTextField
        tablesCalculateButton
        tablesExportButton
        angleTable
         
    end
    
    %% Non-static methods
    methods
        
        % Constructor
        function this = MissionControlView(model)
            this.model = model;
            
            % open the figure that was designed with GUIDE
            this.figure = openfig('RocketLauncherSimulationGUI.fig');
            
            %% Launcher Settings Panel
            this.launcherSettingsPanel = findobj(this.figure, 'tag', 'panelLauncherSettings');
            this.springConstantLabel = findobj(this.figure, 'tag', 'labelSpringConstant');
            this.springConstantTextField = findobj(this.figure, 'tag','editSpringConstant');
            this.projectileMassLabel = findobj(this.figure, 'tag', 'labelProjectileMass');
            this.projectileMassTextField = findobj(this.figure, 'tag','editProjectileMass');
            
            %% Simulation Panel
            this.simulationPanel = findobj(this.figure, 'tag', 'panelSimulation');
            this.launchVelocityLabel = findobj(this.figure, 'tag', 'labelLaunchVelocity');
            this.launchVelocityTextField = findobj(this.figure, 'tag','editLaunchVelocity');
            this.launchAngleLabel = findobj(this.figure, 'tag', 'labelLaunchAngle');
            this.launchAngleTextField = findobj(this.figure, 'tag','editLaunchAngle');
            this.simulateButton =  findobj(this.figure, 'tag', 'buttonSimulate');
            
            %% Simulation Data Panel
            this.simulationDataPanel = findobj(this.figure, 'tag', 'panelSimulationData');
            this.simulationDataTable = findobj(this.figure, 'tag', 'tableSimulationData');
            
            %% Trajectory Panel
            this.trajectoryPanel = findobj(this.figure, 'tag', 'panelTrajectory');
            this.trajectoryAxes = findobj(this.figure, 'tag', 'axesTrajectory');
            
            %% Predictions Panel
            this.simulationPanel = findobj(this.figure, 'tag', 'panelPredictions');
            this.targetDistanceLabel = findobj(this.figure, 'tag', 'labelTargetDistance');
            this.targetDistanceTextField = findobj(this.figure, 'tag', 'editTargetDistance');
            this.predictionsCalculateButton =  findobj(this.figure, 'tag', 'buttonCalculate');
            this.predictionsExportButton = findobj(this.figure, 'tag', 'buttonExportPredictions');
            this.predictionsTable = findobj(this.figure, 'tag', 'tablePredictions');
            
            %% Tables Panel
            this.tablesPanel = findobj(this.figure, 'tag', 'panelTables');
            this.launchVelocityTablesLabel = findobj(this.figure, 'tag', 'labelAngleTableVelocity');
            this.launchVelocityTablesTextField = findobj(this.figure, 'tag', 'editAngleTableVelocity');
            this.tablesCalculateButton =  findobj(this.figure, 'tag', 'buttonGenerateTable');
            this.tablesExportButton = findobj(this.figure, 'tag', 'buttonExportAngles');
            this.angleTable = findobj(this.figure, 'tag', 'tableAngles');
           
        end
        
        
         
    end
end 
     
    