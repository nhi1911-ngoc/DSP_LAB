/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 3
  * @exercises      : 3
  * @brief          : Signal folding
  ***********************************************************
**/

// Function
function [yn, yorigin] = fold (xn, xorigin)
    yn = xn($:-1:1)
    N = length(xn)
    yorigin = N - xorigin + 1
    
    // Plots
    nx = 1:N
    nx = nx - xorigin
    ny = 1:N
    ny = ny - yorigin
    
    clf()
    subplot(2,1,1)
    plot2d3(nx,xn,style=2)
    plot(nx,xn, "ro")
    xgrid()
    title("Original signal x(n)")
    xlabel("n")
    ylabel("x(n)")
    
    subplot(2,1,2)
    plot2d3(ny,yn,style=2)
    plot(ny,yn, "ro")
    xgrid()
    title("Folded signal y(n)")
    xlabel("n")
    ylabel("y(n)")
    
    // Print result
    mprintf("Result after folding:\n")
    mprintf("yn = [")
    for i = 1:length(yn)
        mprintf(" %g", yn(i))
    end
    mprintf(" ]\n")
    mprintf("yorigin = %d\n", yorigin)
endfunction

// Applied function
xn = [1 -2 3 6]
xorigin = 3
[yn, yorigin] = fold (xn, xorigin)
