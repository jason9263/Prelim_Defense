function c = connected_x(ix,x,label,matrix)

c = -1;
for i = ix  : x
    sign = 0;
    
    for j = 1 :50
        if matrix(j,i) == 0 || matrix(j,i) == label
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
