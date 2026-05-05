/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 6
  * @exercises      : 4.4
  * @brief          : Magnitude and Phase spectra
  ***********************************************************
**/

// Parameters
N = 6
n = -4:4

// One period centered at n=0
x = [1 0 1 2 3 2 1 0 1]

// Frequency index
k = 0:N-1

// One base period for DTFS
n0 = -4:1
x0 = [1 0 1 2 3 2]

// Fourier spectra
c = zeros(1, N)

for kk = 1:N
    for nn = 1:N
        c(kk) = c(kk) + x0(nn) * exp(-%i * 2 * %pi * (kk-1) * n0(nn) / N)
    end
end

c = c / N

// Magnitude and phase
magC = abs(c)

phaseC = zeros(1, N)
for i = 1:N
    if magC(i) < 1e-10 then
        phaseC(i) = 0
    else
        phaseC(i) = atan(imag(c(i)), real(c(i)))
    end
end


// ===== Plot =====
scf(0)

// x(n)
subplot(3,1,1)
plot2d3(n, x, style=2)
plot(n, x, "ro")
xgrid()
title("Signal x(n)")
xlabel("n")
ylabel("x(n)")

// Magnitude spectra
subplot(3,1,2)
plot2d3(k, magC, style=2)
plot(k, magC, "ro")
xgrid()
title("Magnitude Spectra")
xlabel("k")
ylabel("Mag. |c_k|")

// Phase spectra
subplot(3,1,3)
plot2d3(k, phaseC, style=2)
plot(k, phaseC, "ro")
xgrid()
title("Phase Spectra")
xlabel("k")
ylabel("Phase (rad)")
