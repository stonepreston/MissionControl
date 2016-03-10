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

% Update handles structure
guidata(hObject, handles);

% Instantiate a launcher object with zeroed property values
launcher = Launcher(0,0,0,0);

% Instantiate a simulation object
simulation = LaunchSimulation(launcher);

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

% Set the launcher data
simulation.launcher.springConstant = get(handles.editSpringConstant, 'String');
simulation.launcher.projectileMass = get(handles.editProjectileMass, 'String');
simulation.launcher.launchVelocity = get(handles.editLaunchVelocity, 'String');
simulation.launcher.angle = get(handles.editLaunchAngle, 'String');

disp(simulation.launcher)

% Construct data matrix for table using simulation object
tableData = {simulation.launcher.springDisplacement ...
            simulation.horizontalRange              ...
            simulation.verticalRange                ...
            simulation.timeOfFlight};
 
 % Set the data of the table
 set(handles.tableSimulationData, 'Data', tableData);
