%% Problem Statement (2b)
t = linspace(-4, 4, 500);
figure;
subplot(1, 2, 1)
p = plot(t, 3*prob2b_rect(t), 'k');
set(p, 'LineWidth', 2)
grid on
title('x_1(t)', 'FontName', 'Times', 'FontSize', 12)
ylim([0, 3])
xticks([-4, -3, -2, -1, 0, 1, 2, 3, 4])
subplot(1, 2, 2)
p = plot(t, 2*prob2b_rect((t-1)/2), 'k')
set(p, 'LineWidth', 2)
grid on
ylim([0, 3])
xticks([-4, -3, -2, -1, 0, 1, 2, 3, 4])
title('x_2(t)', 'FontName', 'Times', 'FontSize', 12)

%% Convolution
y = 6*(prob2b_ramp(t+0.5) - prob2b_ramp(t-1.5) - prob2b_ramp(t-0.5) ...
    + prob2b_ramp(t-2.5));

figure;
p = plot(t, y, 'k');
set(p, 'LineWidth', 2)
xlim([-4 4])
ylim([0 6])
grid on
title('y(t) = x_1(t)*x_2(t)', 'FontName', 'Times', 'FontSize', 12)
xlabel('$t$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)
ylabel('$y(t) = x_{1}(t)*x_{2}(t)$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)