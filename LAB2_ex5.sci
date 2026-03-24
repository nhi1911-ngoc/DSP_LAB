function[yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1 = -(x1origin - 1) : (length(x1n) - x1origin);
    n2 = -(x2origin - 1) : (length(x2n) - x2origin);
    
    n_start = min(n1(1), n2(1))
    n_end = max(n1($), n2($)); 
    
    n = n_start : n_end;
    
    x1 = zeros(1, length(n));
    x2 = zeros(1, length(n));
    
    idx1 = find(n >= n1(1) & n <= n1($));
    x1(idx1) = x1n;
    
    idx2 = find(n >= n2(1) & n <= n2($));
    x2(idx2) = x2n;
    
    yn = x1 .* x2;
    yorigin = find(n == 0);
    
    printf("y(n) = [");
    for i = 1:length(yn)
        printf("%d ", yn(i));
    end
    printf("], yorigin = %d\n", yorigin);
    
    clf();
    subplot(3,1,1);
    plot2d3(n, x1, style = 2);
    title("Tín hiệu x1(n)");
    xlabel("n"); ylabel("x1(n)");
    xgrid();
    
    subplot(3,1,2);
    plot2d3(n, x2, style = 2);
    title("Tín hiệu x2(n)");
    xlabel("n"); ylabel("x2(n)");
    xgrid();
    
    subplot(3,1,3);
    plot2d3(n, yn, style =5 );
    title("Tín hiệu y(n)");
    xlabel("n"); ylabel("y(n)");
    xgrid();
     
endfunction    
