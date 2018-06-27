function tmpxy = shortest(posi,posj,tmp)

sizet = size(tmp);

tmpxy = 50000;

for i = 1:sizet(1)

    mx = abs(posi - tmp(i,1));
    my = abs(posj - tmp(i,2));
    
    mxy = mx + my;
    tmpxy = min(tmpxy,mxy);
 
end

end

