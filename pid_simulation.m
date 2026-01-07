%% pid_simulation.m
% Author: Captain Olubambi 
% Purpose: Simulate P, PI, and PID controllers on a simple system
% Date: 2026-01-07

clc; clear; close all;

% --- Step 1: Define system (1st order system example) ---
% Transfer function: G(s) = 1 / (s + 1)
num = 1;
den = [1 1];
sys = tf(num, den);

% --- Step 2: Define controller parameters ---
Kp = 1;       % Proportional gain
Ki = 1;       % Integral gain
Kd = 0.1;     % Derivative gain

% --- Step 3: Controllers ---
P = pid(Kp, 0, 0);
PI = pid(Kp, Ki, 0);
PID = pid(Kp, Ki, Kd);

% --- Step 4: Simulate step response ---
t = 0:0.01:10;   % simulation time

[yP, tP] = step(feedback(P*sys,1), t);
[yPI, tPI] = step(feedback(PI*sys,1), t);
[yPID, tPID] = step(feedback(PID*sys,1), t);

% --- Step 5: Plot responses ---
figure;
plot(tP, yP, 'r', 'LineWidth', 1.5); hold on
plot(tPI, yPI, 'g', 'LineWidth', 1.5)
plot(tPID, yPID, 'b', 'LineWidth', 1.5)
xlabel('Time (s)')
ylabel('Output')
title('Step Response with P, PI, and PID Controllers')
legend('P', 'PI', 'PID')
grid on

% --- Step 6: Save plot ---
if ~exist('plots','dir')
   mkdir('plots')
end
saveas(gcf, 'plots/pid_step_response.png')
