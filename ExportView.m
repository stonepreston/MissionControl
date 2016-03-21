classdef ExportView < handle
    
    %% Properties
    properties (Access = public)
        
        model
        
        figure
        
        fileNameLabel
        fileNameTextField
        sheetNameLabel
        sheetNameTextField
        startRangeLabel
        startRangeTextField
        includeColumnHeadersCheckBox
        okButton
         
    end
    
    %% Non-static methods
    methods
        
        % Constructor
        function this = ExportView(model)
            this.model = model;
            
            % open the figure that was designed with GUIDE
            this.figure = openfig('ExportGUI.fig');
            
            this.fileNameLabel = findobj(this.figure, 'tag', 'labelFileName');
            this.fileNameTextField = findobj(this.figure, 'tag', 'editFileName');
            
            this.sheetNameLabel = findobj(this.figure, 'tag', 'labelSheetName');
            this.sheetNameTextField = findobj(this.figure, 'tag', 'editSheetName');
            
            this.startRangeLabel = findobj(this.figure, 'tag', 'labelStartRange');
            this.startRangeTextField = findobj(this.figure, 'tag', 'editStartRange');
            
            this.includeColumnHeadersCheckBox = findobj(this.figure, 'tag', 'checkboxIncludeColumnHeaders');
            
            this.okButton = findobj(this.figure, 'tag', 'buttonOK');
            
           
        end
  
    end
end 
     
    