/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 6
  * @exercises      : 4 (file doc)
  * @brief          : Fourier transform of h(n)
  ***********************************************************
**/

// Frequency range
omega = linspace(-%pi, %pi, 2000)

// Frequency response
H = 1 ./ (1 + 0.1*exp(-%i*omega) + 0.2*exp(-2*%i*omega))

// Magnitude spectrum
magnitude = abs(H)

// Phase spectrum
phase = atan(imag(H), real(H))

// Plot magnitude response
subplot(2,1,1)
plot(omega, magnitude)
xtitle("Magnitude Spectrum |H(e^{jω})|")
xlabel("Frequency ω")
ylabel("|H(e^{jω})|")
xgrid()

// Plot phase response
subplot(2,1,2)
plot(omega, phase)
xtitle("Phase Spectrum ∠H(e^{jω})")
xlabel("Frequency ω")
ylabel("Phase (radians)")
xgrid()
