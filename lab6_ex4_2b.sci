/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 6
  * @exercises      : 4.2 (b)
  * @brief          : Magnitude and Phase spectra
  ***********************************************************
**/

// Parameters
A = 1
a = 2

// Frequency axis
F = linspace(-10, 10, 1000)

// Fourier spectra
X = (2 * a * A) ./ (a^2 + (2 * %pi * F).^2)

// Amplitude and phase
magX = abs(X)
phaseX = atan(imag(X), real(X))


// ===== Plot =====
scf(0)

// Amplitude spectra
subplot(2,1,1)
plot(F, magX)
xlabel("F")
ylabel("Ampl.|X_a(F)|")
title("Amplitude Spectra")
xgrid()

// Phase spectra
subplot(2,1,2)
plot(F, phaseX)
xlabel("F")
ylabel("Phase (rad)")
title("Phase Spectra")
xgrid()
