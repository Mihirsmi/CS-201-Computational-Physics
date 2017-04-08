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
figure();

analytical_solution = maximum_charge .* (1 - exp(-t ./ (R * C)));
plot(t, charge(:, 1), 'b');
hold on;
plot(t, analytical_solution, 'r');
grid();
title('Analytical vs Numerical Solution')
xlabel('Time(seconds)');
ylabel('Charge(coulombs)');
legend('Numerical Solution','Analytical Solution')
figure();

R = 1e-6;
C = 50e2;
[t, charge] = ode45(@rhs1a, [0:0.01:5*simulation_time], initial_charge);
plot(t, charge(:, 1),'r');
title('Charge on Capacitor vs Time');
xlabel('Time(seconds)');
ylabel('Charge(coulombs)');
grid();
hold();

R = 1;
C = 5;
[t, charge] = ode45(@rhs1a, [0:0.01:5*simulation_time], initial_charge);
plot(t, charge(:, 1), 'b');
grid();

R = 1e-2;
C = 50;
[t, charge] = ode45(@rhs1a, [0:0.01:5*simulation_time], initial_charge);
plot(t, charge(:, 1), 'k');
grid();
legend('R=1e-6 ohm C = 50e2F', 'R=1 ohm C = 5F', 'R=1e-2 ohm C= 50F');
figure();

applied_external_voltage = 1e-4;
R = 1e-6;
C = 50e2;
[t, charge] = ode45(@rhs1a, [0:0.01:5*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
plot(t, voltage_on_capacitor,'r')
title('Voltage on Capacitor vs Time');
xlabel('Time(seconds)');
ylabel('Voltage(volts)');
grid();
hold();

R = 1;
C = 5;
[t, charge] = ode45(@rhs1a, [0:0.01:5*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
plot(t, voltage_on_capacitor, 'g');
grid();

R = 1e-2;
C = 50;
[t, charge] = ode45(@rhs1a, [0:0.01:5*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
plot(t, voltage_on_capacitor,'k')
grid();
legend('R=1e-6 ohm C = 50e2F', 'R=1 ohm C = 5F', 'R=1e-2 ohm C= 50F');

figure();

R = 1e-4;
C = 50e2;
[t, charge] = ode45(@rhs1a, [0:0.01:0.1*simulation_time], initial_charge);
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
[t, charge] = ode45(@rhs1a, [0:0.01:0.1*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
current = (applied_external_voltage - voltage_on_capacitor) ./ R;
plot(t, current,'b')
grid();


R = 1e-4;
C = 50;
[t, charge] = ode45(@rhs1a, [0:0.01:0.1*simulation_time], initial_charge);
voltage_on_capacitor = charge ./ C;
current = (applied_external_voltage - voltage_on_capacitor) ./ R;
plot(t, current,'k')
grid();
legend('R=1e-4 ohm C = 50e2F', 'R=1e-4 ohm C = 5F', 'R=1e-4 ohm C= 50F');
