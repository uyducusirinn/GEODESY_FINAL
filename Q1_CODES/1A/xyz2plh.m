function [ellp]=xyz2plh(cart)
%DESCRIPTION:
% =========================================================================
%   This function will convert Cartesian coordinates to Geodetic 
%   Coordinates
%
%ARGUMENTS:
% =========================================================================
%   cart (3x1) – Station Cartesian Coordinates  
%
%OUTPUT: 
% =========================================================================
%   [ellp] = Lambda(degree), Phi(degree) and H(height meters) in matrix (3x1)
%
%CREATED BY:
% =========================================================================
%   Melih ALTAY   School_ID: 21732824  X=8 Y=2 Z=4

%QUESTION_1

%cartAnk= [4121988.47632;  2652187.89675;  4069023.78398]; %Ankara
%cartChn= [827227.18610; -5745221.95127; 2633858.11818]; %CHINA
%cartIst =[4208830.22229; 2334850.33116; 4171287.31457]; %IST
%cartFalk =[2106811.34753; -3355170.67125; -4981784.31433]; %FALK
%cartTrab = [3705250.25293; 3084422.76310; 4162044.82388];%Trab
%cartVanu = [-5950766.48044; 1230703.93246; -1931444.98664]; %Vanu

x=cart(1,1);
y=cart(2,1);
z=cart(3,1); 
% GRS80 Equatorial radius of the Earth
a = 6378137.0000; %semi major axis
b = 6356752.31414; %semi minor axis
e = sqrt((a^2-b^2)/(a^2)); % first eccentricity

p = sqrt(x^2+y^2);
longitude = atan2(y,x) ; %longitude

latitude_0 = atan2(z,p*(1-(e^2)));
h=0;
%iterative solution for the phi and h.
while 1
    %radius of curvature in the prime vertical
    N = ((a^2)/(sqrt((a^2*(cos(latitude_0)^2))+(b^2*(sin(latitude_0)^2)))));
    h = (p/cos(latitude_0)) - N ;
    %latitude
    latitude_1 = atan2(z,p*(1-((e^2)*(N/(N+h)))));
       
    k = abs(latitude_1 - latitude_0);
    
    if k<1*10^-12 %as the threshold to end the iterations, where k
                  %is the ellipsoidal latitude at iteration number k.
        latitude = latitude_1;
        
        break
    else
        latitude_0 = latitude_1;
    end
end

% It convert in degree.
latitude=latitude*180/pi;   %in degree
longitude=longitude*180/pi; %in degree

ellp=[latitude;longitude;h]; %display ellipsoidal coordinate
end





