function[p,z] = parametric(e1,e2,a,latitude)



%e2 =  0.006739497;
%e1 = 0.006694380;
%a = 6378137;


%lat1 = 39.8871773769508;
%lat2 = 24.5519645570396;
%lat3 = 41.104584013637;
%lat4 = -51.6936409211416;
%lat5 = 40.9947048678231;
%lat6 = -17.7439747086851;


c = a / (sqrt(1-e1));
V = sqrt(1+e2*cosd(latitude)*cosd(latitude));
W = sqrt(1-e1*sind(latitude)*sind(latitude));
N = c/V;   %N = a/W


p = N*cosd(latitude);
z = (N / (1+e2)) * sind(latitude);

