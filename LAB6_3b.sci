// Frequency vector
w = linspace(-%pi, %pi, 1200);

// Fourier transform
X2 = 1 + exp(-%i*w) + exp(-2*%i*w) + exp(-3*%i*w);

// Amplitude & Phase
A2 = abs(X2);
P2 = atan(imag(X2), real(X2));

// Plot
scf(2);
clf();

// Amplitude
subplot(2,1,1);
plot(w, A2);
title("Amplitude Spectrum of X2");
xlabel("omega"); ylabel("|X2|");
xgrid();

// Phase
subplot(2,1,2);
plot(w, P2);
title("Phase Spectrum of X2");
xlabel("omega"); ylabel("Phase (rad)");
xgrid();
