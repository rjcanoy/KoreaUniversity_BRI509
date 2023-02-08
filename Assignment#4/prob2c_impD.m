function y = impD(n)
y = double (n == 0);

I = find(round(n) ~= n);
y(I) = NaN;
end