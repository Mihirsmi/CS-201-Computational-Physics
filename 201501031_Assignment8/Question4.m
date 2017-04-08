clc;
clear all;
close all;

global R C L E f w;
R = 0.2;
C = 1;
L = 1;
E = 1;
f = 6;
w = 2*pi*f;

simulation_time = 80;

initial_charge = 0;
initial_current = 0;
initial_mat = [initial_charge initial_current];

[t, charge_current] = ode45(@rhs4, [0:0.01:simulation_time], initial_mat);

plot(t, charge_current(:, 1));
title('Charge in circuit vs time');
xlabel('Time(seconds)');
ylabel('Charge(Coulombs)');
grid();
figure();

plot(t, charge_current(:, 2));
title('Current in circuit vs time');
xlabel('Time(seconds)');
ylabel('Current(Amperes)');
grid();
