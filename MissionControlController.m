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
            set(this.view.convertButton, 'Callback', @this.convertButtonPressed);
            
            % Add the java POI's to the path
            GuiHelpers.addJavaPoiLibs();
            
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
                    %this.view.plotVerticalVsHorizontalPosition();

                end

            end
            
        end
        
        % Predictions Calculate Button Callback
        function predictionsCalculateButtonPressed(this, src, ~)
            
            % reset label colors to black for validation purposes
            labelHandles = [this.view.targetDistanceLabel this.view.springConstantLabel this.view.projectileMassLabel];
            GuiHelpers.resetLabelForegroundColors(labelHandles)

            % validate the target distance field
            if GuiHelpers.isTextFieldValid(this.view.targetDistanceTextField, this.view.targetDistanceLabel)

                % validate the spring constant and projectile mass text fields
                if GuiHelpers.isTextFieldValid(this.view.springConstantTextField, this.view.springConstantLabel) ...
                        && GuiHelpers.isTextFieldValid(this.view.projectileMassTextField, this.view.projectileMassLabel)

                    range = str2num(strtrim(get(this.view.targetDistanceTextField, 'String')));
                    simulation = this.model.simulation;

                    % Set the launcher data
                    this.model.simulation.launcher.springConstant = str2num(GuiHelpers.stripWhitespace(get(this.view.springConstantTextField, 'String')));
                    this.model.simulation.launcher.projectileMass = str2num(GuiHelpers.stripWhitespace(get(this.view.projectileMassTextField, 'String')));


                    this.model.simulation.computePredictionData(range);

                    % Set the data of the table
                    %set(this.view.predictionsTable, 'Data', tableData);

                end

            end
            
        end
        
        % Predictions Export Button Callback
        function predictionsExportButtonPressed(this, src, ~)
            
            % call the helper function and pass in the table
            GuiHelpers.openExportDataGui(this.view.predictionsTable);
            
        end
        
        % Tables Calculate Button Callback
        function tablesCalculateButtonPressed(this, src, ~)
            
            % reset label colors to black for validation purposes
            labelHandles = [this.view.launchVelocityTablesLabel this.view.springConstantLabel this.view.projectileMassLabel];

            % validate the angle table velocity text field
            if GuiHelpers.isTextFieldValid(this.view.launchVelocityTablesTextField, this.view.launchVelocityTablesLabel) 

                % validate the spring constant and projectile mass text fields
                if GuiHelpers.isTextFieldValid(this.view.springConstantTextField, this.view.springConstantLabel) ...
                        && GuiHelpers.isTextFieldValid(this.view.projectileMassTextField, this.view.projectileMassLabel)

                    % Set the launcher data
                    this.model.simulation.launcher.springConstant = str2num(GuiHelpers.stripWhitespace(get(this.view.springConstantTextField, 'String')));
                    this.model.simulation.launcher.projectileMass = str2num(GuiHelpers.stripWhitespace(get(this.view.projectileMassTextField, 'String')));

                    velocity = str2num(GuiHelpers.stripWhitespace(get(this.view.launchVelocityTablesTextField, 'String')));
                    simulation = this.model.simulation;
                    this.model.simulation.computeAngleData(velocity);

                    % Set the data of the table
                    %set(this.view.angleTable, 'Data', tableData);

                end

            end
    
        end
        
        % Tables Export Button Callback
        function tablesExportButtonPressed(this, src, ~)
            
            % call the helper function and pass in the table
            GuiHelpers.openExportDataGui(this.view.angleTable);
            
        end
        
        % Convert Button Callback
        function convertButtonPressed(this, src, ~)
            
            if GuiHelpers.isTextFieldValid(this.view.metersTextField, this.view.metersLabel)
            
                  meters = str2num(strtrim(get(this.view.metersTextField, 'String')));
                  inches = GuiHelpers.metersToInches(meters);
                  inchesString = num2str(inches, '%.2f');
                  this.view.inchesValueLabel.String = inchesString;
            end
                
        end
                   
    end
    
end 
    
    