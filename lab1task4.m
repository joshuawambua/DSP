

%EET 3370: DIGITAL SIGNAL PROCESSING
%LAB 1.
%GROUP MEMBERS:
%1. JOSHUA MUTHENYA WAMBUA EG209/109705/22
%2. AKALA DALVAN EG209/109726/22

%%
%task 4
clc; clear; close all;

% Reusing from Task 3
Fo = 15;
Fs2 = 1.5*Fo;
ts2 = 0:1/Fs2:2;
x2 = 0.5*sin(14*pi*ts2) + (1/3)*sin(18*pi*ts2) + (1/5)*sin(24*pi*ts2) + (1/7)*sin(30*pi*ts2);

% Interpolated time vector
t_interp = 0:0.001:2;
x_interp = interp1(ts2, x2, t_interp, 'spline');

% Original signal for comparison
x_original = 0.5*sin(14*pi*t_interp) + (1/3)*sin(18*pi*t_interp) + ...
             (1/5)*sin(24*pi*t_interp) + (1/7)*sin(30*pi*t_interp);

% Plot
figure;
plot(t_interp, x_original, 'k--', 'LineWidth', 1.2); hold on;
plot(t_interp, x_interp, 'r', 'LineWidth', 1.5);
stem(ts2, x2, 'b');
legend('Original', 'Reconstructed (interp1)', 'Samples');
title('Signal Reconstruction using interp1()'); grid on;


