function c = connected_y(iy,y,label,matrix)

c = -1;
for i = iy  : y
    sign = 0;
    
    for j = 1 :50
        if matrix(i,j) == 0 || matrix(i,j) == label
            sign = 1;
            break;
        end
    end
    
    if sign == 0
        c = 0;
        return;
    end
    
end

if c == -1
    c = 1;
end

end
