function y = prob2c_impND(N, n)
if N == round(N) & N > 0
    y = double(n/N == round(n/N));
    
    I = find(round(n) ~= n);
    y(I) = NaN;
else
    y = NaN*n;
end
end