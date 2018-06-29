function c = connected_x(ix,x,iy,y,label,matrix)

c = -1;
for indexi = ix  : x
    sign = 0;
    
    for indexj = iy :y
        if matrix(indexi,indexj) == 0 || matrix(indexi,indexj) == label
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
