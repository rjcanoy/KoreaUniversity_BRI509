function y = prob3a_rect(t)
% BRI509 (Introduction to Brain Signal Processing)
% Assignment # 2
% Author: Raymart Jay E. Canoy
% Student ID #: 2020021376
% 
% Description: Unit rectangle function
% Equation: rect(t) = us(t + 0.5) - us(t - 0.5);

y = us(t + 0.5) - us(t - 0.5);
end

function y = us(t)
% Description: Unit-step Function
% us(t) = (sgn(t) + 1)/2 = (0).*(t < 0) + (1).*(t >= 0), where
% sgn(t) = -1.*(t<0) + 0.*(t = 0) + 1.*(t >= 0)
y = (sign(t) + 1)/2;
end