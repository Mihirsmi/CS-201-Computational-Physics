clear all;
close all;
clc;

% Simulation Time
simulation_time = 30;

global L C;

% Inductance
L = 1;
L1 = L;
% Capacitance
C = 1;
C1 = C;

initial_current = 0;
initial_charge = 1;
initial_matrix = [initial_charge initial_current];

[t, charge_current] = ode45(@rhs3a, [0:0.01:simulation_time], initial_matrix);

charge_of_capacitor_L1_C1 = charge_current(:, 1);
current_in_circuit_L1_C1 = charge_current(:, 2);

% Changing Values of L and C
L = 2.5;
L2 = L;
C = 2.5;
C2 = C;

[t, charge_current] = ode45(@rhs3a, [0:0.01:simulation_time], initial_matrix);
charge_of_capacitor_L2_C2 = charge_current(:, 1);
current_in_circuit_L2_C2 = charge_current(:, 2);

% Again changing values of L and Capacitance
L = 0.5;
C = 0.5;
L3 = L;
C3 = C;

[t, charge_current] = ode45(@rhs3a, [0:0.01:simulation_time], initial_matrix);
charge_of_capacitor_L3_C3 = charge_current(:, 1);
current_in_circuit_L3_C3 = charge_current(:, 2);


% Plot charge on Capacitor
plot(t, charge_of_capacitor_L1_C1, 'r');
hold on;
plot(t, charge_of_capacitor_L2_C2, 'b');
hold on;
plot(t, charge_of_capacitor_L3_C3, 'k');
title('Charge vs Time');
xlabel('Time(seconds)');
ylabel('Charge(coulombs)');
grid();
legend('L=1H C=1F', 'L=2H C=2F', 'L=0.5H C=0.5F');
figure();

% Plot current in circuit
plot(t, current_in_circuit_L1_C1, 'r');
hold on;
plot(t, current_in_circuit_L2_C2, 'b');
hold on;
plot(t, current_in_circuit_L3_C3, 'k');
title('Current vs Time');
xlabel('Time(seconds)');
ylabel('Current(amperes)');
grid();
legend('L=1H C=1F', 'L=2H C=2F', 'L=0.5H C=0.5F');
figure();

% Voltage on Capacitor

voltage_on_capacitor_L1_C1 = charge_of_capacitor_L1_C1 ./ C1;
voltage_on_capacitor_L2_C2 = charge_of_capacitor_L2_C2 ./ C2;
voltage_on_capacitor_L3_C3 = charge_of_capacitor_L3_C3 ./ C3;

plot(t, voltage_on_capacitor_L1_C1, 'r');
hold on;

plot(t, voltage_on_capacitor_L2_C2, 'b');
hold on;

plot(t, voltage_on_capacitor_L3_C3, 'k');

title('Capacitor Voltage vs Time');
xlabel('Time(seconds)');
ylabel('Capacitor Voltage(volts)');
legend('L=1H C=1F', 'L=2H C=2F', 'L=0.5H C=0.5F');
grid();
figure();

% Voltage across Inductor

voltage_inductor_L1_C1 = -voltage_on_capacitor_L1_C1;
voltage_inductor_L2_C2 = -voltage_on_capacitor_L2_C2;
voltage_inductor_L3_C3 = -voltage_on_capacitor_L3_C3;

plot(t, voltage_inductor_L1_C1, 'r');
hold on;
plot(t, voltage_inductor_L2_C2, 'b');
hold on;
plot(t, voltage_inductor_L3_C3, 'k');

title('Inductor Voltage vs Time');
xlabel('Time(seconds)');
ylabel('Inductor Voltage(volts)');
grid();
legend('L=1H C=1F', 'L=2H C=2F', 'L=0.5H C=0.5F');
figure();

% Rate of change of current
rate_of_change_of_current_L1_C1 = voltage_inductor_L1_C1 ./ L1;
rate_of_change_of_current_L2_C2 = voltage_inductor_L2_C2 ./ L2;
rate_of_change_of_current_L3_C3 = voltage_inductor_L3_C3 ./ L3;

plot(t, rate_of_change_of_current_L1_C1, 'r');
hold on;

plot(t, rate_of_change_of_current_L2_C2, 'b');
hold on;
plot(t, rate_of_change_of_current_L3_C3, 'k');

title('Rate of change of current vs Time');
xlabel('Time(seconds)');
ylabel('Rate of change of current(amperes/second)');
legend('L=1H C=1F', 'L=2H C=2F', 'L=0.5H C=0.5F');
grid();
