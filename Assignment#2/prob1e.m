clear; clc;

fs = 200;                  % Sampling Frequency
T = 1/fs;                   % Sampling Period
dur  = 1;                   % duration, s
L = dur*fs;                 % Length of signal
t = (0:L-1)*T;              % One-second duration

%% cosine
x1 = cos(2*pi*50*t);
y = fftshift(fft(x1));

figure;
p = plot([-fs/2:fs/2-1], abs(y/L), 'k')
set(p, 'LineWidth', 2)
xticks([-100 -75 -50 -25 0 25 50 75 100])
xticklabels({'-100', '-75', '-f_{0}', '-25', '0', '25', 'f_{0}', '75', '100'})
xlabel('Frequency, $f (Hz)$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)
ylabel('$|X(f)|$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)

%% sine
x1 = cos(2*pi*50*t);
y = fftshift(fft(x1));

figure;
p = plot([-fs/2:fs/2-1], abs(y/L), 'k')
set(p, 'LineWidth', 2)
xticks([-100 -75 -50 -25 0 25 50 75 100])
xticklabels({'-100', '-75', '-f_{0}', '-25', '0', '25', 'f_{0}', '75', '100'})
xlabel('Frequency, $f (Hz)$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)
ylabel('$|X(f)|$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)

