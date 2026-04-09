// ============================================================
//  TICH CHAP TUYEN TINH bang FOLDING & SHIFTING
//  x(n) = [1, 2, -3,  2, 1]
//  h(n) = [1, 0, -1, -1, 1]
// ============================================================

clc; clear;

x = [1,  2, -3,  2, 1];
h = [1,  0, -1, -1, 1];

M = length(x);   // = 5
L = length(h);   // = 5
N = M + L - 1;   // = 9  (do dai ngo ra)

y = zeros(1, N);

// --- Buoc 1: Fold h ---
// h_fold(k) = h(-k), luu theo chi so Scilab
// h_fold(1) = h(0) = h(1) trong Scilab
h_fold = h($:-1:1);   // dao nguoc mang h

printf("=== FOLDING & SHIFTING ===\n");
printf("x(k)   = ["); printf(" %3d", x);   printf(" ]\n");
printf("h(k)   = ["); printf(" %3d", h);   printf(" ]\n");
printf("h(-k)  = ["); printf(" %3d", h_fold); printf(" ]\n\n");

// --- Buoc 2: Shift & Multiply & Sum ---
printf("%-5s  %-35s  %s\n", "n", "x(k)*h(n-k)  [k=0..M-1]", "y(n)");
printf("%s\n", repmat("-",1,60));

for n = 0 : N-1
    products = zeros(1, M);
    for k = 0 : M-1
        // h(n-k): chi so trong mang la (n-k)+1
        // neu (n-k) nam ngoai [0, L-1] thi h(n-k) = 0
        idx = n - k;           // chi so logic cua h
        if idx >= 0 & idx <= L-1 then
            h_val = h(idx + 1);  // chuyen sang chi so Scilab
        else
            h_val = 0;
        end
        products(k+1) = x(k+1) * h_val;
    end
    y(n+1) = sum(products);

    // In chi tiet
    prod_str = "[";
    for p = products
        prod_str = prod_str + sprintf("%4d", p);
    end
    prod_str = prod_str + " ]";
    printf("n=%2d:  %s  =>  y(%d) = %3d\n", n, prod_str, n, y(n+1));
end

printf("\n=== KET QUA ===\n");
printf("y(n) = ["); printf(" %3d", y); printf(" ]\n");
printf("       n = 0, 1, 2, ..., 8\n\n");

// --- Kiem tra voi ham conv() cua Scilab ---
y_check = conv(x, h);
printf("=== KIEM TRA voi conv() ===\n");
printf("y_check = ["); printf(" %3d", y_check); printf(" ]\n");

if y == y_check then
    printf("=> Ket qua CHINH XAC!\n");
else
    printf("=> CO SAI SO!\n");
end

// --- Ve do thi ---
n_axis = 0 : N-1;

subplot(3, 1, 1);
bar(0:M-1, x, 0.5);
title("x(n)"); xlabel("n"); ylabel("Bien do");
xgrid();

subplot(3, 1, 2);
bar(0:L-1, h, 0.5);
title("h(n)"); xlabel("n"); ylabel("Bien do");
xgrid();

subplot(3, 1, 3);
bar(n_axis, y, 0.5);
title("y(n) = x(n) * h(n)  [Tich chap tuyen tinh]");
xlabel("n"); ylabel("Bien do");
xgrid();
