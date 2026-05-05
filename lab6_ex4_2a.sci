/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 6
  * @exercises      : 4.2 (a)
  * @brief          : Magnitude and Phase spectra
  ***********************************************************
**/

// Parameters
A = 1
a = 2

// Frequency axe
F = linspace(-10, 10, 1000)

// Fourier spectra
X = A ./ (a + %i * 2 * %pi * F)

// Amplitude and phase
magX = abs(X)
phaseX = atan(imag(X), real(X))

// ===== Plot =====
scf(0)

// Amplitude spectra
subplot(2,1,1)
plot(F, magX)
xlabel("F")
ylabel("Ampl. |X_a(F)|")
title("Amplitude Spectra")
xgrid()

// Phase spectra
subplot(2,1,2)
plot(F, phaseX)
xlabel("F")
ylabel("Phase (rad)")
title("Phase Spectra")
xgrid()
