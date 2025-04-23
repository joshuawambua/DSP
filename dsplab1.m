
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




%task 2


clc; clear; close all;

% Define parameters
Fs = 250; % Choose Fs > max freq (125 Hz), so Fs = 250 is safe
n = -10:10;
t = n/Fs;

% Original discrete signal
x = 10*cos(250*pi*t + deg2rad(60)) + 5*sin(200*pi*t + deg2rad(75));

% Upsample by 3
x_up = upsample(x, 3);

% Downsample the upsampled signal by 4
x_down = downsample(x_up, 4);

% Time vectors for plotting
t_up = (0:length(x_up)-1)/Fs/3;
t_down = (0:length(x_down)-1)/Fs;

% Plots
figure;
subplot(5,1,1); fplot(@(t) 10*cos(250*pi*t + deg2rad(60)) + 5*sin(200*pi*t + deg2rad(75)), [-0.05, 0.05]);
title('Original Analog Signal'); grid on;

subplot(5,1,2); stem(n, x); title('Sampled Signal x[n]'); grid on;

subplot(5,1,3); stem(t, x); title('Discrete Signal'); grid on;

subplot(5,1,4); stem(t_up, x_up); title('Upsampled Signal'); grid on;

subplot(5,1,5); stem(t_down, x_down); title('Final Output After Downsampling'); grid on;

%task 3
clc; clear; close all;

% Signal parameters
Fo = 15; % Max frequency = 30π => 15 Hz
t = 0:0.001:2;

% Original signal
x = 0.5*sin(14*pi*t) + (1/3)*sin(18*pi*t) + (1/5)*sin(24*pi*t) + (1/7)*sin(30*pi*t);

% Case i: Fs = 5Fo = 75 Hz
Fs1 = 5*Fo;
ts1 = 0:1/Fs1:2;
x1 = 0.5*sin(14*pi*ts1) + (1/3)*sin(18*pi*ts1) + (1/5)*sin(24*pi*ts1) + (1/7)*sin(30*pi*ts1);

% Case ii: Fs = 1.5Fo = 22.5 Hz (aliasing expected)
Fs2 = 1.5*Fo;
ts2 = 0:1/Fs2:2;
x2 = 0.5*sin(14*pi*ts2) + (1/3)*sin(18*pi*ts2) + (1/5)*sin(24*pi*ts2) + (1/7)*sin(30*pi*ts2);

% Plot
figure;
subplot(3,1,1); plot(t, x); title('Original Signal'); grid on;
subplot(3,1,2); stem(ts1, x1); title('Sampled Signal: Fs = 5Fo'); grid on;
subplot(3,1,3); stem(ts2, x2); title('Aliased Signal: Fs = 1.5Fo'); grid on;

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


















