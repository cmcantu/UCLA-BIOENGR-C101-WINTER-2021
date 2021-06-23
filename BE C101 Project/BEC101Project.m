%BE C101 Project

%Cassandra Cantu
%UID: 305-100-205
%W21

%clear command window
clc; close all; clear;

%% Set up
v0=zeros(1,9); %empty array for velocity
v0(1,101) = 0; %initial velocity
tspan = [0 1]; % vector with initial time 0 s to 1 s

%% solve Navier Stokes Eqn with ode45 method
    [t,v] = ode45('NS',tspan, v0);
    
%% Display output v(t) vs (t)
figure(1)
v1 = plot(t, v(:,1),'DisplayName', 'Velocity at r=0', 'LineWidth', 2);hold on
v2 = plot(t, v(:,2),'DisplayName', 'Velocity at r=\Deltar', 'LineWidth', 2);
v3 = plot(t, v(:,3),'DisplayName', 'Velocity at r=2\Deltar', 'LineWidth', 2);
v4 = plot(t, v(:,4),'DisplayName', 'Velocity at r=3\Deltar', 'LineWidth', 2);
v5 = plot(t, v(:,5),'DisplayName', 'Velocity at r=4\Deltar', 'LineWidth', 2);
v6 = plot(t, v(:,6),'DisplayName', 'Velocity at r=5\Deltar', 'LineWidth', 2);
v7 = plot(t, v(:,7),'DisplayName', 'Velocity at r=6\Deltar', 'LineWidth', 2);
v8 = plot(t, v(:,8),'DisplayName', 'Velocity at r=7\Deltar', 'LineWidth', 2);
v9 = plot(t, v(:,9),'DisplayName', 'Velocity at r=8\Deltar', 'LineWidth', 2);
v10 = plot(t, v(:,10),'DisplayName', 'Velocity at r=9\Deltar', 'LineWidth', 2);
v11 = plot(t, v(:,11),'DisplayName', 'Velocity at r=R', 'LineWidth', 2);
title('Fluid flow velocity over time using Navier-Stokes', 'Fontsize', 22)
xlabel('Time [s]', 'FontSize', 20)
ylabel('Velocity [m/s]','FontSize', 20)
xlim([0, 1])

%set (gcf, 'Position', [100 100 1500 750]) %display
set (gca, 'LineWidth', 1, 'FontSize', 9)
legend('Location', 'northwest')


