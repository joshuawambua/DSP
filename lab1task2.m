

%EET 3370: DIGITAL SIGNAL PROCESSING
%LAB 1.
%GROUP MEMBERS:
%1. JOSHUA MUTHENYA WAMBUA EG209/109705/22
%2. AKALA DALVAN EG209/109726/22


%task 2


clc; clear; close all;

% Define parameters
Fs = 250; % Choose Fs > max freq (125 Hz), so Fs = 250 is safe
n = -10:10;
t = n/Fs;

% Original discrete signal
x = 10*cos(250*pi*t + deg2rad(60)) + 5*sin(200*pi*t + deg2rad(75));

% Upsampled by 3
x_up = upsample(x, 3);

% Downsampled the upsampled signal by 4
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
