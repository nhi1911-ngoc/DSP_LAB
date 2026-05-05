/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 6
  * @exercises      : 4.11
  * @brief          : Fourier Transform
  ***********************************************************
**/

// x(n)
n = -3:1
x = [1 0 -1 2 3]

// x(-n)
x_flip = zeros(1, length(n))

for i = 1:length(n)
    idx = find(n == -n(i))
    if idx == [] then
        x_flip(i) = 0
    else
        x_flip(i) = x(idx)
    end
end

// Even and odd components
xe = (x + x_flip) / 2
xo = (x - x_flip) / 2

// y(n) range
ny = -5:3
y = zeros(1, length(ny)) + 0*%i

// Compute y(n)
for i = 1:length(ny)

    // xo(n)
    idx1 = find(n == ny(i))
    if idx1 == [] then
        xo_val = 0
    else
        xo_val = xo(idx1)
    end

    // xe(n+2)
    idx2 = find(n == ny(i) + 2)
    if idx2 == [] then
        xe_val = 0
    else
        xe_val = xe(idx2)
    end

    y(i) = -%i * xo_val + xe_val
end

disp(y)

// ===== Plot =====
scf(0)

// x(n)
subplot(3,1,1)
plot2d3(n, x, style=2)
plot(n, x, "ro")
xgrid()
title("Signal x(n)")
xlabel("n")
ylabel("x(n)")

// Re{y(n)}
subplot(3,1,2)
plot2d3(ny, real(y), style=2)
plot(ny, real(y), "ro")
xgrid()
title("Real part of y(n)")
xlabel("n")
ylabel("Re{y(n)}")

// Im{y(n)}
subplot(3,1,3)
plot2d3(ny, imag(y), style=5)
plot(ny, imag(y), "bo")
xgrid()
title("Imag part of y(n)")
xlabel("n")
ylabel("Im{y(n)}")
