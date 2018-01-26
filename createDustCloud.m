function [dust, dustspeed] = createDustCloud(k)
    %Inicialize dust and dustspeed
    dustCount = 1;
    dust = zeros(k,3);
    dustspeed = zeros(k,3);
    %Define dust coordinates that are inside shpere with r = 1
    while dustCount<=k
        dust(dustCount,1) = rand(1);
        dust(dustCount,2) = rand(1);
        dust(dustCount,3) = rand(1);
        if sqrt(dust(dustCount,1)^2+dust(dustCount,2).^2+dust(dustCount,3).^2) >= 1
            continue;
        else
            dustCount = dustCount+1;
        end
    end

    Xc = calculateMassCenter(dust); %calculate mass weight

    for i = 1:3
        dust(:,i) = dust(:, i)- (Xc(1, i)/k);%Dust position shifting from mass center
    end

    for i =1: length(dust)
        dustspeed(i,1) = 0;
        dustspeed(i,2) = 0;
        dustspeed(i,3) = 0.1.*dust(i,3);%Set dust speed 3
    end
end