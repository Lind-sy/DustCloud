function Xc = calculateMassCenter(dust)
%dust - dust cloud matrix
    Xc = zeros(1,3);
    for i = 1:3
        Xc(1, i) = sum(dust(:,i));%calculate mass weight
    end
end