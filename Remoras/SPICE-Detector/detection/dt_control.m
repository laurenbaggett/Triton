function dt_control(action)
global REMORA PARAMS HANDLES

if strcmp(action, '')

% Set RL threshold for detector
elseif strcmp(action,'setPPThreshold')
    valueDBpp = str2double(get(REMORA.spice_dt.PPThresholdEdTxt,'String'));
    REMORA.spice_dt.detParams.dBppThreshold = max(valueDBpp,1);
%     REMORA.spice_dt.params.Ranges(REMORA.spice_dt.params.ClickPos,1) = ...
%         dt_verifyRange('Min Broadband freq', 0, PARAMS.fmax, ValueHz, 0, ...
%         REMORA.dt.MinBBFreqEdtxt);
%               
% Set minimum click duration for detector  
elseif strcmp(action,'SetMinClickDur')
    valueMuSec = str2double(get(REMORA.spice_dt.MinClickDurEdText,'String'));
    REMORA.spice_dt.detParams.delphClickDurLims(1,1) = max(valueMuSec,0);
    
% Set maximum click duration for detector
elseif strcmp(action,'SetMaxClickDur')
    valueMuSec = str2double(get(REMORA.spice_dt.MaxClickDurEdText,'String'));
    REMORA.spice_dt.detParams.delphClickDurLims(1,2) = max(valueMuSec,0);
    
% Set low end of bandpass filter 
elseif strcmp(action,'SetMinBandpass')
    valuekHz = str2double(get(REMORA.spice_dt.MinBandPassEdText,'String'));
    REMORA.spice_dt.detParams.bpRanges(1,1) = max(valuekHz,0);
    REMORA.spice_dt.detParams.rebuildFilter = 1;
    
% Set high end of bandpass filter 
elseif strcmp(action,'SetMaxBandpass')
    valuekHz = str2double(get(REMORA.spice_dt.MaxBandPassEdText,'String'));
    REMORA.spice_dt.detParams.bpRanges(1,2) = max(valuekHz,0); 
    REMORA.spice_dt.detParams.rebuildFilter = 1;

% Set minimum click peak frequency for detector
elseif strcmp(action,'SetMinPeakFreq')
    valueKHz = str2double(get(REMORA.spice_dt.MinPeakFreqEdTxt,'String'));
    REMORA.spice_dt.detParams.cutPeakBelowKHz = max(valueKHz,0);

% Set minimum click peak frequency for detector
elseif strcmp(action,'SetMaxPeakFreq')
    valueKHz = str2double(get(REMORA.spice_dt.MaxPeakFreqEdTxt,'String'));
    REMORA.spice_dt.detParams.cutPeakAbovewKHz = max(valueKHz,0);
    
% Set maximum click peak frequency for detector
elseif strcmp(action,'SetMinEnvRatio')
    valueERatio = str2double(get(REMORA.spice_dt.MinEvEdTxt,'String'));
    REMORA.spice_dt.detParams.dEvLims(1) = max(valueERatio,-1);
    
% Set maximum click peak frequency for detector
elseif strcmp(action,'SetMaxEnvRatio')
    valueERatio = str2double(get(REMORA.spice_dt.MaxEvEdTxt,'String'));
    REMORA.spice_dt.detParams.dEvLims(2) = min(valueERatio,1);
    
% Set maximum saturation of click detections 
elseif strcmp(action,'SetClipThreshold')
    maxSaturationRatio = str2double(get(REMORA.spice_dt.clipThresholdEdTxt, 'string'));
    REMORA.spice_dt.detParams.clipThreshold = max(min(maxSaturationRatio,1),0);
end
end
