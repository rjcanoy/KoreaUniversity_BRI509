function y = ramp(x)
% Function to compute the ramp function defined as 0 for values of the
% argument less than or equal to zero and the value of the argument for
% arguments greater than zero. Uses the unit-step function us(x).
y = x.*us(x)
end

function b = us(a)

b = (1 + sign(a))/2;
end