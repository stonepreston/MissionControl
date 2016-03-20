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
        simulationDataTable
        trajectoryAxis
        
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
        end
        
        % Getter and Setters
         
    end
end 
    
    