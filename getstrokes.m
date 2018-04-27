% Identification of starting point of individual drumming strokes/cello bowing from velocity profiles


function [pks,locs,strokes,stroketimes,T] = getstrokes(V,sampf,height,pkdur)

if nargin == 0
    disp('Error! Input the movement speed profile.');
    fprintf('\n');
    help('getstrokes');
    return;
    
elseif nargin == 1
    % Default parameters are used for the segmentation of the speed profile.
    sampf = 200;   

elseif nargin == 2
    % Default parameters are used for the segmentation of the speed profile.
    height = 1350;   
    
elseif nargin == 3
    % Default parameters are used for the segmentation of the speed profile.
    pkdur = 0.15; 
end;


Duration = length(V)/sampf;   
T = linspace(0,Duration,length(V))';   %Obtaining time vector


[pks,locs] = findpeaks(V,T,'MinPeakHeight', height,'MinPeakDistance',pkdur);    %Identifying impacts

[~,locsidx] = ismember(locs,T);

[~,pksidx] = ismember(pks,V);            

for k1 = 1:length(pksidx)-1                                   %Segmenting velocity profile into strokes from the identified impacts and obtaining time vectors for each stroke
   
    strokes{k1} = V(pksidx(k1):pksidx(k1+1));
    stroketimes{k1} = T(locsidx(k1):locsidx(k1+1));
    
end

for i=1:length(pksidx)-1                                        %Ploting segmented velocity profile 
    
plot(stroketimes{i},strokes{i})

hold on
end


