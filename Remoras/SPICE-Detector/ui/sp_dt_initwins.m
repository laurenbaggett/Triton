function sp_dt_initwins
%
% sp_dt_initwins.m
% 
% initialize detector options window
%
global PARAMS REMORA

% window placement & size on screen
defaultPos = [0.005,0.035,0.2,0.25];
% open and setup figure window
REMORA.fig.spice_dt = figure( ...
    'NumberTitle','off', ...
    'Name','Spice Detector Control - Remora v1.0',...
    'Units','normalized',...
    'MenuBar','none',...
    'Position',defaultPos, ...
    'Visible', 'off');