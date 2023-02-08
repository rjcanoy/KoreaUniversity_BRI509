% ===========================================================================
% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 1
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376
% ============================================================================

%% (00) Initialization
Ts = 1000;                  % Sampling period
t = [-5 : 1/Ts : 5];        % time

%% (01) Plotting g(t)
g_pos_t = 0.*(t<0) + 1.*(0<=t & t<=1) + (-0.5).*(1<t & t<=2) + 0.*(t>2);

figure, 
p = plot(t, g_pos_t, 'k');
set(p, 'LineWidth', 2)
grid on
xlim([-5, 5])
ylim([-1.5, 1.5])
xlabel('$t$', 'Interpreter', 'latex')
ylabel('$g(t)$', 'Interpreter', 'latex')
title('Original Function', 'FontName', 'Times', 'FontSize', 12)

figure, 
subplot(1, 2, 1)
p = plot(t, g_pos_t, 'k');
set(p, 'LineWidth', 2)
grid on
xlim([-5, 5])
ylim([-1.5, 1.5])
xlabel('$t$', 'Interpreter', 'latex')
ylabel('$g(t)$', 'Interpreter', 'latex')
title('Original Function', 'FontName', 'Times', 'FontSize', 12)

%% (02) Plotting g(-t)
g_neg_t = 0.*(-t<0) + 1.*(0<=-t & -t<=1) + (-0.5).*(1<-t & -t<=2) + 0.*(-t>2);

subplot(1, 2, 2)
p = plot(t, g_neg_t, 'r');
set(p, 'LineWidth', 2)
grid on
xlim([-5, 5])
ylim([-1.5, 1.5])
xlabel('$t$', 'Interpreter', 'latex')
ylabel('$g(-t)$', 'Interpreter', 'latex')
title('Time-reversed Function', 'FontName', 'Times', 'FontSize', 12)

%% (03) Plotting even part of g(t)
g_e = (g_pos_t + g_neg_t)./2;

figure;
subplot(1, 2, 1)
p = plot(t, g_pos_t, 'k')
set(p, 'LineWidth', 2)
hold on 
p = plot(t, g_neg_t, 'r')
set(p, 'LineWidth', 2)
grid on
xlim([-5, 5])
ylim([-1.5, 1.5])
xlabel('$t$', 'Interpreter', 'latex')
ylabel('$g(t) \; \; \mathtt{and} \; \; g(-t)$', 'Interpreter', 'latex')
legend('$g(t)$', 'g(-t)', 'Interpreter', 'latex')
title('Original and Time-reversed Functions')
subplot(1, 2, 2)
p = plot(t, g_e, 'k.');
set(p, 'LineWidth', 0.25)
hold on
v1 = plot(-2*ones(100, 1), linspace(-0.25, 0, 100), 'k--');
v2 = plot(-1*ones(100, 1), linspace(-0.25, 0.5, 100), 'k--');
v3 = plot(1*ones(100, 1), linspace(-0.25, 0.5, 100), 'k--');
v4 = plot(2*ones(100, 1), linspace(-0.25, 0, 100), 'k--');
grid on
xlim([-5, 5])
ylim([-1.5, 1.5])
xlabel('$t$', 'Interpreter', 'latex')
ylabel('$g_{e}(t)$', 'Interpreter', 'latex')
title('Even Part of g(t)', 'FontName', 'Times', 'FontSize', 12)

%% (03) Plotting odd part of g(t)
g_o = (g_pos_t - g_neg_t)./2;

figure;
subplot(1, 2, 1)
p = plot(t, g_pos_t, 'k')
set(p, 'LineWidth', 2)
hold on 
p = plot(t, g_neg_t, 'r')
set(p, 'LineWidth', 2)
grid on
xlim([-5, 5])
ylim([-1.5, 1.5])
xlabel('$t$', 'Interpreter', 'latex')
ylabel('$g(t) \; \; \mathtt{and} \; \; g(-t)$', 'Interpreter', 'latex')
legend('$g(t)$', 'g(-t)', 'Interpreter', 'latex')
title('Original and Time-reversed Functions')
subplot(1, 2, 2)
p = plot(t, g_o, 'k.');
set(p, 'LineWidth', 0.25)
hold on
v1 = plot(-2*ones(100, 1), linspace(0, 0.25, 100), 'k--');
v2 = plot(-1*ones(100, 1), linspace(-0.5, 0.25, 100), 'k--');
v3 = plot(0*ones(100, 1), linspace(-0.5, 0.5, 100), 'k--');
v4 = plot(1*ones(100, 1), linspace(-0.25, 0.5, 100), 'k--');
v5 = plot(2*ones(100, 1), linspace(-0.25, 0, 100), 'k--');
grid on
xlim([-5, 5])
ylim([-1.5, 1.5])
xlabel('$t$', 'Interpreter', 'latex')
ylabel('$g_{o}(t)$', 'Interpreter', 'latex')
title('Odd Part of g(t)', 'FontName', 'Times', 'FontSize', 12)