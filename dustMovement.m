function dv  = dustMovement(x)
    dv = zeros(length(x), 3);
    divide = 0;
    for k = 1:length(x)
        for i = 1:3
            for n = 1:length(x)
                divide = (sqrt((x(k,1)- x(n,1)).^2 + (x(k,2)- x(n,2)).^2+(x(k,3) - x(n,3)).^2)).^(3/2);
                if(divide == 0)
                else
                    dv(k,i) = dv(k,i) + ((x(k,i) - x(n,i))/divide);
                end
            end
            dv(k,i) = -dv(k,i);
        end
    end
end