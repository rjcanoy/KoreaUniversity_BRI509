% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 1
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376

%% Part 1: x_{1}(t) = e^(-t)*sin(20*pi*t) + e^(-t/2)*sin(19*pi*t)
fs = 500;
t1 = [-2: 1/fs : 6];
x1 = exp(-t1).*sin(20*pi*t1) + exp(-t1/2).*sin(19*pi*t1);

figure;
subplot(1, 2, 1)
p = plot(t1, x1, 'k');
set(p, 'LineWidth', 1)
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$x_{1}(t)$', 'Interpreter', 'latex');
grid on
title('x_1(t) = exp(-t)sin(20\pit) + exp(-t/2)sin(19\pit)', 'FontName', 'Times', 'FontSize', 12)

%% Part 2: x_{2}(t) = rect(t)*cos(20*pi*t)
fs = 500;
t2 = [-2: 1/fs : 6];
x2 = prob4a_rect(t2).*cos(20*pi*t2);

subplot(1, 2, 2)
p = plot(t2, x2, 'k');
set(p, 'LineWidth', 1)
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$x_{2}(t)$', 'Interpreter', 'latex');
grid on
title('x_2(t) = rect(t)cos(20\pit)', 'FontName', 'Times', 'FontSize', 12)