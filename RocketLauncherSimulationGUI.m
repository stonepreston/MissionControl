function varargout = RocketLauncherSimulationGUI(varargin)


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RocketLauncherSimulationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @RocketLauncherSimulationGUI_OutputFcn, ...
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


% --- Executes just before RocketLauncherSimulationGUI is made visible.
function RocketLauncherSimulationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RocketLauncherSimulationGUI (see VARARGIN)

% Choose default command line output for RocketLauncherSimulationGUI
handles.output = hObject;

% Instantiate a launcher object with zeroed property values
launcher = Launcher(0,0,0,0);

% Instantiate a simulation object
simulation = LaunchSimulation(launcher);

% add simulation to handles structure
handles.simulation = simulation;

% add labels to axes
axes(handles.axesVerticalVsHorizontalPosition);
xlabel('Horizontal Position (m)');
ylabel('Vertical Position (m)');


% Update handles structure
guidata(hObject, handles);

% set initial data for tables
simulationTableData = {'' '' '' ''};
 
set(handles.tableSimulationData, 'Data', simulationTableData);

angles = [0;15;30;45;60;75;90];

angleTableData = [angles; []; []; []];

set(handles.tableAngles, 'Data', angleTableData);

predictionTableData = [angles; [];];

set(handles.tablePredictions, 'Data', predictionTableData);


% UIWAIT makes RocketLauncherSimulationGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RocketLauncherSimulationGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function editSpringConstant_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editSpringConstant_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editProjectileMass_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function editProjectileMass_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editLaunchVelocity_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editLaunchVelocity_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editLaunchAngle_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editLaunchAngle_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonSimulate.
function buttonSimulate_Callback(hObject, eventdata, handles)
% hObject    handle to buttonSimulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% check to make sure values were input for launch velocity and launch angle
if isempty(get(handles.editLaunchVelocity, 'String')) || isempty(get(handles.editLaunchAngle, 'String'))
    
    % display an error message
    messageStruct.Interpreter = 'tex';
    messageStruct.WindowStyle = 'modal';
    message = msgbox('You must provide a launch velocity and launch angle', 'Error', 'error', messageStruct);
    
else
    
     % Check to see if any of the launcher settings are empty:
    if isempty(get(handles.editSpringConstant, 'String')) || isempty(get(handles.editProjectileMass, 'String'))

        % display an error message
        messageStruct.Interpreter = 'tex';
        messageStruct.WindowStyle = 'modal';
        message = msgbox('You must provide values for all launcher settings', 'Error', 'error', messageStruct);
    else
        
        % clear the axes
        cla(handles.axesVerticalVsHorizontalPosition);
        % Set the launcher data
        handles.simulation.launcher.springConstant = str2num(get(handles.editSpringConstant, 'String'));
        handles.simulation.launcher.projectileMass = str2num(get(handles.editProjectileMass, 'String'));
        handles.simulation.launcher.launchVelocity = str2num(get(handles.editLaunchVelocity, 'String'));
        handles.simulation.launcher.launchAngle = str2num(get(handles.editLaunchAngle, 'String'));

        % Construct data array for table using simulation object
        tableData = {handles.simulation.launcher.springDisplacement ...
                     handles.simulation.horizontalRange              ...
                     handles.simulation.verticalRange                ...
                     handles.simulation.timeOfFlight};

        % Set the data of the table
        set(handles.tableSimulationData, 'Data', tableData);

        % plot the graphs
        DataDisplayer.plotVerticalVsHorizontalPosition(handles.simulation, handles.axesVerticalVsHorizontalPosition);
        
    end
    
end

function editTargetDistance_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editTargetDistance_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonCalculate.
function buttonCalculate_Callback(hObject, eventdata, handles)

% check to make sure a value was input in the target distance field
if isempty(get(handles.editTargetDistance, 'String'))
    
    % display an error message
    messageStruct.Interpreter = 'tex';
    messageStruct.WindowStyle = 'modal';
    message = msgbox('You must provide a target distance', 'Error', 'error', messageStruct);
    
else
   
    % Check to see if any of the launcher settings are empty:
    if isempty(get(handles.editSpringConstant, 'String')) || isempty(get(handles.editProjectileMass, 'String'))

        % display an error message
        messageStruct.Interpreter = 'tex';
        messageStruct.WindowStyle = 'modal';
        message = msgbox('You must provide values for all launcher settings', 'Error', 'error', messageStruct);
    else
        
        range = str2num(get(handles.editTargetDistance, 'String'));
        simulation = handles.simulation;

        % Set the launcher data
        handles.simulation.launcher.springConstant = str2num(get(handles.editSpringConstant, 'String'));
        handles.simulation.launcher.projectileMass = str2num(get(handles.editProjectileMass, 'String'));


        tableData = simulation.getPredictionData(range);

        % Set the data of the table
        set(handles.tablePredictions, 'Data', tableData);

    end
    
end

function editAngleTableVelocity_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function editAngleTableVelocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAngleTableVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in buttonGenerateTable.
function buttonGenerateTable_Callback(hObject, eventdata, handles)

% check to see if the user entered a velocity
if isempty(get(handles.editAngleTableVelocity, 'String')) 
    
    % display an error message
    messageStruct.Interpreter = 'tex';
    messageStruct.WindowStyle = 'modal';
    message = msgbox('You must provide a launch velocity', 'Error', 'error', messageStruct);
    
else
    
      % Check to see if any of the launcher settings are empty:
    if isempty(get(handles.editSpringConstant, 'String')) || isempty(get(handles.editProjectileMass, 'String'))

        % display an error message
        messageStruct.Interpreter = 'tex';
        messageStruct.WindowStyle = 'modal';
        message = msgbox('You must provide values for all launcher settings', 'Error', 'error', messageStruct);
    else
        
        velocity = str2num(get(handles.editAngleTableVelocity, 'String'));
        simulation = handles.simulation;
        tableData = simulation.getAngleData(velocity);

        % Set the data of the table
        set(handles.tableAngles, 'Data', tableData);

    end
    
end
