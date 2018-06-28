for i = 1:10
    tmpindex = S(i);
    
    for j = tmpindex+1: 2*50
        neighbor(i,j) = 0;
    end
    
end

S_ext = S;
update = zeros(10,1);

while 1 > 0
    sumS = [];
    
    for i = 1:10
        tmpsumS = sum(neighbor(i,1:S_ext(i)));
        sumS = [sumS;tmpsumS];
    end
    
    [v,index] = min(sumS);
    
    x = pos(index,1);
    y = pos(index,2);
    dis = S(index) + 1;
    
    if index == 2
        index;
    end

    upos = dispos_ext(x,y,dis,50,50,posmatrix,pos,index);
    sizeupos = size(upos);
    
    if sizeupos(1) == 0
        update(index) = 1;
        break;
    else
        for i = 1 : sizeupos(1)
            
            ix = upos(i,1);
            iy = upos(i,2);
            
            posmatrix(ix,iy) = index;
        end
        
        neighbor(index,dis) = sizeupos(1);
        
        S_ext(index) = S_ext(index)+1;
        
    end
    
end