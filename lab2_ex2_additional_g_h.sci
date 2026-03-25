x = [0, 1, 1, 1, 1, 0.5, 0.5];
index = 3;

n = (1:length(x)) - index;
n_all = min([n, -n]) : max([n, -n]);
x_full = zeros(1, length(n_all));

for i = 1:length(n_all)
    idx = find(n == n_all(i));
    if idx <> [] then
        x_full(i) = x(idx);
    else
        x_full(i) = 0;
    end
end

x_neg_full = zeros(1, length(n_all));

for i = 1:length(n_all)
    idx = find(n_all == -n_all(i));
    x_neg_full(i) = x_full(idx);
end

xe = (x_full + x_neg_full)/2;
xo = (x_full - x_neg_full)/2;

scf(1);
plot2d3(n_all, xe, style=5);
xtitle("Thành phần chẵn của x(n)", "n", "Biên độ");

scf(2);
plot2d3(n_all, xo, style=5);
xtitle("Thành phần lẻ của x(n)", "n", "Biên độ");
