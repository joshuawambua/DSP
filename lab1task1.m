


%
%
%
%
%
%
%
%
%
%
%
%
%
%%
%task 1


clc; clear; close all;

% Time vector for high resolution (original signal)
t = linspace(0, 3/60, 1000); % 3 cycles of highest freq (75 Hz)
x = 10*cos(120*pi*t) + 5*sin(100*pi*t + deg2rad(30)) + 4*sin(150*pi*t + deg2rad(45));

% Maximum frequency component
Fo = 75; % 150π → 75 Hz

% Sampling frequencies
Fs1 = 4*Fo;
Fs2 = 2*Fo;
Fs3 = Fo;

% Time vectors for sampling
t1 = 0:1/Fs1:3/Fo;
t2 = 0:1/Fs2:3/Fo;
t3 = 0:1/Fs3:3/Fo;

% Sampled signals
x1 = 10*cos(120*pi*t1) + 5*sin(100*pi*t1 + deg2rad(30)) + 4*sin(150*pi*t1 + deg2rad(45));
x2 = 10*cos(120*pi*t2) + 5*sin(100*pi*t2 + deg2rad(30)) + 4*sin(150*pi*t2 + deg2rad(45));
x3 = 10*cos(120*pi*t3) + 5*sin(100*pi*t3 + deg2rad(30)) + 4*sin(150*pi*t3 + deg2rad(45));

% Plot
figure;
plot(t, x, 'k', 'LineWidth', 1.5); hold on;
stem(t1, x1, 'r'); stem(t2, x2, 'g'); stem(t3, x3, 'b');
legend('Original', 'Fs = 4Fo', 'Fs = 2Fo', 'Fs = Fo');
xlabel('Time (s)'); ylabel('Amplitude'); title('Task 1: Original and Sampled Signals');
grid on;


