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
                
                % display an error message
                messageStruct.Interpreter = 'tex';
                messageStruct.WindowStyle = 'modal';
                
                if strcmp(e.identifier, 'MATLAB:catenate:dimensionMismatch')
                    
                    message = msgbox('There is no data to export', 'Error', 'error', messageStruct);
                    
                else
                    
                    message = msgbox('An error occurred', 'Error', 'error', messageStruct);
                    
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
        
    end
    
end
