/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 4
  * @exercises      : 6
  * @brief          : Linear Convolution
  * @date created   : 04-08-2026 (mm-dd)
  * @last modified  : 04-09-2026
  ***********************************************************
**/

// Functions
// nx, ny for plotting signal
function [yn, yorigin, nx, ny] = convFoldShift(xn, xorigin, hn, horigin)
    // Signals length
    Nx = length(xn)
    Nh = length(hn)
    
    // Time axes
    nx = (1:Nx) - xorigin
    nh = (1:Nh) - horigin
    
    // Fold
    h_flip = hn($:-1:1)
    
    ny = (nx(1)+nh(1)) : (nx($)+nh($))
    yn = zeros(1, length(ny))
    
    // Shift
    for i = 1:length(ny)
        n = ny(i)
        sum_val = 0
        
        for k = 1:Nx
            idx = nx(k) - n + Nh - horigin + 1
            
            if idx >= 1 & idx <= Nh then
                sum_val = sum_val + xn(k) * h_flip(idx)
            end
        end
        
        yn(i) = sum_val
    end
    
    yorigin = xorigin + horigin - 1
endfunction


//////////////////////
function [yn, yorigin, nx, ny] = convMatrix (xn, xorigin, hn, horigin)
    // Signals length
    Nx = length(xn)
    Nh = length(hn)
    Ny = Nx + Nh - 1
    
    // Init matrix H (Ny x Nx)
    H = zeros(Ny, Nx)
    
    // Build matrix based on h(n-k)
    for n = 1:Ny
        for k = 1:Nx
            // index of h: (n-k), +1 bc Scilab index from 1
            idx = n - k + 1
            
            if (idx >= 1 & idx <= Nh) then
                H(n, k) = hn(idx)
            else
                H(n, k) = 0
            end
        end
    end
    
    // Convert to column vectors
    x_col = xn'
    y_col = H * x_col
    
    // Convert to row vector
    yn = y_col'
    
    // Time axes
    nx = (0:Nx-1) - (xorigin - 1)
    ny = (nx(1) + (-(horigin-1))) : (nx($) + (Nh - horigin))
    yorigin = xorigin + horigin - 1
endfunction

// Applied function
xn = [1 2 -3 2 1]
xorigin = 1
hn = [1 0 -1]
horigin = 1

// Uncomment to run:
[yn, yorigin, nx, ny] = convFoldShift (xn, xorigin, hn, horigin)
//[yn, yorigin, nx, ny] = convMatrix (xn, xorigin, hn, horigin)

// Energy
ex = xn.^2
ey = yn.^2

// Plots
clf()
scf(0)

subplot(2,2,1)
plot2d3(nx, xn, style=2)
plot(nx, xn, "ro")
xgrid()
title("Input signal x(n)")
xlabel("n")
ylabel("x(n)")

subplot(2,2,2)
plot2d3(ny, yn, style=2)
plot(ny, yn, "ro")
xgrid()
title("Output signal y(n)")
xlabel("n")
ylabel("y(n)")

subplot(2,2,3)
plot2d3(nx, ex, style=5)
plot(nx, ex, "bo")
xgrid()
title("Energy signal |x(n)|^2")
xlabel("n")
ylabel("|x(n)|^2")

subplot(2,2,4)
plot2d3(ny, ey, style=5)
plot(ny, ey, "bo")
xgrid()
title("Energy signal |y(n)|^2")
xlabel("n")
ylabel("|y(n)|^2")
