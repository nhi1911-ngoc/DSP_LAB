x1 = [0 1 3 -2]; index1 = 1;

n1 = (1 : length(x1)) - index1;

x2 = [0 1 2 3]; index2 = 2;

n2 = (1 : length(x2)) - index2;

n_min = min(min(n1), min(n2));

n_max = max(max(n1), max(n2));

n = n_min : n_max;

x1_new = zeros(1, length(n));

x2_new = zeros(1, length(n));

for k = 1 : length(n1)
pos = find(n == n1(k));
x1_new(pos) = x1(k);
end

for k = 1 : length(n2)
pos = find(n == n2(k));
x2_new(pos) = x2(k);
end

y = x1_new .* x2_new;

subplot(3,1,1); plot2d3(n, x1_new, style = 5);

title("x1(n)");

xlabel("n"); ylabel("x1(n)");

subplot(3,1,2); plot2d3(n, x2_new, style = 5);

title("x2(n)");

xlabel("n"); ylabel("x2(n)");

subplot(3,1,3); plot2d3(n,y, style = 5);

title("y(n) = x1(n) * x2(n)");

xlabel("n"); ylabel("y(n)");
