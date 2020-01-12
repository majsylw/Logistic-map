function varargout = log1(varargin)
% LOG1 MATLAB code for log1.fig
%      LOG1, by itself, creates a new LOG1 or raises the existing
%      singleton*.
%
%      H = LOG1 returns the handle to a new LOG1 or the handle to
%      the existing singleton*.
%
%      LOG1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOG1.M with the given input arguments.
%
%      LOG1('Property','Value',...) creates a new LOG1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before log1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to log1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help log1

% Last Modified by GUIDE v2.5 12-Jan-2020 20:45:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @log1_OpeningFcn, ...
                   'gui_OutputFcn',  @log1_OutputFcn, ...
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


% --- Executes just before log1 is made visible.
function log1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to log1 (see VARARGIN)

% Choose default command line output for log1
handles.output = hObject;
handles.suwak = 0;
handles.suwak2 = 0;
handles.suwak3 = 20;
x = zeros(1,handles.suwak3);
subplot(2,2,1)
plot( x, 'b*')
grid on
title('Discrete Logistic Equation')
xlabel('i')
ylabel('x_i')
axis([0 handles.suwak3 0 1.0])

for i = 2:20
    x(i) = 0*x(i-1)*(1-x(i-1));
end
arg = linspace(0,1, 20);
y = 0*arg.*(ones(1,20)-arg);
subplot(2,2,2)
plot(arg, y, 'b')
grid on
hold on
xlabel('x_i')
ylabel('x_{i+1}')
axis([0 1.0 0 1.0])

for i = 2:20
   subplot(2,2,2)
   plot( x(i-1)*ones(1,10), linspace(x(i-1),x(i), 10), 'k')
   subplot(2,2,2)
   plot( linspace(x(i-1),x(i), 10), x(i)*ones(1,10), 'k')
end
plot(arg, arg, 'r')
hold off

ind = 0:handles.suwak3-1;
ind = ind';
zz = x';

handles.uitable1 = uitable('Parent', handles.figure1, 'Position', [25 25 700 200]);
set(handles.uitable1,'Data',[ind zz],'Position',[20 20 220 250]);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes log1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = log1_OutputFcn(hObject, eventdata, handles) 
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
x = zeros(1,handles.suwak3);
x(1)=handles.suwak; 
a=handles.suwak2; 
for i = 2:handles.suwak3
    x(i) = a*x(i-1)*(1-x(i-1));
end
subplot(2,2,1)
plot( x, 'b*')
hold on
if( a < 3 && a > 1 && x(1) ~= 0)
    subplot(2,2,1)
    plot( ones(1,handles.suwak3)-1/a * ones(1,handles.suwak3), '--r')
end
hold off
grid on
title('Discrete Logistic Equation')
xlabel('i')
ylabel('x_i')
axis([0 handles.suwak3 0 1.0])

for i = 2:handles.suwak3
    x(i) = a*x(i-1)*(1-x(i-1));
end
arg = linspace(0,1,handles.suwak3);
y = a*arg.*(ones(1,handles.suwak3)-arg);
subplot(2,2,2)
plot(arg, y, 'b')
grid on
hold on
xlabel('x_i')
ylabel('x_{i+1}')
axis([0 1.0 0 1.0])

for i = 2:handles.suwak3
   subplot(2,2,2)
   plot( x(i-1)*ones(1,10), linspace(x(i-1),x(i), 10), 'k')
   subplot(2,2,2)
   plot(linspace(x(i-1),x(i), 10), x(i)*ones(1,10), 'k')
end
plot(arg,arg, 'r')
hold off

ind = 0:handles.suwak3-1;
ind = ind';
zz = x';

%handles.uitable1 = uitable('Parent', handles.figure1, 'Position', [25 25 700 200]);
set(handles.uitable1,'Data',[ind zz],'Position',[20 20 220 250]);
% Update handles structure
guidata(hObject, handles);

% --- Executes on slider movement.
function suwak_Callback(hObject, eventdata, handles)
% hObject    handle to suwak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.suwak=get(hObject,'Value');
set(handles.wartoscSuwaka,'String',get(hObject,'Value')); 
% Update handles structure
guidata(hObject, handles); 


% --- Executes during object creation, after setting all properties.
function suwak_CreateFcn(hObject, eventdata, handles)
% hObject    handle to suwak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function suwak2_Callback(hObject, eventdata, handles)
% hObject    handle to suwak2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.suwak2=get(hObject,'Value');
set(handles.wartoscSuwaka2,'String',get(hObject,'Value')); 
% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function suwak2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to suwak2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = zeros(1,handles.suwak3);
x(1)=handles.suwak; 
a=handles.suwak2; 
for i = 2:handles.suwak3
    x(i) = a*x(i-1)*(1-x(i-1));
end
subplot(2,2,1)
plot( x, '--b')
hold on
subplot(2,2,1)
plot( x, 'b*')
hold on
if( a < 3 && a > 1 && x(1) ~= 0)
    subplot(2,2,1)
    plot( ones(1,handles.suwak3)-1/a * ones(1,handles.suwak3), '--r')
end
grid on
title('Discrete Logistic Equation')
xlabel('i')
ylabel('x_i')
axis([0 handles.suwak3 0 1.0])
hold off

for i = 2:handles.suwak3
    x(i) = a*x(i-1)*(1-x(i-1));
end
arg = linspace(0,1,handles.suwak3);
y = a*arg.*(ones(1,handles.suwak3)-arg);
subplot(2,2,2)
plot( arg, y, 'b')
grid on
hold on
xlabel('x_i')
ylabel('x_{i+1}')
axis([0 1.0 0 1.0])

for i = 2:handles.suwak3
   subplot(2,2,2)
   plot( x(i-1)*ones(1,10), linspace(x(i-1),x(i), 10), 'k')
   subplot(2,2,2)
   plot( linspace(x(i-1),x(i), 10), x(i)*ones(1,10), 'k')
end
plot( arg,arg, 'r')
hold off

ind = 0:handles.suwak3-1;
ind = ind';
zz = x';

%handles.uitable1 = uitable('Parent', handles.figure1, 'Position', [25 25 700 200]);
set(handles.uitable1,'Data',[ind zz],'Position',[20 20 220 250]);
% Update handles structure
guidata(hObject, handles);

% --- Executes on slider movement.
function suwak3_Callback(hObject, eventdata, handles)
% hObject    handle to suwak3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(hObject, 'Value', round(get(hObject, 'Value')))

handles.suwak3=get(hObject,'Value');
set(handles.wartoscSuwaka3,'String',get(hObject,'Value')); 
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function suwak3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to suwak3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, ~, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
subplot(2,1,1)
N = 1000;
r = linspace(0,4,N);
xx = rand(1,N);

numIterations = 1000;
for n=1:numIterations
    xx = r.*xx.*(1-xx);
end
plot(r,xx,'.');
xlabel('a')
ylabel('x')
