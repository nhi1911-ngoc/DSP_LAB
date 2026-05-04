// Frequency vector
omega = linspace(-%pi, %pi, 1200);

// Fourier transform
X1 = 1 ./ (1 - 0.1 * exp(-%i * omega));

// Amplitude & Phase
A1 = abs(X1);
P1 = atan(imag(X1), real(X1));

// Plot
scf(1);
clf();

// Amplitude
subplot(2,1,1);
plot(omega, A1);
title("Amplitude Spectrum of X1");
xlabel("omega"); ylabel("|X1|");
xgrid();

// Phase
subplot(2,1,2);
plot(omega, P1);
title("Phase Spectrum of X1");
xlabel("omega"); ylabel("Phase (rad)");
xgrid();
