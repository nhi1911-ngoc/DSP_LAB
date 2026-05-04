// ===== Frequency locations =====
w = [-3*%pi/4, -%pi/2, -%pi/4, 0, %pi/4, %pi/2, 3*%pi/4];

// ===== Power values =====
P = [1/8, 0.5, 2, 4, 2, 0.5, 1/8];

// ===== Plot =====
scf(1); clf();
plot2d3(w, P);

xtitle("Power Spectrum of x(n)", "omega", "Power");
xlabel("omega (rad/sample)");
ylabel("Power");
xgrid();
