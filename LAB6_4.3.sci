// ===== Parameter =====
tau = 1;

// ===== Frequency axis =====
F = linspace(-10, 10, 800);
F(F==0) = %eps; // avoid division by 0

// ===== Fourier transform =====
X = -sin(2*%pi*F*tau)./(%pi*F) ...
    - 2*(cos(2*%pi*F*tau)-1)./((2*%pi*F).^2 * tau);

// ===== Amplitude =====
Amp = abs(X);

// ===== Plot =====
scf(1); clf();
plot(F, Amp);
xtitle("Amplitude Spectrum Xa(F)", "F", "|Xa(F)|");
xgrid();
