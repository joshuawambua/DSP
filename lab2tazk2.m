

%EET 3370: DIGITAL SIGNAL PROCESSING
%LAB 1.
%GROUP MEMBERS:
%1. JOSHUA MUTHENYA WAMBUA EG209/109705/22
%2. AKALA DALVAN EG209/109726/22

%question 2

% Define numerator and denominator (descending powers of z)
num = [1 -2 2 -1];          % z^3 - 2z^2 + 2z - 1
den = conv(conv([1 -1], [1 -0.5]), [1 -0.2]);  % (z - 1)(z - 0.5)(z - 0.2)

% Pole-zero plot
figure;
zplane(num, den);
title('Pole-Zero Plot of H(z)');

% Check poles
poles = roots(den);
disp('Poles:');
disp(poles);

% Stability check
if all(abs(poles) < 1)
    disp('System is stable.');
else
    disp('System is unstable.');
end
