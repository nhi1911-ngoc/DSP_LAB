/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 1
  * @exercises      : 2
  * @brief          : ADC conversion
  ***********************************************************
**/

// Signals
t = 0:0.001:0.1
xt = 3*sin(100*%pi*t)

N = 6
n = 0:1:5*N-1                 // 5 periods
xn = 3*sin(%pi*n/3)

delta = 0.1
xr = round(xn*1e6)/1e6        // round to remove floating-point error
xq = floor(xr/delta)*delta    // truncated method

// Plots
clf()
subplot(3,1,1)
plot(t,xt, "r-")
xgrid()
xtitle("Analog Signal")
xlabel("t")
ylabel("x(t)")

subplot(3,1,2)
plot2d3(n,xn,style=2)
plot(n,xn, "ro")
xgrid()
xtitle("Discrete Signal")
xlabel("n")
ylabel("x(n)")

subplot(3,1,3)
plot2d3(n,xq,style=2)
plot(n,xq, "ro")
xgrid()
xtitle("Quantized Signal")
xlabel("n")
ylabel("xq(n)")
