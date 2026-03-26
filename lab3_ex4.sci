/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 3
  * @exercises      : 4
  * @brief          : Sum of 2 signals
  ***********************************************************
**/

// Function
function [yn, yorigin] = add (x1n, x1origin, x2n, x2origin)
    d = x1origin - x2origin
    
    if (d>0) then
        x2n = [zeros(1,d) x2n]
    elseif (d<0) then
        x1n = [zeros(1,-d) x1n]
    end
    
    L1 = length(x1n)
    L2 = length(x2n)
    
    if (L1>L2) then
        x2n = [x2n zeros(1,L1-L2)]
    elseif (L1<L2) then
        x1n = [x1n zeros(1,L2-L1)]
    end

    yn = x1n + x2n
    yorigin = max(x1origin, x2origin)
    
    // Plots
    n1 = (1:length(x1n)) - yorigin
    n2 = (1:length(x2n)) - yorigin
    ny = (1:length(yn)) - yorigin
    
    clf()
    subplot(3,1,1)
    plot2d3(n1,x1n,style=2)
    plot(n1,x1n, "ro")
    xgrid()
    title("Signal x1(n)")
    xlabel("n")
    ylabel("x1(n)")
    
    subplot(3,1,2)
    plot2d3(n2,x2n,style=2)
    plot(n2,x2n, "ro")
    xgrid()
    title("Signal x2(n)")
    xlabel("n")
    ylabel("x2(n)")
    
    subplot(3,1,3)
    plot2d3(ny,yn,style=2)
    plot(ny,yn, "ro")
    xgrid()
    title("Signal y(n)")
    xlabel("n")
    ylabel("y(n)")
    
    // Print result
    mprintf("Result after summing:\n")
    mprintf("yn = [")
    for i = 1:length(yn)
        mprintf(" %g", yn(i))
    end
    mprintf(" ]\n")
    mprintf("yorigin = %d\n", yorigin)
endfunction

// Applied function
x1n = [0 1 3 -2]
x1origin = 1
x2n = [1 1 2 3]
x2origin = 2
[yn, yorigin] = add (x1n, x1origin, x2n, x2origin)
