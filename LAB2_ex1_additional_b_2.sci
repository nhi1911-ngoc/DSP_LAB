n = -3:3;
clc;
clear;
clf();
x = zeros(1,length(n));
for i = 1:length(n)
if (n(i) >= -3 & n(i) <= -1) then
x(i) = 1 + n(i)/3;
elseif (n(i) >= 0 & n(i) <= 3) then
x(i) = 1;
else
x(i) = 0;
end
// ---- Fold ----
n_fold = -n;
x_fold = x($:-1:1);
// ---- Fold roi delay 4 ----
n_fd = n_fold - 4;
x_fd = x_fold;
// ---- x(-n - 4) ----
n_c = -n  - 4;
x_c = x;
// ----- Ve do thi -----
clf()
title("x(-n - 4)")
plot2d3(n_c, x_c, style = 5)
xlabel("n")
ylabel("x(-n - 4)")
xgrid()
