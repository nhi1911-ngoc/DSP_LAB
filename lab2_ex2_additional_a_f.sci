n = -2:4;
x = [0, 1, 1, 1, 1, 0.5, 0.5];

function val = get_x(n_val, n, x)
    idx = find(n == n_val);
    if idx <> [] then
        val = x(idx);
    else
        val = 0;
    end
endfunction

// ===== (a) x(n - 2) =====
n_a = n + 2;
x_a = x;
scf(1);
plot2d3(n_a, x_a, style=5);
xtitle("x(n - 2)", "n", "Bien do");

// ===== (b) x(4 - n) =====
n_b = (4 - max(n)) : (4 - min(n));  
x_b = zeros(1, length(n_b));
for i = 1:length(n_b)
    idx = find(n == 4 - n_b(i));
    if idx <> [] then
        x_b(i) = x(idx);
    else
        x_b(i) = 0;
    end
end
scf(2);
plot2d3(n_b, x_b, style=5);
xtitle("x(4 - n)", "n", "Bien do");

// ===== (c) x(n + 2) =====
n_c = n - 2;
x_c = x;
scf(3);
plot2d3(n_c, x_c, style=5);
xtitle("x(n + 2)", "n", "Bien do");

// ===== (d) x(n)u(2 - n) =====
x_d = x .* (n <= 2);
scf(4);
plot2d3(n, x_d, style=5);
xtitle("x(n)u(2 - n)", "n", "Bien do");

// ===== (e) x(n-1)δ(n-3) =====
x_e = zeros(1, length(n));
x_e(n == 3) = get_x(2, n, x); 
scf(5);
plot2d3(n, x_e, style=5);
xtitle("x(n-1)δ(n-3)", "n", "Bien do");

// ===== (f) x(n^2) =====
x_f = zeros(1, length(n));
for i = 1:length(n)
    x_f(i) = get_x(n(i)^2, n, x);
end
scf(6);
plot2d3(n, x_f, style=5);
xtitle("x(n^2)", "n", "Bien do");
