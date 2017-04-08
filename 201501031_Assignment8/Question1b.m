clear all;
close all;
clc;

% Siulation Time
simulation_time = 3;

global C R maximum_charge;

% Capacitance
C = 1e-2;

% Resistance
R = 50;

initial_charge = 1;

% Maximum Charge on capacitor
maximum_charge = initial_charge;

[t, charge] = ode45(@rhs1b, [0:0.01:simulation_time], initial_charge);
plot(t, charge(:, 1))
title('Charge on Capacitor vs Time(Discharging)');
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

current = (voltage_on_capacitor) ./ R;
plot(t, current)
title('Current vs Time');
xlabel('Time(seconds)');
ylabel('Current(amperes)');
grid();
figure();

plot(t, charge(:, 1), 'b')
title('Analytical vs Numerical Solution for charge');
xlabel('Time(seconds)');
ylabel('Charge(coulombs)');
hold on;
analytical_solution_charge = initial_charge .* exp(-t ./ (R * C));
plot(t, analytical_solution_charge, 'r');
legend('Numerical Solution', 'Analytical Solution');
grid();
figure();

R = 1e-6;
C = 50e2;
[t, charge] = ode45(@rhs1b, [0:0.01:5*simulation_time], initial_charge);
plot(t, charge(:, 1),'r');
title('Charge on Capacitor vs Time');
xlabel('Time(seconds)');
ylabel('Charge(coulombs)');
grid();
hold();

R = 1;
C = 5;
[t, charge] = ode45(@rhs1b, [0:0.01:5*simulation_time], initial_charge);
plot(t, charge(:, 1), 'b');
grid();

R = 1e-2;
C = 50;
[t, charge] = ode45(@rhs1b, [0:0.01:5*simulation_time], initial_charge);
plot(t, charge(:, 1), 'k');
grid();
legend('R=1e-6 ohm C = 50e2F', 'R=1 ohm C = 5F', 'R=1e-2 ohm C= 50F');
figure();

applied_external_voltage = 1e-4;
R = 1e-6;
C = 50e2;
[t, charge] = ode45(@rhs1b, [0:0.01:5*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
plot(t, voltage_on_capacitor,'r')
title('Voltage on Capacitor vs Time');
xlabel('Time(seconds)');
ylabel('Voltage(volts)');
grid();
hold();

R = 1;
C = 5;
[t, charge] = ode45(@rhs1b, [0:0.01:5*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
plot(t, voltage_on_capacitor, 'b');
grid();

R = 1e-2;
C = 50;
[t, charge] = ode45(@rhs1b, [0:0.01:5*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
plot(t, voltage_on_capacitor,'k')
grid();
legend('R=1e-6 ohm C = 50e2F', 'R=1 ohm C = 5F', 'R=1e-2 ohm C= 50F');

figure();

R = 1e-4;
C = 50e2;
[t, charge] = ode45(@rhs1b, [0:0.01:0.01*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
current = (applied_external_voltage - voltage_on_capacitor) ./ R;
plot(t, current,'r')
title('Current vs Time');
xlabel('Time(seconds)');
ylabel('Current(amperes)');
grid();
hold();

R = 1e-4;
C = 5;
[t, charge] = ode45(@rhs1b, [0:0.01:0.01*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
current = (applied_external_voltage - voltage_on_capacitor) ./ R;
plot(t, current,'b')
grid();


R = 1e-4;
C = 50;
[t, charge] = ode45(@rhs1b, [0:0.01:0.01*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
current = (applied_external_voltage - voltage_on_capacitor) ./ R;
plot(t, current,'k')
grid();
legend('R=1e-4 ohm C = 50e2F', 'R=1e-4 ohm C = 5F', 'R=1e-4 ohm C= 50F');
