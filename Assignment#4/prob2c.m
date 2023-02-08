% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 4
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376

%% Impulse response
 N = 30;
 n = 0 : N-1;

 h = 0.25*prob2c_impD(n) + 0.50*prob2c_impD(n - 1) + 0.25*prob2c_impD(n - 2)
 
 figure, 
 p = stem(n, h, 'filled', 'k');
 set(p, 'LineWidth', 2)
 xlabel('$[n]$', 'Interpreter', 'Latex', 'FontSize', 16)
 ylabel('$x[n]$', 'Interpreter', 'Latex', 'FontSize', 16)
 title('Impulse response of the FIR filter', 'FontSize', 16)
 
 %% Exciation Signal
  x = 8*(prob2c_usD(n) - prob2c_usD(n-3));
  
 figure,
 p = stem(n, x, 'filled', 'k');
 set(p, 'LineWidth', 2)
 xlabel('$[n]$', 'Interpreter', 'Latex', 'FontSize', 16)
 ylabel('$h_{3}[n]$', 'Interpreter', 'Latex', 'FontSize', 16)
 title('Excitation Signal', 'FontSize', 16)
 
 %% Response
 y = conv(x, h, 'full');
 
 figure, 
 p = stem(n, y(2:end-28), 'filled', 'k');
 set(p, 'LineWidth', 2)
 xlabel('$[n]$', 'Interpreter', 'Latex', 'FontSize', 16)
 ylabel('$y[n]$', 'Interpreter', 'Latex', 'FontSize', 16)
 title('Response', 'FontSize', 16)
 
