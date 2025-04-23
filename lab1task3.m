

%EET 3370: DIGITAL SIGNAL PROCESSING
%LAB 1.
%GROUP MEMBERS:
%1. JOSHUA MUTHENYA WAMBUA EG209/109705/22
%2. AKALA DALVAN EG209/109726/22

%%
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