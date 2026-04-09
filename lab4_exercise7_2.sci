clear; clc;

x = [1 2 -3 2 1];
h = [1 0 -1 -1 1];

M = length(x);
L = length(h);
N = M + L - 1;

y = zeros(1, N);

h_fold = h($:-1:1);

// convolution
for n = 0:N-1
    for k = 0:M-1
        idx = n - k;
        if (idx >= 0) & (idx <= L-1) then
            y(n+1) = y(n+1) + x(k+1)*h(idx+1);
        end
    end
end

n = 0:N-1;
subplot(3,1,1);
plot2d3(0:M-1, x, style = 2);          
plot(0:M-1, x, 'o');       
title("x(n)");
xgrid();

subplot(3,1,2);
plot2d3(0:L-1, h, style = 2);
plot(0:L-1, h, 'o');
title("h(n)");
xgrid();

subplot(3,1,3);
plot2d3(n, y, style = 5);
plot(n, y, 'o');
title("y(n) = x(n) * h(n)");
xgrid();

y_check = conv(x, h);
disp("y(n) = [" + strcat(string(y), " ") + "]");
disp("y(n)_check = [" + strcat(string(y_check), " ") + "]");
if y == y_check then
    disp("=> Ket qua CHINH XAC!");
else
    disp("=> CO SAI SOT!");
end
