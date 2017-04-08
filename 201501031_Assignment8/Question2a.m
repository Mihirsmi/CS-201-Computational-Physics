clear all;
close all;
clc;

% Simulation Time
simulation_time = 3;

global L R applied_external_voltage maximum_current;

% Applied Voltage
applied_external_voltage = 10;


% Inductance
L = 5;

% Resistance
R = 10;

R1 = R;
L1 = L;



% Maximum Current of Inductor
maximum_current_R1_L1 = applied_external_voltage / R1;
maximum_current = maximum_current_R1_L1;

initial_current = 0;

[t, current] = ode45(@rhs2a, [0:0.01:simulation_time], initial_current);
current_R1_L1 = current(:, 1);

% Changing values of R and L and maximum_current
R = 20; L = 10;
R2 = R;
L2 = L;
maximum_current = applied_external_voltage / R;
maximum_current_R2_L2 = maximum_current;

[t, current] = ode45(@rhs2a, [0:0.01:simulation_time], initial_current);
current_R2_L2 = current(:, 1);

% Changing values of R and L and maximum_current
R = 5; L = 10;
R3 = R;
L3 = L;
maximum_current = applied_external_voltage / R;
maximum_current_R3_L3 = maximum_current;

[t, current] = ode45(@rhs2a, [0:0.01:simulation_time], initial_current);
current_R3_L3 = current(:, 1);

plot(t, current_R1_L1, 'r');
hold on;
plot(t, current_R2_L2, 'b');
hold on;
plot(t, current_R3_L3, 'k');
title('Current vs Time');
xlabel('Time(seconds)');
ylabel('Current(amperes)');
grid();
legend('R = 10ohms L = 5H', 'R = 20ohms L = 10H', 'R = 5ohms L = 10H');
figure();

% Voltage on Resistor
voltage_resistor_R1_L1 = R1 .* current_R1_L1;
voltage_resistor_R2_L2 = R2 .* current_R2_L2;
voltage_resistor_R3_L3 = R3 .* current_R3_L3;

plot(t, voltage_resistor_R1_L1, 'r');
hold on;

plot(t, voltage_resistor_R2_L2, 'b');
hold on;

plot(t, voltage_resistor_R3_L3, 'k');

title('Resistor Voltage vs Time');
xlabel('Time(seconds)');
ylabel('Resistor Voltage(volts)');
legend('R = 10ohms L = 5H', 'R = 20ohms L = 10H', 'R = 5ohms L = 10H');
grid();
figure();

% Voltage across Inductor
external_voltage = applied_external_voltage .* ones(length(voltage_resistor_R1_L1), 1);
voltage_inductor_R1_L1 = external_voltage - voltage_resistor_R1_L1;
voltage_inductor_R2_L2 = external_voltage - voltage_resistor_R2_L2;
voltage_inductor_R3_L3 = external_voltage - voltage_resistor_R3_L3;

plot(t, voltage_inductor_R1_L1, 'r');
hold on;

plot(t, voltage_inductor_R2_L2, 'b');
hold on;

plot(t, voltage_inductor_R3_L3, 'k');

title('Inductor Voltage vs Time');
xlabel('Time(seconds)');
ylabel('Inductor Voltage(volts)');
grid();
legend('R = 10ohms L = 5H', 'R = 20ohms L = 10H', 'R = 5ohms L = 10H');
figure();

% Rate of change of current
rate_of_change_of_current_R1_L1 = voltage_inductor_R1_L1 ./ L1;
rate_of_change_of_current_R2_L2 = voltage_inductor_R2_L2 ./ L2;
rate_of_change_of_current_R3_L3 = voltage_inductor_R3_L3 ./ L3;

plot(t, voltage_inductor_R1_L1, 'r');
hold on;

plot(t, voltage_inductor_R2_L2, 'b');
hold on;

plot(t, voltage_inductor_R3_L3, 'k');

title('Rate of change of current vs Time');
xlabel('Time(seconds)');
ylabel('Rate of change of current(amperes / second)');
grid();
legend('R = 10ohms L = 5H', 'R = 20ohms L = 10H', 'R = 5ohms L = 10H');
figure();

analytic_solution_current = maximum_current .* (ones(length(t), 1) - exp(t .* (-R / L)));
plot(t, current(:, 1), 'b');
title('Current vs Time');
xlabel('Time(seconds)');
ylabel('Current(amperes / second)');
grid();
hold on;
plot(t, analytic_solution_current, 'r');
legend('Numerical Solution', 'Analytical Solution');
