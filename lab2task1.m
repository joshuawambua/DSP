

%EET 3370: DIGITAL SIGNAL PROCESSING
%LAB 1.
%GROUP MEMBERS:
%1. JOSHUA MUTHENYA WAMBUA EG209/109705/22
%2. AKALA DALVAN EG209/109726/22

%Question 1
% Define numerator and denominator coefficients (descending powers of z^(-1))
b = [0 1 0.5];       % z^(-1) + 0.5z^(-2)
a = [1 -0.6 0.08];   % 1 - 3/5 z^(-1) + 2/25 z^(-2)

% Frequency response
[H, w] = freqz(b, a, 1024);

% Plot
figure;
subplot(2,1,1);
plot(w, abs(H));
title('Magnitude Response of H(z)');
ylabel('|H(e^{j\omega})|');
grid on;

subplot(2,1,2);
plot(w, angle(H));
title('Phase Response of H(z)');
ylabel('Phase (rad)');
xlabel('\omega (rad/sample)');
grid on;
