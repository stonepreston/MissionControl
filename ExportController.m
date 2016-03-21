classdef ExportController < handle
    
    %% Properties
    properties (Access = public)
        
        model
        view
        
    end
    
    %% Non-static methods
    methods
        
        % Constructor
        function this = ExportController(model, view)
            
            % initialize the model and view
            this.model = model;
            this.view = view;
            
            % Hook up the callbacks
            set(this.view.okButton, 'Callback', @this.okButtonPressed);
           
            
        end
        
        % OK Button Callback
        function okButtonPressed(this, src, ~)
            
            % check if we need to include column headers

            if get(this.view.includeColumnHeadersCheckBox, 'Value') == 0

                % we need to remove the top row of the export data to get rid of the
                % headers. 
                this.model.data(1, :) = [];

            end

            filename = get(this.view.fileNameTextField, 'String');
            sheetName = get(this.view.sheetNameTextField, 'String');
            startRange = get(this.view.startRangeTextField, 'String');
            xlwrite(filename, this.model.data, sheetName, startRange);
            close(this.view.figure);
            
        end
              
    end
end 
    
    