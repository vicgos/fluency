
function getstrokes = strokes(V,sampf,height,length)

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
    length = 0.15; 
end;


Duration = length(V)/sampf;
T = linspace(0,Duration,length(V))';


[pks,locs] = findpeaks(V,T,'MinPeakHeight', height,'MinPeakDistance',length);

[~,locsidx] = ismember(locs,T);

[~,pksidx] = ismember(pks,V);

for k1 = 1:length(pksidx)-1
   
    stroke{k1} = V(pksidx(k1):pksidx(k1+1));
    
end

for j1 = 1:length(locsidx)-1
   
    stroketime{j1} = T(locsidx(k1):locsidx(k1+1));
    
end

