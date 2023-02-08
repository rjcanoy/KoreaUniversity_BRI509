function y = prob2e_usD(n)
y = double(n >= 0);

I = find(round(n) ~= n);
y(I) = NaN;
end