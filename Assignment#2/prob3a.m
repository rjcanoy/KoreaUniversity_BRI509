% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 2
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376

%% Problem 3a
N = 64;       % Sample 128 times
Ts = 2/N;     % Sampling interval

fs = 1/Ts;    % Sampling rate
df = fs/N;    % Frequency-domain resolution

n = [0: N-1]; % Indices

t = n*Ts;     % Time vector
x = t.*(1-t).*prob3a_rect(t - 0.5); % x(t)

num = 2*N;
X = fftshift(Ts*fft(x, num, 2)); % X(f) with zero-padding

k = [-N/2:N/(num):N/2-N/(num)]';

figure;
subplot(3,1,1);
p = plot([t, linspace(3, num-1, num-1)], [x, zeros(1, num-1)], 'k');
set(p, 'LineWidth', 2);
grid on
xlim([0 128])
xlabel('Time, $t \;\; (s)$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12);
ylabel('$x(t)$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)
subplot(3,1,2)
p = plot(k*df, abs(X), 'k')
set(p, 'LineWidth', 2);
grid on
xlim([-16 16])
xlabel('Frequency, $f \;\; (Hz)$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12);
ylabel('$|X(f)|$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)
subplot(3,1,3)
p = plot(k*df, angle(X), 'k')
set(p, 'LineWidth', 2);
grid on
xlim([-16 16])
xlabel('Frequency, $f \;\; (Hz)$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12);
ylabel('Phase of $|X(f)|$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)