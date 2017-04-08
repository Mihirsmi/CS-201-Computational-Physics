clear all;
close all;
clc;

simulation_time = 300;


global L C R;
L = 5;
C = 5;
R = 10;

initial_charge = 5;
initial_voltage = initial_charge / C;
initial_voltage_change = 0;
initial_matrix = [initial_voltage, initial_voltage_change];

% Capacitor Voltage
[t, capacitor_voltage] = ode45(@rhs3b, [0:0.01:simulation_time], initial_matrix);

voltage_on_capacitor = capacitor_voltage(:, 1);

plot(t, voltage_on_capacitor);
title('Capacitor Voltage vs Time');
xlabel('Time(seconds)');
ylabel('Capacitor Voltage(Volts)');
grid();
figure();


% Charge of capacitor
charge_of_capacitor = voltage_on_capacitor .* C;
plot(t, charge_of_capacitor);
title('Capacitor charge vs Time');
xlabel('Time(seconds)');
ylabel('Capacitor Charge(coulombs)');
grid();
figure();

% Current through Resistor
current_through_resistor = voltage_on_capacitor ./ R;
plot(t, current_through_resistor);
title('Current through Resistor vs Time');
xlabel('Time(seconds)');
ylabel('Resistor Current(coulombs)');
grid();
