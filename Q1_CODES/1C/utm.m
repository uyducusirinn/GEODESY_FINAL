function[con,diff] = utm(e1,e2,a,L,latitude)

%Question_1_c
%Melih Altay


%e2 =  0.006739497;
%e1 = 0.006694380;
a = 6378137;
%b = = 6356752.31414;

% n = f / (2-f)  %second flattening
% n = 0.001 679 220 395

%e1 = 2f-f^2; 
%e1 = 0.006694380023

%e2 = e1^2 / (1-e^2)
%e2 =  0.006739496775
%c = a / sqrt(1-e1);
c =  6399593.62586;

t = tan(latitude);
nu = e2*cos(latitude)*cos(latitude);
V = sqrt(1+nu);

N = c/V ;

%Projection equation coefficients (?0 = ?):

a1 = N*cos(latitude);
a2 = -1/2*N*cos(latitude)*cos(latitude)*t;
a3 = -1/6*N*(cos(latitude)*cos(latitude)*cos(latitude))*(1-t^2+nu);
a4 = 1/24*N*(cos(latitude)*cos(latitude)*cos(latitude)*cos(latitude))*t*(5-t^2*+9*nu + 4*nu^2);
a5 = 1/120*N*(cos(latitude)*cos(latitude)*cos(latitude)*cos(latitude)*cos(latitude))*(5-18*t^2 + t^4);


B = atand((1 / sqrt(1+e2))*tand(latitude));
Y = atand((1/1+e2^2)*tand(latitude));

G = a*latitude - B*sin(2*latitude) + Y*sin(4*latitude);
X = G - a2*L^2 + a4*L^4
Y = a1*L - a3*L^3 + a5*L^5

%Meridian convergence angle and differential scale

convergence = sin(latitude) * L + 1/3*sin(latitude)*cos(latitude)*cos(latitude)*(1+3*nu^2)*L^3;


%differential = 1 + 1/2*(cos(latitude)*cos(latitude))*(1+nu)*L^2 + 1/24*(cos(latitude)*cos(latitude)*cos(latitude)*cos(latitude))*(5-4*t^2+14*nu-28*nu*t^2)*L^4;
x = 1+ 1/2*(cosd(latitude)*cosd(latitude)*(1+nu))*L^2;
y = 1/24*(cosd(latitude)^4)*(5-4*t^2 + 14*nu - 28*nu*t^2)*L^4;

differential = x+y;

con = convergence;
diff = differential;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








