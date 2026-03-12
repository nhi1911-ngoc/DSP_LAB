/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 2
  * @exercises      : 6
  * @brief          : Sum of 2 signals
  ***********************************************************
**/

// Signals
n = -1:3
x1 = [0 0 1 3 -2]
x2 = [0 1 2 3 0]
y = x1 + x2

// Plots
clf()
subplot(3,1,1)
plot2d3(n,x1,style=2)
plot(n,x1, "ro")
xgrid()
title("x1(n) signal")
xlabel("n")
ylabel("x1(n)")

subplot(3,1,2)
plot2d3(n,x2,style=2)
plot(n,x2, "ro")
xgrid()
title("x2(n) signal")
xlabel("n")
ylabel("x2(n)")

subplot(3,1,3)
plot2d3(n,y,style=2)
plot(n,y, "ro")
xgrid()
a.data_bounds = [-1 -2; 3 6]
title("y(n) signal")
xlabel("n")
ylabel("y(n)")
