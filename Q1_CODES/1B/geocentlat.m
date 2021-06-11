function[lat] = geocentlat(e2,latitude)
%e2 =  0.006739497;
%e1 = 0.006694380;
%a = 6378137;

%Question_1_b

%Melih Altay

%lat1 = 39.8871773769508;
%lat2 = 24.5519645570396;
%lat3 = 41.104584013637;
%lat4 = -51.6936409211416;
%lat5 = 40.9947048678231;
%lat6 = -17.7439747086851;


Y = atand((1/1+e2^2)*tand(latitude));

lat = Y;

 

