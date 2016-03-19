classdef GuiHelpers < handle
    
    properties
    end
    
    methods (Static)
        
        function openExportDataGui(table)
            
            try
                exportData = [get(table, 'ColumnName')'; num2cell(get(table, 'Data'))];
                exportGui = ExportGUI;
                exportGuiData = guidata(exportGui);
                exportGuiData.exportData = exportData;
                % update the exportGui's guidata struct
                guidata(exportGui, exportGuiData);
                
            catch e
                
                if strcmp(e.identifier, 'MATLAB:catenate:dimensionMismatch')
                    
                    % display an error message
                    GuiHelpers.errorMessage('There is no data to export.');
                    
                else
                    
                    % display an error message
                    GuiHelpers.errorMessage('An error occurred.');
                    
                end
            end
           
        end
        
        function addJavaPoiLibs()
           
            javaaddpath('poi_library/poi-3.8-20120326.jar');
            javaaddpath('poi_library/poi-ooxml-3.8-20120326.jar');
            javaaddpath('poi_library/poi-ooxml-schemas-3.8-20120326.jar');
            javaaddpath('poi_library/xmlbeans-2.3.0.jar');
            javaaddpath('poi_library/dom4j-1.6.1.jar');
            javaaddpath('poi_library/stax-api-1.0.1.jar');
            
        end
        
        function errorMessage(message)
            
            messageStruct.Interpreter = 'tex';
            messageStruct.WindowStyle = 'modal';
            message = msgbox(message, 'Error', 'error', messageStruct);
            
        end
        
        function value = isTextFieldValid(textFieldHandle, labelHandle)
            
            % is it blank?
            textFieldValue = strtrim(get(textFieldHandle, 'String'));
            if isempty(textFieldValue) 
                
                set(labelHandle,'ForegroundColor','red');
                labelText = get(labelHandle, 'String');
                GuiHelpers.errorMessage(strcat(labelText, ' cannot be blank.'));
                value = false;
            
            % does it contain more than just digt characters?
            elseif isempty(regexp(textFieldValue, '(?<=^| )\d+(\.\d+)?(?=$| )|(?<=^| )\.\d+(?=$| )'))
                
                set(labelHandle,'ForegroundColor','red');
                labelText = get(labelHandle, 'String');
                GuiHelpers.errorMessage(strcat(labelText, ' values must be numeric.'));
                value = false;
                
            else
                
                set(labelHandle,'ForegroundColor','black');
                value = true;
                
            end
        end
        
        function resetLabelForegroundColors(labelHandles)
            arrayfun(@(labelHandle) set(labelHandle,'ForegroundColor','black'), labelHandles);
        end
        
    end
    
end
