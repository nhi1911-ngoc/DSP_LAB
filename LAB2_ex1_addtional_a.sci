clc;
clear;
clf();

n = -3:3;

x = zeros(1,length(n));

for i = 1:length(n)
if (n(i) >= -3 & n(i) <= -1) then
x(i) = 1 + n(i)/3;
elseif (n(i) >= 0 & n(i) <= 3) then
x(i) = 1;
else
x(i) = 0;
end
end

plot2d3(n, x, style = 5)
title("x(n)")
xlabel("n")
ylabel("x(n)")
xgrid()
