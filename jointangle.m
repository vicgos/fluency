%function to calculate angle between two 3D vectors defined by three markers
%proximal marker-mid marker, mid marker-distal marker
%returns column vector of approximate joint angle in degrees and plot vs
%time
%Requires arrays containing the three components (x,y,z) of the position of the
%markers of interest

function jangle = jointangle(proxmarker,midmarker,distmarker) 

proxsegment = proxmarker-midmarker; %defining proximal and distal segments
distsegment = midmarker-distmarker;

jangle = atan2(sqrt(sum((cross(proxsegment,distsegment,2)).^2,2)),dot(proxsegment,distsegment,2)); %calculating angle in radians
jangle = radtodeg(jangle); %converting radians to degrees


duration = length(proxmarker)/200;

timevector = linspace(0,duration,length(proxmarker))';

plot(timevector,jangle);
set(gca,'FontSize',18)
xlabel('Time (s)','FontSize', 24)
ylabel('Angle (deg)','FontSize', 24)
grid






