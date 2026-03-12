/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 2
  * @exercises      : 4
  * @brief          : Unit ramp signal
  ***********************************************************
**/

// Signals
n = -5:5
ur = n .* (n>=0)        // multiply each element

// Plots
clf()
plot2d3(n,ur,style=2)
plot(n,ur, "ro")
xgrid()
title("u_r (n) signal")
xlabel("n")
ylabel("u_r (n)")
