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
            simulationTableData = {'' '' '' ''};
            set(this.simulationDataTable, 'Data', simulationTableData);
            
            %% Trajectory Panel
            this.trajectoryPanel = findobj(this.figure, 'tag', 'panelTrajectory');
            this.trajectoryAxes = findobj(this.figure, 'tag', 'axesTrajectory');
            % add labels to axes (this isnt working for some reason
            %axes(this.trajectoryAxes);
            %xlabel('Horizontal Position (m)');
            %ylabel('Vertical Position (m)');
            
            %% Predictions Panel
            this.simulationPanel = findobj(this.figure, 'tag', 'panelPredictions');
            this.targetDistanceLabel = findobj(this.figure, 'tag', 'labelTargetDistance');
            this.targetDistanceTextField = findobj(this.figure, 'tag', 'editTargetDistance');
            this.predictionsCalculateButton =  findobj(this.figure, 'tag', 'buttonCalculate');
            this.predictionsExportButton = findobj(this.figure, 'tag', 'buttonExportPredictions');
            this.predictionsTable = findobj(this.figure, 'tag', 'tablePredictions');
            angles = [0;15;30;45;60;75;90];
            predictionTableData = [angles; [];];
            set(this.predictionsTable, 'Data', predictionTableData);
            
            %% Tables Panel
            this.tablesPanel = findobj(this.figure, 'tag', 'panelTables');
            this.launchVelocityTablesLabel = findobj(this.figure, 'tag', 'labelAngleTableVelocity');
            this.launchVelocityTablesTextField = findobj(this.figure, 'tag', 'editAngleTableVelocity');
            this.tablesCalculateButton =  findobj(this.figure, 'tag', 'buttonGenerateTable');
            this.tablesExportButton = findobj(this.figure, 'tag', 'buttonExportAngles');
            this.angleTable = findobj(this.figure, 'tag', 'tableAngles');
            angleTableData = [angles; []; []; []];
            set(this.angleTable, 'Data', angleTableData);
           
        end
        
        %% Plotting Methods
       function plotVerticalVsHorizontalPosition(this)
           
           t = 0:.01:this.model.simulation.timeOfFlight;
           x = (this.model.simulation.launcher.launchVelocity * cosd(this.model.simulation.launcher.launchAngle) .* t);
           y = (this.model.simulation.launcher.launchVelocity * sind(this.model.simulation.launcher.launchAngle) .* t) + (-.5 * LaunchSimulation.g .* (t.^2));
         
           hold(this.trajectoryAxes);
           comet(this.trajectoryAxes,x,y);
           hold(this.trajectoryAxes);
  
       end
         
    end
end 
     
    