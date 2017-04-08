clear all;
close all;
clc;

% Siulation Time
simulation_time = 3;


global C R applied_external_voltage maximum_charge;

% Applied Voltage
applied_external_voltage = 10;


% Capacitance 
C = 1e-2;

% Resistance 
R = 50;

% Maximum Charge on capacitor
maximum_charge = C / applied_external_voltage;

initial_charge = 0;

[t, charge] = ode45(@rhs1a, [0:0.01:simulation_time], initial_charge);
plot(t, charge(:, 1))
title('Charge on Capacitor vs Time');
xlabel('Time(seconds)');
ylabel('Charge(coulombs)');
grid();
figure();

voltage_on_capacitor = charge ./ C;
plot(t, voltage_on_capacitor)
title('Voltage on Capacitor vs Time');
xlabel('Time(seconds)');
ylabel('Voltage(volts)');
grid();
figure();

current = (applied_external_voltage - voltage_on_capacitor) ./ R;
plot(t, current)
title('Current vs Time');
xlabel('Time(seconds)');
ylabel('Current(amperes)');
grid();
