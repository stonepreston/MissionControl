classdef MissionControlController < handle
    
    %% Properties
    properties (Access = public)
        
        model
        view
        
    end
    
    %% Non-static methods
    methods
        
        % Constructor
        function this = MissionControlController(model, missionControlView)
            
            % initialize the model and view
            this.model = model;
            this.view = missionControlView;
            
            % Hook up the callbacks
            set(this.view.simulateButton, 'Callback', @this.simulateButtonPressed);
            set(this.view.predictionsCalculateButton, 'Callback', @this.predictionsCalculateButtonPressed);
            set(this.view.predictionsExportButton, 'Callback', @this.predictionsExportButtonPressed);
            set(this.view.tablesCalculateButton, 'Callback', @this.tablesCalculateButtonPressed);
            set(this.view.tablesExportButton, 'Callback', @this.tablesExportButtonPressed);
        end
        
        % Simulate Button Callback
        function simulateButtonPressed(this, src, ~)
            
            % reset label colors to black for validation purposes
            labelHandles = [this.view.launchVelocityLabel this.view.launchAngleLabel this.view.springConstantLabel this.view.projectileMassLabel];
            GuiHelpers.resetLabelForegroundColors(labelHandles)

            % validate launch velocity and launch angle text fields
            if GuiHelpers.isTextFieldValid(this.view.launchVelocityTextField, this.view.launchVelocityLabel) ...
                    && GuiHelpers.isTextFieldValid(this.view.launchAngleTextField, this.view.launchAngleLabel)

                % validate the spring constant and projectile mass text fields
                if GuiHelpers.isTextFieldValid(this.view.springConstantTextField, this.view.springConstantLabel) ...
                        && GuiHelpers.isTextFieldValid(this.view.projectileMassTextField, this.view.projectileMassLabel)

                    % clear the axes
                    cla(this.view.trajectoryAxes);
                    % Set the launcher data
                    this.model.simulation.launcher.springConstant = str2num(GuiHelpers.stripWhitespace(get(this.view.springConstantTextField, 'String')));
                    this.model.simulation.launcher.projectileMass = str2num(GuiHelpers.stripWhitespace(get(this.view.projectileMassTextField, 'String')));
                    this.model.simulation.launcher.launchVelocity = str2num(GuiHelpers.stripWhitespace(get(this.view.launchVelocityTextField, 'String')));
                    this.model.simulation.launcher.launchAngle = str2num(GuiHelpers.stripWhitespace(get(this.view.launchAngleTextField, 'String')));

                    % Construct data array for table using simulation object
                    tableData = {this.model.simulation.launcher.springDisplacement ...
                                 this.model.simulation.horizontalRange              ...
                                 this.model.simulation.verticalRange                ...
                                 this.model.simulation.timeOfFlight};

                    % Set the data of the table
                    set(this.view.simulationDataTable, 'Data', tableData);

                    % plot the graphs
                    DataDisplayer.plotVerticalVsHorizontalPosition(this.model.simulation, this.view.trajectoryAxes);

                end

            end
            
        end
        
        % Predictions Calculate Button Callback
        function predictionsCalculateButtonPressed(this, src, ~)
            
        end
        
        % Predictions Export Button Callback
        function predictionsExportButtonPressed(this, src, ~)
            
        end
        
        % Tables Calculate Button Callback
        function tablesCalculateButtonPressed(this, src, ~)
            
        end
        
        % Tables Export Button Callback
        function tablesExportButtonPressed(this, src, ~)
            
        end
              
    end
end 
    
    