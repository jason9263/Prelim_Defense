function [posmatrix] = initmatrix(m,n,pos,S)

posmatrix = zeros(m,n);

sizepos = size(pos);


for i = 1: sizepos(1)
    
    x = pos(i,1);
    y = pos(i,2);
    tmp = 0;
    for dis = 1:S(i)
        
        [dpos]= dispos(x,y,dis,m,n);
        
        sizedpos = size(dpos);
        
        for u = 1: sizedpos(1)
            posx = dpos(u,1);
            posy = dpos(u,2);
            
            if posmatrix(posx,posy) == 0
                posmatrix(posx,posy) = i;
                tmp = tmp + 1;
            end
        end
    end
    tmp
end

end