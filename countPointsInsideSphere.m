function countMartic = countPointsInsideSphere(dust)
%dust - dust cloud matrix
    count = 0;%temp variable that will count points
    r = 0.1;%radiuss
    for k = 1:length(dust)
        count = 0;
        for i = 1:length(dust)
            if(k==1)
                %determine if points are inside (0,0,0) point sphere 
                if((dust(i,1) - 0)^2+(dust(i,2)-0)^2+(dust(i,3)-0)) < (r^2)
                count = count+1;
                end
            %determine if points are inside spheres
            elseif((dust(i,1) - dust(k-1,1))^2+(dust(i,2)-dust(k-1,2))^2+(dust(i,3)-dust(k-1,3)^2)) < (r^2)
                count = count+1;
            end
        end
        if(k==1)
            countMartic(k,1) = count;%points around (0,0,0) point sphere
            countMartic(k,2) = 0;
        else
            countMartic(k,1) = count-1;%take away the point itself
            countMartic(k,2) = k;
        end
      end
end