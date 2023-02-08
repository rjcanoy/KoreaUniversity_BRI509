% Problem 2e
n = [-200: 1: 200];
x = (1/25)*cos((pi*n)/2).*sinc(n/50);
figure,
p = stem(n, x, 'k', 'Filled')
xlabel('$n$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)
ylabel('$x[n] = \frac{1}{25}\cos\left(\frac{\pi n}{2}\right)\mathtt{sinc}\left(\frac{n}{50}\right)$', 'Interpreter', 'Latex', 'FontName', 'Times', 'FontSize', 12)