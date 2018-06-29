function c = connected(i,j,x,y,label,matrix)

cx = -1;
cy = -1;

if x >= i && y >= j
    cx = connected_x(i,x,j,y,label,matrix);
    cy = connected_y(i,x,j,y,label,matrix);
else
    if x < i && y >= j
        cx = connected_x(x,i,j,y,label,matrix);
        cy = connected_y(x,i,j,y,label,matrix);
    else
        if x >= i && y < j
            cx = connected_x(i,x,y,j,label,matrix);
            cy = connected_y(i,x,y,j,label,matrix);
        else
            if x < i && y < j
                cx = connected_x(i,x,y,j,label,matrix);
                cy = connected_y(i,x,y,j,label,matrix);
            end
            
        end
    end
end

if cx == 1 && cy == 1
    c = 1;
else
    c= 0;
end

end
