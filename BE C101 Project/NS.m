function dvdt = NS(t,v) %Navier Stokes equation, solve with method of lines
%% parameters
psi = 0; %LFA orientation (angle of incline)
mu = 0.001; %viscosity (poise)
rho = 1000; %density (kg/m^3)
R = 0.001; %radius of tube (m) (should be um but higher for visualization)
length = 0.018; %length (m) from sample pad to end of test line
height=0.01; %height of sample solution (m)
gamma = 0.07; %surface tension (N/m)
theta = 26; %contact angle
g = -9.81; %gravitational constant (m/s^2)

%% set up
N=10; %number of nodes
h=R/(N-1); %step size (delta r)
dvdt = zeros(size(v)); % initialize function output

%% calculations
dPdz = -(rho*g*(height-length*sind(psi))+2*gamma*cosd(theta)/R)/length; %change pressure wrt z

for i=2:N %
    dvdr(i) = (v(i+1) - v(i-1)) / (2*h); %1st centered finite-divided-difference
    d2vdr2(i) = (v(i+1) - 2*v(i) + v(i-1)) / (h^2); %2nd centered finite-divided-difference
    dvdt(i) = g*sind(psi) - dPdz/rho + (mu/rho)*d2vdr2(i) + mu/(rho*(i-1)*h)*dvdr(i); %Navier-Stokes eqn w/ assumptions
end

dvdt(1)=dvdt(2); %v(1)=v(2) 
dvdt(N+1) = 0; % v(N+1)=0