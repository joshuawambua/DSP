

%EET 3370: DIGITAL SIGNAL PROCESSING
%LAB 1.
%GROUP MEMBERS:
%1. JOSHUA MUTHENYA WAMBUA EG209/109705/22
%2. AKALA DALVAN EG209/109726/22

%question 3
% Numerator and denominator coefficients
num = [2 16 44 56 32];
den = [3 3 -15 18 -12];

% Partial fraction expansion
[r, p, k] = residuez(num, den);
disp('Residues:'); disp(r);
disp('Poles:'); disp(p);
disp('Direct terms:'); disp(k);

% Pole-zero plot
figure;
zplane(num, den);
title('Pole-Zero Plot of X(z)');

% Frequency response
[H, w] = freqz(num, den, 1024);
figure;
subplot(2,1,1);
plot(w, abs(H));
title('Magnitude Response of X(z)');
ylabel('|X(e^{j\omega})|');
grid on;

subplot(2,1,2);
plot(w, angle(H));
title('Phase Response of X(z)');
ylabel('Phase (rad)');
xlabel('\omega (rad/sample)');
grid on;

% ROC analysis (manual):
% Stable if all poles inside unit circle
% Causal if ROC is |z| > max(|poles|)

disp('Max pole magnitude:');
disp(max(abs(p)));
