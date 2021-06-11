function [q] = isomet(latitude)

%Question_1_b
%lat1 = 39.8871773769508*(pi/180);
%lat2 = 24.5519645570396*(pi/180);
%lat3 = 41.104584013637*(pi/180);
%lat4 = -51.6936409211416*(pi/180);
%lat5 = 40.9947048678231*(pi/180);
%lat6 = -17.7439747086851*(pi/180);

e =  0.006694380;  %First eccentricity  GRS80 parameters

%q = log(tand(latitude/2 + pi/4) -(e^2)*sind(latitude)-(e^4/3) * (sind(latitude)^3) - (e^6/5)*(sind(latitude)^5) - (e^8/7)*(sind(latitude)^7));

x = tan(latitude/2 + pi/4)
y = ((1-e*sin(latitude) / (1+e*sin(latitude)))^(e/2))

q = log(x*y)*(180/pi)







