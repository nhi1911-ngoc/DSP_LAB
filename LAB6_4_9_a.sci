// ===== Frequency =====
w = linspace(-%pi, %pi, 200);

// ===== DTFT =====
X = (1 - exp(-%i*6*w)) ./ (1 - exp(-%i*w));

// ===== Plot =====
scf(1); clf();

subplot(2,1,1);
plot(w, abs(X));
xtitle("Amplitude (a)", "omega", "|X|"); xgrid();

subplot(2,1,2);
plot(w, atan(imag(X), real(X)));
xtitle("Phase (a)", "omega", "Phase"); xgrid();
