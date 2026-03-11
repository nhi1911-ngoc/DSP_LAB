x = [1 3 -2]; index = 2;
n = (1 : length(x)) - index;
x_neg = zeros( 1, length(n));
for i = 1 : length(n)
    idx = find(n == -n(i))
    if idx <> [] then
    x_neg(i) = x(idx);
    end
end
xe = (x + x_neg) / 2;
xo = (x - x_neg) / 2;

subplot(3,1,1); 
plot2d3(n, x, style = 5); title("x(n)");
xlabel("n"); ylabel("x(n)");


subplot(3,1,2);
plot2d3(n, xe, style = 5); title("xe(n) - Even component");
xlabel("n"); ylabel("xe(n)");


subplot(3,1,3);
plot2d3(n, xo, style = 5); title("xo(n) - Odd component");
xlabel("n"); ylabel("xo(n)");
