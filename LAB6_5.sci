// ===== Frequency axis =====
w = linspace(-%pi, %pi, 100);

// ===== Fourier transform Y(w) =====
num = 1 + exp(-%i*w); 
den = 1 - 0.5 * exp(-%i*w);
Y = num ./ den;

// ===== Amplitude & Phase =====
AmpY = abs(Y);
PhaseY = atan(imag(Y), real(Y));

// ===== Plot =====
scf(2);
clf();

// Amplitude spectrum
subplot(2,1,1);
plot2d3(w, AmpY);
xtitle("Amplitude Spectrum of Y(w)", "omega", "|Y(w)|");
xgrid();

// Phase spectrum
subplot(2,1,2);
plot2d3(w, PhaseY);
xtitle("Phase Spectrum of Y(w)", "omega", "Phase (rad)");
xgrid();
