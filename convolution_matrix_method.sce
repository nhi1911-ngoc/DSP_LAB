clc; clear;

// ===== Input =====
x = [1,  2, -3,  2, 1];
h = [1,  0, -1, -1, 1];

M = length(x);       
L = length(h);       
N = M + L - 1;       

// ===== Tao ma tran H =====
H = zeros(N, M);

for col = 1:M
    for k = 1:L
        row = col + k - 1;
        H(row, col) = h(k);
    end
end

// ===== In ma tran H =====
printf("MA TRAN H  (%d x %d)\n", N, M);
printf("      x(0) x(1) x(2) x(3) x(4)\n");
printf("      [");
for i = 1:M
    printf(" %3d", x(i));
end
printf(" ]\n");

printf("%s\n", repmat("-", 1, 40));

for i = 1:N
    printf("n=%d: [", i-1);
    for j = 1:M
        printf(" %3d", H(i,j));
    end
    printf(" ]\n");
end

y = H * x';        
y = y';              


// ===== Tung diem =====
printf("TUNG DIEM\n");
printf("%-5s  %-30s  %s\n", "n", "H(n,:) * x", "y(n)");
printf("%s\n", repmat("-", 1, 60));

for i = 1:N
    row    = H(i,:);
    prods  = row .* x;
    result = sum(prods);

    prod_str = "[";
    for k = 1:length(prods)
        prod_str = prod_str + sprintf("%4d", prods(k));
    end
    prod_str = prod_str + " ]";

    printf("n=%d:   %s  =>  y(%d) = %3d\n", i-1, prod_str, i-1, result);
end

printf("\nKET QUA\n");
printf("y(n) = [");
for i = 1:length(y)
    printf(" %3d", y(i));
end
printf(" ]\n");
printf("n = 0, 1, 2, ..., %d\n\n", N-1);

// ===== Kiem tra =====
y_check = conv(x, h);

printf("KIEM TRA voi conv()\n");
printf("y_check = [");
for i = 1:length(y_check)
    printf(" %3d", y_check(i));
end
printf(" ]\n");

// So sanh dung cach (tranh loi float)
if norm(y - y_check) < 1e-6 then
    printf("=> Ket qua CHINH XAC!\n\n");
else
    printf("=> CO SAI SO!\n\n");
end


