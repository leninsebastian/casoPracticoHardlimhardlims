function varargout = Pruebahardlim(varargin)
% PRUEBAHARDLIM MATLAB code for Pruebahardlim.fig
%      PRUEBAHARDLIM, by itself, creates a new PRUEBAHARDLIM or raises the existing
%      singleton*.
%
%      H = PRUEBAHARDLIM returns the handle to a new PRUEBAHARDLIM or the handle to
%      the existing singleton*.
%
%      PRUEBAHARDLIM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRUEBAHARDLIM.M with the given input arguments.
%
%      PRUEBAHARDLIM('Property','Value',...) creates a new PRUEBAHARDLIM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Pruebahardlim_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Pruebahardlim_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Pruebahardlim

% Last Modified by GUIDE v2.5 03-Nov-2014 15:14:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Pruebahardlim_OpeningFcn, ...
                   'gui_OutputFcn',  @Pruebahardlim_OutputFcn, ...
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


% --- Executes just before Pruebahardlim is made visible.
function Pruebahardlim_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Pruebahardlim (see VARARGIN)



% Choose default command line output for Pruebahardlim
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Pruebahardlim wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Pruebahardlim_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
aux = str2double(get(handles.x1,'string'));
aux2 = str2double(get(handles.x2,'string'));

P=[1 1 0 0; 1 0 1 0];
T=[1 0 1 0];
plotpv(P, T);
%net = newff([0 1;0 1],[1 1],{'hardlim' 'hardlim'} );
net = newp([0 1;0 1],1);
%net.iw{1,1}=[-0.8958 1.0759];
%net.b{1}=-0.0901;

pesos = net.iw{1,1};
bias = net.b{1};
net = train(net,P,T);
pesos = net.iw{1,1};
bias = net.b{1};
plotpc(pesos,bias);
en = [aux;aux2];
y = sim(net,en);
if y == 1
    set(handles.res,'String','DOCENTE')
else
    set(handles.res,'String','ESTUDIANTE')
end
plotpv(en,y);
hold on;
point = findobj(gca,'type','line');
set(point,'Color','red');
plotpv(P,T);
plotpc(pesos,bias);
hold off;



function x1_Callback(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1 as text
%        str2double(get(hObject,'String')) returns contents of x1 as a double


% --- Executes during object creation, after setting all properties.
function x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2_Callback(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2 as text
%        str2double(get(hObject,'String')) returns contents of x2 as a double


% --- Executes during object creation, after setting all properties.
function x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function res_Callback(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of res as text
%        str2double(get(hObject,'String')) returns contents of res as a double


% --- Executes during object creation, after setting all properties.
function res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton2.
function boton2_Callback(hObject, eventdata, handles)
% hObject    handle to boton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
