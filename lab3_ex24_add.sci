/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 3
  * @exercises      : 2.4
  * @brief          : Even and odd component
  ***********************************************************
**/

// Function
function [xe, xo, originOut] = decompose (xn, xOrigin)
    xFold = xn($:-1:1)
    xFoldOrigin = length(xn) - xOrigin + 1
    x1n = xn
    x2n = xFold
    
    // Add x(n) and x(-n)
    d = xOrigin - xFoldOrigin
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

    xe = (x1n + x2n) / 2
    xo = (x1n - x2n) / 2
    originOut = max(xOrigin, xFoldOrigin)
    
    // Plots
    nx = (1:length(xn)) - xOrigin
    nOut = (1:length(xe)) - originOut
    
    clf()
    subplot(3,1,1)
    plot2d3(nx,xn,style=2)
    plot(nx,xn, "ro")
    xgrid()
    title("Signal x(n)")
    xlabel("n")
    ylabel("x(n)")
    
    subplot(3,1,2)
    plot2d3(nOut,xe,style=2)
    plot(nOut,xe, "ro")
    xgrid()
    title("Even component xe(n)")
    xlabel("n")
    ylabel("xe(n)")
    
    subplot(3,1,3)
    plot2d3(nOut,xo,style=2)
    plot(nOut,xo, "ro")
    xgrid()
    title("Odd component xo(n)")
    xlabel("n")
    ylabel("xo(n)")
    
    // Print result
    mprintf("Result after decomposing:\n")
    mprintf("xe = [")
    for i = 1:length(xe)
        mprintf(" %g", xe(i))
    end
    mprintf(" ]\n")
    
    mprintf("xo = [")
    for i = 1:length(xo)
        mprintf(" %g", xo(i))
    end
    mprintf(" ]\n")
    
    mprintf("Origin = %d\n", originOut)
endfunction

// Applied function
xn = [2 3 4 5 6]
xOrigin = 3
[xe, xo, originOut] = decompose (xn, xOrigin)
