function [yn, yorigin] = advance(xn, xorigin, k)
    if k > 0 then
        yn = xn;
        yorigin = xorigin + k;
        
        if (yorigin > length(yn)) then
            add_zero = yorigin - length(yn);
            yn = [yn zeros(1, add_zero)];
        end
        
        n_x = -(xorigin - 1):(length(xn) - xorigin); 
        n_y = -(yorigin - 1):(length(yn) - yorigin);
        
        clf();
        subplot(2,1,1);
        plot2d3(n_x, xn, style = 2);
        title("Tín hiệu gốc x(n)");
        xlabel("n"); ylabel("x(n)");
        xgrid();
        
        subplot(2,1,2);
        plot2d3(n_y, yn, style = 5);
        title("Tín hiệu sau khi advance");
        xlabel("n"); ylabel("y(n)");
        xgrid();
        
        mprintf("Ket qua sau khi advance:\n");
        mprintf("yn = [");
        for i = 1:length(yn)
            mprintf(" %g", yn(i));
        end
        mprintf(" ]\n");
        mprintf("yorigin = %d\n", yorigin);
        
    else 
        disp("Không xử lý vì k <= 0");
        yn = xn;
        yorigin = xorigin;
    end
endfunction
