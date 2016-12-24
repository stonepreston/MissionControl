%%%%%%%%%%%%%%%%%%%%%%
% THIS FILE IS NOT USED. IT IS JUST HERE BECAUSE IT HAS TO BE IN ORDER FOR
% THE VIEW TO GET BUILT
%%%%%%%%%%%%%%%%%%%%%%

function varargout = ExportGUI(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ExportGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ExportGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ExportGUI is made visible.
function ExportGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ExportGUI (see VARARGIN)

% Choose default command line output for ExportGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ExportGUI wait for user response (see UIRESUME)
% uiwait(handles.guiExport);


% --- Outputs from this function are returned to the command line.
function varargout = ExportGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editFileName_Callback(hObject, eventdata, handles)
% hObject    handle to editFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFileName as text
%        str2double(get(hObject,'String')) returns contents of editFileName as a double


% --- Executes during object creation, after setting all properties.
function editFileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkboxIncludeColumnHeaders.
function checkboxIncludeColumnHeaders_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxIncludeColumnHeaders (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxIncludeColumnHeaders


% --- Executes on button press in buttonOK.
function buttonOK_Callback(hObject, eventdata, handles)

% check if we need to include column headers

if get(handles.checkboxIncludeColumnHeaders, 'Value') == 0
   
    % we need to remove the top row of the export data to get rid of the
    % headers. 
    handles.exportData(1, :) = [];
    
end

filename = get(handles.editFileName, 'String');
sheetName = get(handles.editSheetName, 'String');
startRange = get(handles.editStartRange, 'String');
xlwrite(filename, handles.exportData, sheetName, startRange);
close(handles.guiExport);



function editSheetName_Callback(hObject, eventdata, handles)
% hObject    handle to editSheetName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSheetName as text
%        str2double(get(hObject,'String')) returns contents of editSheetName as a double


% --- Executes during object creation, after setting all properties.
function editSheetName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSheetName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editStartRange_Callback(hObject, eventdata, handles)
% hObject    handle to editStartRange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editStartRange as text
%        str2double(get(hObject,'String')) returns contents of editStartRange as a double


% --- Executes during object creation, after setting all properties.
function editStartRange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editStartRange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
