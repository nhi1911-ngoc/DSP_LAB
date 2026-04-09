clc; clear;
x = [1,  2, -3,  2, 1];
h = [1,  0, -1, -1, 1];

y = conv(x, h);

nx = 0:length(x)-1;
ny = 0:length(y)-1;

E = zeros(1, length(y));
for i = 1:length(y)
    E(i) = sum(y(1:i).^2);
end

clc; clear;

// ===== Input =====
x = [1,  2, -3,  2, 1];
h = [1,  0, -1, -1, 1];

// ===== Tích chập =====
y = conv(x, h);

// ===== Trục n =====
nx = 0:length(x)-1;
ny = 0:length(y)-1;

// ===== Năng lượng tích lũy (dùng y) =====
E = zeros(1, length(y));
for i = 1:length(y)
    E(i) = sum(y(1:i).^2);
end

clf();

// ===== x(n) =====
subplot(3,1,1);
plot2d3(nx, x, style = 2);
xtitle("Tin hieu x(n)", "n", "x(n)");
xgrid();

// ghi giá trị
for i = 1:length(x)
    if x(i) >= 0 then
        ypos = x(i) + 0.5;
    else
        ypos = x(i) - 1;
    end
    xstring(nx(i), ypos, string(x(i)));
end


// ===== y(n) =====
subplot(3,1,2);
plot2d3(ny, y, style = 5);
xtitle("Tin hieu y(n) = x(n) * h(n)", "n", "y(n)");
xgrid();

// ghi giá trị
for i = 1:length(y)
    if y(i) >= 0 then
        ypos = y(i) + 0.5;
    else
        ypos = y(i) - 1;
    end
    xstring(ny(i), ypos, string(y(i)));
end

// ===== Năng lượng =====
subplot(3,1,3);
plot2d3(ny, E, style = 6);
xtitle("Nang luong tich luy E(n)", "n", "E(n)");
xgrid();

// ghi giá trị
for i = 1:length(E)
    ypos = E(i) + 0.5; // năng lượng luôn >= 0
    xstring(ny(i), ypos, string(E(i)));
end
