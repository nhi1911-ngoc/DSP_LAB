/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 3
  * @exercises      : 6
  * @brief          : Convolution
  ***********************************************************
**/

// Function
function [yn, yorigin] = convolution (xn, xorigin, hn, horigin)
    yn = conv(xn,hn)
    yorigin = xorigin + horigin - 1
    
    // Plots
    nx = (1:length(xn)) - xorigin
    nh = (1:length(hn)) - horigin
    ny = (1:length(yn)) - yorigin
    
    clf()
    subplot(3,1,1)
    plot2d3(nx,xn,style=2)
    plot(nx,xn, "ro")
    xgrid()
    title("Input signal x(n)")
    xlabel("n")
    ylabel("x(n)")
    
    subplot(3,1,2)
    plot2d3(nh,hn,style=2)
    plot(nh,hn, "ro")
    xgrid()
    title("System characteristic’s function h(n)")
    xlabel("n")
    ylabel("h(n)")
    
    subplot(3,1,3)
    plot2d3(ny,yn,style=2)
    plot(ny,yn, "ro")
    xgrid()
    title("Output signal y(n)")
    xlabel("n")
    ylabel("y(n)")
    
    // Print result
    mprintf("Result after calculating convolution:\n")
    mprintf("yn = [")
    for i = 1:length(yn)
        mprintf(" %g", yn(i))
    end
    mprintf(" ]\n")
    mprintf("yorigin = %d\n", yorigin)
endfunction

// Applied function
xn = [1 1 2]
xorigin = 1
hn = [1 2 1]
horigin = 1
[yn, yorigin] = convolution (xn, xorigin, hn, horigin)
