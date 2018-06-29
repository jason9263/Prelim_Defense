function c = connected_y(ix,x,iy,y,label,matrix)

c = -1;
for indexi = iy  : y
    sign = 0;
    
    for indexj = ix : x
        if matrix(indexj,indexi) == 0 || matrix(indexj,indexi) == label
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
