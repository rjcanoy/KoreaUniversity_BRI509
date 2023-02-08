% ===========================================================================
% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 1
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376
% ============================================================================

n = [-10:10];
u0 = prob2e_usD(n);
u1 = prob2e_usD(n - 1);
u2 = prob2e_usD(4 - n);
g = 5*(u1 - u2);

xmax = max(n);
xmin = min(n);
ymax = max([max(u0) max(u1) max(u2) max(g)]);
ymin = min([min(u0) min(u1) min(u2) min(g)]);

figure,
subplot(2, 2, 1)
p = stem(n, u0, 'filled', 'k');
xlabel('$n$', 'Interpreter', 'latex')
ylabel('$u[n]$', 'Interpreter', 'latex')
xlim([xmin, xmax])
ylim([ymin, ymax])
xticks([-10, -5, 0, 1, 4, 5, 10])
yticks([-5, 0, 1, 5])
grid on
subplot(2, 2, 2)
p = stem(n, u1, 'filled', 'k');
xlabel('$n$', 'Interpreter', 'latex')
ylabel('$u[n-1]$', 'Interpreter', 'latex')
xlim([xmin, xmax])
ylim([ymin, ymax])
xticks([-10, -5, 0, 1, 4, 5, 10])
yticks([-5, 0, 1, 5])
grid on
subplot(2, 2, 3)
p = stem(n, u2, 'filled', 'k');
xlabel('$n$', 'Interpreter', 'latex')
ylabel('$u[4 - n] = u[-(n-4)]$', 'Interpreter', 'latex')
xlim([xmin, xmax])
ylim([ymin, ymax])
xticks([-10, -5, 0, 1, 4, 5, 10])
yticks([-5, 0, 1, 5])
grid on
subplot(2, 2, 4)
p = stem(n, g, 'filled', 'k');
xlabel('$n$', 'Interpreter', 'latex')
ylabel('$g[n] = 5(u[n-1] - u[4 - n])$', 'Interpreter', 'latex')
xlim([xmin, xmax])
ylim([ymin, ymax])
xticks([-10, -5, 0, 1, 4, 5, 10])
yticks([-5, 0, 1, 5])
grid on