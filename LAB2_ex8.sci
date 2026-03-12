/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 2
  * @exercises      : 8
  * @brief          : Manipulated signals
  ***********************************************************
**/

// Signals
n = -2:1
xn = [1 -2 3 6]

n1 = -n($:-1:1)             // Folding
y1 = xn($:-1:1)

n2 = n - 3                  // Shift left 3
y2 = xn

n3 = n1 - 2                 // Folding -> Shift left 2 -> Scaling
y3 = 2 * xn($:-1:1)

// Plots
clf()

// --------------------------------
figure(0)   
subplot(2,1,1)
plot2d3(n,xn,style=2)
plot(n,xn, "ro")
xgrid()
title("x(n) signal")
xlabel("n")
ylabel("x(n)")

subplot(2,1,2)
plot2d3(n1,y1,style=2)
plot(n1,y1, "ro")
xgrid()
title("y1(n) signal")
xlabel("n")
ylabel("y1(n)")

// --------------------------------
figure(1)
f = gcf();
f.background = color('white');

subplot(2,1,1)
plot2d3(n,xn,style=2)
plot(n,xn, "ro")
xgrid()

a = gca()
a.data_bounds = [-5 -2; 1 6]

title("x(n) signal")
xlabel("n")
ylabel("x(n)")

subplot(2,1,2)
plot2d3(n2,y2,style=2)
plot(n2,y2, "ro")
xgrid()

a = gca()
a.data_bounds = [-5 -2; 1 6]

title("y2(n) signal")
xlabel("n")
ylabel("y2(n)")

// --------------------------------
figure(2)
f = gcf();
f.background = color('white');

subplot(2,1,1)
plot2d3(n,xn,style=2)
plot(n,xn, "ro")
xgrid()

a = gca()
a.data_bounds = [-3 -4; 1 12]

title("x(n) signal")
xlabel("n")
ylabel("x(n)")

subplot(2,1,2)
plot2d3(n3,y3,style=2)
plot(n3,y3, "ro")
xgrid()

a = gca()
a.data_bounds = [-3 -4; 1 12]

title("y3(n) signal")
xlabel("n")
ylabel("y3(n)")
