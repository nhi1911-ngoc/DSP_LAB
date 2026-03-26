/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 3
  * @exercises      : 2.6
  * @brief          : Time-invariant
  ***********************************************************
**/

/*
 Architecture
 |_systemB() (System of exercise b)
 |_systemC() (System of exercise c)
 |_systemD() (System of exercise d)
 |_delay()
 |_timeInvCheck()
*/

// ===== FUNCTIONS =====

// ----- SYSTEM B -----
// y(n) = x(n^2)
function [yn, yorigin] = systemB(xn, xorigin)
    N = length(xn)
    nx = (1:N) - xorigin
    
    nmin = floor(-sqrt(max(nx)))
    nmax = ceil(sqrt(max(nx)))
    ny = nmin:nmax
    
    Ny = length(ny)
    yn = zeros(1, Ny)
    
    for i = 1:Ny
        n = ny(i)
        idx = n^2 + xorigin
        
        if (idx >= 1 & idx <= N) then
            yn(i) = xn(idx)
        else
            yn(i) = 0
        end
    end
    
    idx_nz = find(yn <> 0)
    if idx_nz == [] then
        yn = []
        yorigin = []
        return
    end
    
    first = idx_nz(1)
    last  = idx_nz($)
    
    yn = yn(first:last)
    ny = ny(first:last)
    yorigin = find(ny == 0)
endfunction

// ----- SYSTEM C -----
// y(n) = x(n) - x(n-1)
function [yn, yorigin] = systemC(xn, xorigin)
    N = length(xn)
    nx = (1:N) - xorigin
    
    ny = min(nx) : (max(nx)+1)
    Ny = length(ny)
    yn = zeros(1, Ny)
    yorigin = 1 - ny(1)
    
    for i = 1:Ny
        n = ny(i)
        
        // x(n)
        idx1 = n + xorigin
        if (idx1 >= 1 & idx1 <= N) then
            x1 = xn(idx1)
        else
            x1 = 0
        end
        
        // x(n-1)
        idx2 = (n-1) + xorigin
        if (idx2 >= 1 & idx2 <= N) then
            x2 = xn(idx2)
        else
            x2 = 0
        end
        
        yn(i) = x1 - x2
    end
endfunction

// ----- SYSTEM D -----
// y(n) = nx(n)
function [yn, yorigin] = systemD(xn, xorigin)
    N = length(xn)
    nx = (1:N) - xorigin
    yn = zeros(1, N)
    
    for i = 1:N
        n = nx(i)
        yn(i) = n * xn(i)
    end
    yorigin = xorigin
endfunction

// ----- DELAY -----
function [yn, yorigin] = delay(xn, xorigin, k)
    if k > 0 then
        yn = xn;
        yorigin = xorigin - k;
        
        if (yorigin < 1) then
            add_zero = 1 - yorigin;
            yn = [zeros(1, add_zero) yn];
            yorigin = 1;
        end
    else
        mprintf("Khong xu ly vi k <= 0\n");
        yn = xn;
        yorigin = xorigin;
    end
endfunction


// ----- MAIN FUNCTION -----
function timeInvCheck(xn, xorigin, k, systemFunc)
    // x(n) -> y(n) -> y(n-k)
    [yn, yorigin] = systemFunc(xn, xorigin)
    [y_delay, y_delay_origin] = delay(yn, yorigin, k)
    
    // x(n) -> x(n-k) -> y(n) =  T[x(n-k)] (y2(n))
    [x_delay, x_delay_origin] = delay(xn, xorigin, k)
    [y2n, y2origin] = systemFunc(x_delay, x_delay_origin)

    // Print result
    disp("y(n-k) = ")
    disp(y_delay)
    disp("y2(n) = ")
    disp(y2n)
    
    // Compare
    if length(y2n) <> length(y_delay) then
        disp("=> Time-VARIANT")
    else
        if sum(abs(y2n - y_delay)) == 0 then
            disp("=> Time-INVARIANT")
        else
            disp("=> Time-VARIANT")
        end
    end

    // ---- Plots ----
    // Window 1: x(n) -> y(n) -> y(n-k)
    scf(1)
    clf()
    
    nx = (1:length(xn)) - xorigin
    ny = (1:length(yn)) - yorigin
    ny_delay = (1:length(y_delay)) - y_delay_origin
    
    subplot(3,1,1)
    plot2d3(nx, xn, style=2)
    plot(nx, xn, "ro")
    xgrid()
    title("Signal x(n)")
    xlabel("n")
    ylabel("x(n)")
    
    subplot(3,1,2)
    plot2d3(ny, yn, style=2)
    plot(ny, yn, "ro")
    xgrid()
    title("Signal y(n) = T[x(n)]")
    xlabel("n")
    ylabel("y(n)")
    
    subplot(3,1,3)
    plot2d3(ny_delay, y_delay, style=2)
    plot(ny_delay, y_delay, "ro")
    xgrid()
    title("Signal y(n-k)")
    xlabel("n")
    ylabel("y(n-k)")

    // Window 2: x(n) -> x(n-k) -> y2(n)
    scf(2)
    clf()
    
    nx = (1:length(xn)) - xorigin
    nx2 = (1:length(x_delay)) - x_delay_origin
    ny2 = (1:length(y2n)) - y2origin
    
    subplot(3,1,1)
    plot2d3(nx, xn, style=2)
    plot(nx, xn, "ro")
    xgrid()
    title("Signal x(n)")
    xlabel("n")
    ylabel("x(n)")
    
    subplot(3,1,2)
    plot2d3(nx2, x_delay, style=2)
    plot(nx2, x_delay, "ro")
    xgrid()
    title("Signal x(n-k)")
    xlabel("n")
    ylabel("x(n-k)")
    
    subplot(3,1,3)
    plot2d3(ny2, y2n, style=2)
    plot(ny2, y2n, "ro")
    xgrid()
    title("Signal y_2(n) = T[x(n-k)]")
    xlabel("n")
    ylabel("y_2(n)")
endfunction


// ===== APPLIED FUNCTION =====
xn = [1 1 1 1]
xorigin = 1
k = 2

// Uncomment each line to run:
timeInvCheck(xn, xorigin, k, systemB)     // Ex b
//timeInvCheck(xn, xorigin, k, systemC)     // Ex c
//timeInvCheck(xn, xorigin, k, systemD)     // Ex d


