% ===========================================================================
% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 1
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376
% ============================================================================

%% (00) Initialization
n = [-5:10];

%% (01) Impulse Train
y = prob2c_impND(3, n);

% Plotting the impulse train
figure, 
stem(n, y, 'filled', 'k')
xticks([-5, -3, 0, 3, 6, 9, 10])
xlabel('$n$', 'Interpreter', 'latex')
ylabel('$\delta_{3}(n)$', 'Interpreter', 'latex') 
title('Impulse Train', 'FontName', 'Times', 'FontSize', 12)

%% (02) Accumulation
accu = cumsum(y);

% Plotting the accumulation
figure,
stem(n, accu, 'filled', 'k')
xticks([-5, -3, 0, 3, 6, 9, 10])
xlabel('$n$', 'Interpreter', 'latex')
ylabel('$\sum_{m=-\infty}^{\infty}{\delta_{3}[n]}$', 'Interpreter', 'latex') 
title('Accumulation', 'FontName', 'Times', 'FontSize', 12)

