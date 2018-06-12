function tmpxy = shortest(posi,posj,tmp,len)

sizet = size(tmp);

tmpxy = 50000;

for i = 1:sizet(1)

    mx = min(abs(posi - tmp(i,1)), len - abs(posi - tmp(i,1)) );
    my = min(abs(posj - tmp(i,2)) , len - abs(posj - tmp(i,2)));
    
    mxy = mx + my;
    tmpxy = min(tmpxy,mxy);
 
end

end

