%% PID Controller Simulation (Discrete-Time)
clear; clc; close all;

%% Simulation parameters
Ts = 0.01;          % Sampling time (s)
T  = 5;             % Total simulation time (s)
N  = T / Ts;        % Number of samples
time = 0:Ts:T-Ts;

%% Plant model (First-order system)
% G(s) = 1 / (s + 1)
a = 1;
b = 1;

%% PID parameters
Kp = 2.0;
Ki = 1.0;
Kd = 0.1;

%% Initialization
y = zeros(1, N);    % Output
u = zeros(1, N);    % Control signal
e = zeros(1, N);    % Error
r = ones(1, N);     % Step reference

integral = 0;
prev_error = 0;

%% Simulation loop
for k = 2:N
    % Error
    e(k) = r(k) - y(k-1);

    % PID terms
    integral = integral + e(k) * Ts;
    derivative = (e(k) - prev_error) / Ts;

    % PID control law
    u(k) = Kp*e(k) + Ki*integral + Kd*derivative;

    % Discrete plant (Euler method)
    y(k) = y(k-1) + Ts * (-a*y(k-1) + b*u(k));

    prev_error = e(k);
end

%% Plot response
figure;
plot(time, r, 'r--', 'LineWidth', 1.5); hold on;
plot(time, y, 'b', 'LineWidth', 2);
grid on;
xlabel('Time (s)');
ylabel('Output');
legend('Reference', 'System Output');
title('PID Step Response');

%% Plot control signal
figure;
plot(time, u, 'k', 'LineWidth', 2);
grid on;
xlabel('Time (s)');
ylabel('Control Signal');
title('PID Control Effort');
