%Function that calculates dimensionless normalized jerk metric (DLNJm) by fitting
%functions to marker raw data

function [DLNJm,MeanSpeed] = DLNJm(time,position)

%Fitting a curve to the position time series

fxposition = fit(time,position(:,1),'fourier8');
fyposition = fit(time,position(:,2),'fourier8');
fzposition = fit(time,position(:,3),'fourier8');

%Calculating velocity and acceleration for every dimension
[Vx,Ax] = differentiate(fxposition,time);
[Vy,Ay] = differentiate(fyposition,time);
[Vz,Az] = differentiate(fzposition,time);

%Fitting a curve to the acceleration vector

 Axfit = fit(time,Ax,'fourier8');
 Ayfit = fit(time,Ay,'fourier8');
 Azfit = fit(time,Az,'fourier8');

 
 %Calculating jerk
 Jx = differentiate(Axfit,time);
 Jy = differentiate(Ayfit,time);
 Jz = differentiate(Azfit,time);
 
 
 %Calculating squared jerk
 SJx = Jx.^2;
 SJy = Jy.^2;
 SJz = Jz.^2;
 
 %Fitting a curve to the squared jerk vector
 SJxfit = fit(time,SJx,'smoothingspline');
 SJyfit = fit(time,SJy,'smoothingspline');
 SJzfit = fit(time,SJz,'smoothingspline');
 
 %Integrated squared jerk -> Jerk Cost
 JerkCost = trapz(SJx + SJy + SJz);
 
 %Duration and mean speed
 Duration = time;
 VelMagnitude = sqrt(Vx.^2+Vy.^2+Vz.^2);
 MeanSpeed = mean(VelMagnitude);
 
 %Dimensionless Normalized Jerk metric (DLNJm)
 DLNJm = (JerkCost)*((Duration.^3)/(MeanSpeed.^2));

