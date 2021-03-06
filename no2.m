function varargout = no2(varargin)
% NO2 MATLAB code for no2.fig
%      NO2, by itself, creates a new NO2 or raises the existing
%      singleton*.
%
%      H = NO2 returns the handle to a new NO2 or the handle to
%      the existing singleton*.
%
%      NO2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NO2.M with the given input arguments.
%
%      NO2('Property','Value',...) creates a new NO2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before no2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to no2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help no2

% Last Modified by GUIDE v2.5 18-May-2022 13:15:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @no2_OpeningFcn, ...
                   'gui_OutputFcn',  @no2_OutputFcn, ...
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


% --- Executes just before no2 is made visible.
function no2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to no2 (see VARARGIN)

% Choose default command line output for no2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes no2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = no2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btRead_093.
function btRead_093_Callback(hObject, eventdata, handles)
% hObject    handle to btRead_093 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = 'Dataset Hostel Jepang.xlsx';
price = xlsread(filename, 'D2:D51');
distance = xlsread(filename, 'E2:E51');
clean = xlsread(filename, 'I2:I51');
value = xlsread(filename, 'N2:N51');
dataset = [price distance clean value];

set(handles.uitable1_093, 'Data', dataset, 'ColumnName', {'Price', 'Distance from city center', 'Cleanliness', 'Value for money'});

% --- Executes on button press in btHasil_093.
function btHasil_093_Callback(hObject, eventdata, handles)
% hObject    handle to btHasil_093 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = 'Dataset Hostel Jepang.xlsx';
hostel = xlsread(filename, 'B2:B51');
price = xlsread(filename, 'D2:D51');
distance = xlsread(filename, 'E2:E51');
clean = xlsread(filename, 'I2:I51');
value = xlsread(filename, 'N2:N51');

x = [price distance clean value];
k = [0 0 1 1];
w = [1 4 2 3];

[m n] = size(x);
w = w./sum(w);

for j=1:n, 
    if k(j)==0, w(j)=-1*w(j); 
    end; 
end;
for i=1:m, 
    S(i)=prod(x(i,:).^w); 
end;

V= S/sum(S)
V = V.';
dataset = [price distance clean value V];
sort = sortrows(dataset, 5, 'descend');
set(handles.uitable2_093, 'Data', sort, 'ColumnName', {'Price', 'Distance from city center', 'Cleanliness', 'Value for money', 'Score'});
%gatau nampilin hostel name nya :(